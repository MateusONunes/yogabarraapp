/**
 * app_drawer.dart          => Menu Lateral da aplicação
 * products_screen.dart     => Grid de exibição dos produtos
 * product_form_screen.dart => Formulário de Cadastro de Produtos (Alunos)
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_academias/service/GestorService.dart';
import 'package:app_academias/views/auth_home_screen.dart';

import './views/auth_home_screen.dart';
import './utils/app_routes.dart';
import './views/students_screen.dart';
import './views/students_form.dart';
import './views/initial.dart';
import './views/teste.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => new GestorService(),
        // create: (_) => new Auth(),
        child: MaterialApp(
          title: 'Yoga App',
          theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.deepOrange,
            fontFamily: 'Lato',
          ),
          // home: ProductOverviewScreen(),
          routes: {
            AppRoutes.AUTH_HOME: (ctx) => AuthOrHomeScreen(),
            AppRoutes.HOME: (ctx) => Initial(),
            AppRoutes.STUDENTS: (ctx) => StudentsScreen(),
            AppRoutes.STUDENTS_FORM: (ctx) => StudentsFormScreen(),
            AppRoutes.TESTE: (ctx) => Teste(),
          },
        ));
  }
}
