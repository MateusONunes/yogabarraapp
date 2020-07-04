import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shop/data/store.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shop/exceptions/auth_exception.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../utils/constants.dart';

class Auth with ChangeNotifier {
  String _userId;
  String _token;
  DateTime _expiryDate;
  Timer _logoutTimer;
  AuthType _authType = AuthType.unlogged;

  final GoogleSignInAccount googleUser = null;

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email'
    ],
  );


  bool get isAuth {
    return token != null;
  }

  String get userId {
    return isAuth ? _userId : null;
  }

  String get token {
    if (_token != null &&
        _expiryDate != null &&
        _expiryDate.isAfter(DateTime.now())) {
      return _token;
    } else {
      return null;
    }
  }

  Future<void> _authenticateUser(
    String token, String userId, String expiresIn, AuthType authType) async {

    _token = token;
    _userId = userId;
    _expiryDate = DateTime.now().add(
      Duration(
        seconds: int.parse(expiresIn),
      ),
    );

    _authType = authType;

    Store.saveMap('userData', {
      "token": _token,
      "userId": _userId,
      "expiryDate": _expiryDate.toIso8601String(),
    });

    _autoLogout();
    notifyListeners();
  }

  Future<void> _authenticate(
      String email, String password, String urlSegment) async {
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:$urlSegment?key=AIzaSyDvAevOJWyDWo-YtstOFwub_L3rqENWd68';

    final response = await http.post(
      url,
      body: json.encode({
        "email": email,
        "password": password,
        "returnSecureToken": true,
      }),
    );

    final responseBody = json.decode(response.body);
    if (responseBody["error"] != null) {
      throw AuthExceptionShow(responseBody['error']['message']);
    } else {

      _authenticateUser(responseBody["idToken"], responseBody["localId"], responseBody["expiresIn"], AuthType.email);
    }

    return Future.value();
  }


Future<void> googleAcount() async {
    try {
      final FirebaseAuth _auth = FirebaseAuth.instance;

      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final FirebaseUser user = (await _auth.signInWithCredential(credential)).user;

      _authenticateUser(user.uid, 
                        googleAuth.idToken, 
                        '3600', 
                        AuthType.googleAccount);

      return user;
    }catch (e) {
      print(e.message);
    }
  } 

  Future<void> signup(String email, String password) async {
    return _authenticate(email, password, "signUp");
  }

  Future<void> login(String email, String password) async {
    return _authenticate(email, password, "signInWithPassword");
  }

  Future<void> tryAutoLogin() async {
    if(isAuth) {
      return Future.value();
    }

    final userData = await Store.getMap('userData');
    if(userData == null) {
      return Future.value();
    }

    final expiryDate = DateTime.parse(userData["expiryDate"]);

    if(expiryDate.isBefore(DateTime.now())) {
      return Future.value();
    }

    _userId = userData["userId"];
    _token = userData["token"];
    _expiryDate = expiryDate;
    _authType = userData["authType"];

    _autoLogout();
    notifyListeners();
    return Future.value();
  }

  void logout() async {
    _token = null;
    _userId = null;
    _expiryDate = null;
    if (_logoutTimer != null) {
      _logoutTimer.cancel();
      _logoutTimer = null;
    }

    if (_authType == AuthType.googleAccount){
      await _googleSignIn.signOut();
    }

    _authType = AuthType.unlogged;

    Store.remove('userData');
    notifyListeners();
  }

  void _autoLogout() {
    if (_logoutTimer != null) {
      _logoutTimer.cancel();
    }
    final timeToLogout = _expiryDate.difference(DateTime.now()).inSeconds;
    _logoutTimer = Timer(Duration(seconds: timeToLogout), logout);
  }
}
