/*
Menu lateral
*/

import 'package:flutter/material.dart';
import '../utils/app_routes.dart';
import '../providers/auth.dart';
import 'package:provider/provider.dart';

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
              Navigator.of(context).pushNamed(
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
            // onTap: () {
            // }
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Teste'),
            onTap: () {
              Navigator.of(context).pushNamed(AppRoutes.TESTE);

              //Navigator.of(context).pushReplacementNamed(AppRoutes.TESTE);
            },
          ),  
          Divider(),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Sair'),
            onTap: () {
              Provider.of<Auth>(context, listen: false).logout();
            },
          ),          
          
        ],
      ),
    );
  }
}
