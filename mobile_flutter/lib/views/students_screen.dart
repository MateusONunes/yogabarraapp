/*
Tela "Gerenciar Produtois" - Tela que exibe grid de produtos com opção editar/excluir

**/
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/app_drawer.dart';
import '../providers/person_perss.dart';
import '../utils/app_routes.dart';
import '../widgets/student_item.dart';
import '../utils/AlertDialogs.dart';

class StudentsScreen extends StatefulWidget{
  @override
  _StudentsScreenState createState() => _StudentsScreenState();
}

class _StudentsScreenState extends State<StudentsScreen> {

  int _totalItens;

  void initState() {
    super.initState();

    _loadStudents(context);
  }

  Future<void> _refreshStudents(BuildContext context) {
    final person_persData = Provider.of<Person_perss>(context, listen: false);

    return person_persData.reloadStudents()
    .then((_) {
      setState((){
        _totalItens = person_persData.itemsCount;
      });
    });
  }

  Future<Null> _loadStudents(BuildContext context) async {
    final person_persData = Provider.of<Person_perss>(context, listen: false);

    person_persData.loadStudents()
    .then((_) {
      if (_totalItens != person_persData.itemsCount){
        setState((){
          _totalItens = person_persData.itemsCount;
        });
      }
    })
    .catchError((e) {
        showError(context, e.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    final person_persData = Provider.of<Person_perss>(context);
    final person_pers = person_persData.items;

    return Scaffold(
      appBar: AppBar(
        title: Text('Gerenciar Alunos - ${_totalItens}'),
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
            itemBuilder: (ctx, i) {

              if (i >= person_persData.itemsCount-1){
                _loadStudents(context);
              }

              return Column(
                children: <Widget>[
                StudentItem(person_pers[i]),
                Divider(),
              ],
              );
            }
          ),
        ),
      ),
    );
  }
}
