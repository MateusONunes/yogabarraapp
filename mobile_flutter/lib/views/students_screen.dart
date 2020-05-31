/*
Tela "Gerenciar Produtois" - Tela que exibe grid de produtos com opção editar/excluir

**/
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/app_drawer.dart';
import '../providers/person_perss.dart';
import '../utils/app_routes.dart';
import '../widgets/student_item.dart';

class StudentsScreen extends StatelessWidget {

  Future<void> _refreshStudents(BuildContext context) {
    return Provider.of<Person_perss>(context, listen: false).loadStudents();
  }

  @override
  Widget build(BuildContext context) {
    final person_persData = Provider.of<Person_perss>(context);
    final person_pers = person_persData.items;
    return Scaffold(
      appBar: AppBar(
        title: Text('Gerenciar Alunos'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(
                AppRoutes.STUDENTS_FORM,
              );
            },
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: RefreshIndicator(
        onRefresh: () => _refreshStudents(context),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListView.builder(
            itemCount: person_persData.itemsCount,
            itemBuilder: (ctx, i) => Column(
              children: <Widget>[
                StudentItem(person_pers[i]),
                Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
