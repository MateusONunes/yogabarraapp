import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shop/utils/constants.dart';
import './person_pers.dart';

class Person_perss with ChangeNotifier {
  final String _baseUrl = '${Constants.BASE_API_URL}/person_pers';
  List<Person_pers> _items = [];
  final int _take = 50;

  String _token;
  String _userId;

  Person_perss([this._token, this._userId, this._items = const []]);

  List<Person_pers> get items => [..._items];

  int get itemsCount {
    return _items.length;
  }

  Future<void> reloadStudents() async {
    _items = [];
    await loadStudents();
    notifyListeners();
  }

  Future<void> loadStudents() async {
    // Firestore db = Firestore.instance;
    // QuerySnapshot querySnapshot = null;
    //
    // if (_items.length == 0) {
    //   querySnapshot = await db
    //     .collection("person_pers")
    //     .orderBy('id')
    //     .limit(_take)
    //     .getDocuments();
    // }else{
    //   int lastId = int.parse(items[_items.length - 1].id);
    //   querySnapshot = await db
    //     .collection("person_pers")
    //     .orderBy('id')
    //     .startAfter([lastId])
    //     .limit(_take)
    //     .getDocuments();
    // }
    //
    // for(DocumentSnapshot item in querySnapshot.documents) {
    //
    //   var dados = item.data;
    //   _items.add(Person_pers(
    //       id: dados['code_pers'].toString(),
    //       code_pers: dados['code_pers'].toString(),
    //       name_pers: dados['name_pers'],
    //       nickname_pers: dados['nickname_pers'],
    //       address_pers: dados['address_pers'],
    //       city_pers: dados['city_pers'],
    //       cpf_pers: dados['cpf_pers'],
    //       rg_pers: dados['rg_pers'],
    //       birth_pers: dados['birth_pers'],
    //       phonewhats_pers: dados['phonewhats_pers'],
    //       email_pers: dados['email_pers'],
    //       comments_pers: dados['comments_pers']
    //     ));
    // }
    //
    // return Future.value();
  }

  Future<void> addPerson_pers(Person_pers newPerson_pers) async {
    // int code_pers = 100;
    //
    // if (newPerson_pers.code_pers != null){
    //   code_pers = int.parse(newPerson_pers.code_pers);
    // } else {
    //   Firestore db = Firestore.instance;
    //   QuerySnapshot querySnapshot = await db
    //     .collection("sequence")
    //     .getDocuments();
    //
    //   for(DocumentSnapshot item in querySnapshot.documents) {//TODO - Tirar do Laço
    //     var dados = item.data;
    //     code_pers = dados['code_pers'];
    //   }
    //
    //   code_pers++;
    //
    //   Firestore.instance.collection("sequence").document('1').setData({"code_pers": code_pers});
    // }
    //
    // Firestore.instance.collection("person_pers").document(code_pers.toString()).setData(
    //   {
    //     "id": code_pers,
    //     "code_pers": code_pers,
    //     "name_pers": newPerson_pers.name_pers,
    //     "nickname_pers": newPerson_pers.nickname_pers,
    //     "address_pers": newPerson_pers.address_pers,
    //     "city_pers": newPerson_pers.city_pers,
    //     "cpf_pers": newPerson_pers.cpf_pers,
    //     "rg_pers": newPerson_pers.rg_pers,
    //     "birth_pers": newPerson_pers.birth_pers,
    //     "phonewhats_pers": newPerson_pers.phonewhats_pers,
    //     "email_pers": newPerson_pers.email_pers,
    //     "comments_pers": newPerson_pers.comments_pers,
    //   }
    // );
    //
    // if (newPerson_pers.code_pers == null) {
    //   _items.add(Person_pers(
    //     id: code_pers.toString(),
    //     code_pers: code_pers.toString(),
    //     name_pers: newPerson_pers.name_pers,
    //     nickname_pers: newPerson_pers.nickname_pers,
    //     address_pers: newPerson_pers.address_pers,
    //     city_pers: newPerson_pers.city_pers,
    //     cpf_pers: newPerson_pers.cpf_pers,
    //     rg_pers: newPerson_pers.rg_pers,
    //     birth_pers: newPerson_pers.birth_pers,
    //     phonewhats_pers: newPerson_pers.phonewhats_pers,
    //     email_pers: newPerson_pers.email_pers,
    //     comments_pers: newPerson_pers.comments_pers,
    //   ));
    // } else {
    //   final indexPerson = _items.indexWhere((person) => person.id == newPerson_pers.id);
    //   _items[indexPerson] = newPerson_pers;
    // }
    // notifyListeners();
  }

  Future<void> deletePerson(String id) async {
    // final index = _items.indexWhere((person) => person.id== id);
    // if (index >= 0) {
    //   final person_pers = _items[index];
    //
    //   Firestore db = Firestore.instance;
    //
    //   db.collection('person_pers').document(id.toString()).delete()
    //     .then((value) {
    //       _items.remove(person_pers);
    //        notifyListeners();
    //     });
    //
    // }
  }
}
