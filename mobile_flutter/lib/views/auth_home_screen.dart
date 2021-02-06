import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth.dart';
import './auth_screen.dart';
import '../views/initial.dart';
import 'package:app_academias/utils/GlobalObjects.dart';

class AuthOrHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GestorService gestorService = Provider.of(context);

    return FutureBuilder(
      future: gestorService.tryAutoLogin(),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.error != null) {
          return Center(child: Text('Ocorreu um erro!'));
        } else {
          return gestorService.auth.isAuth ? Initial() : AuthScreen();
        }
      },
    );
  }
}
