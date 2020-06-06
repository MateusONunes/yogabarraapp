/*
Menu lateral
*/

import 'package:flutter/material.dart';
import '../utils/app_routes.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('Escolha uma Opção'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Alunos'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                AppRoutes.STUDENTS,
              );
            },
          ),          
          Divider(),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Aulas e Preços'),
            /*onTap: () {
              Navigator.of(context).pushReplacementNamed(
                AppRoutes.STUDENTS,
              );
            },*/
          ),          
          Divider(),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Meus Pagamentos'),
            /*onTap: () {
              Navigator.of(context).pushReplacementNamed(
                AppRoutes.STUDENTS,
              );
            },*/
          ),          
          Divider(),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Presenças'),
            /*onTap: () {
              Navigator.of(context).pushReplacementNamed(
                AppRoutes.STUDENTS,
              );
            },*/
          ),          
          
        ],
      ),
    );
  }
}
