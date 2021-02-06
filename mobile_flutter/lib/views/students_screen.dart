/*
Tela "Gerenciar Produtois" - Tela que exibe grid de produtos com opção editar/excluir

**/
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/app_drawer.dart';
import '../utils/app_routes.dart';
import '../widgets/student_item.dart';
import '../utils/AlertDialogs.dart';
import 'package:app_academias/utils/GlobalObjects.dart';

class StudentsScreen extends StatefulWidget{
  @override
  _StudentsScreenState createState() => _StudentsScreenState();
}

class _StudentsScreenState extends State<StudentsScreen> {
  GestorService gestorService = null;

  int _totalItens;

  void initState() {
    super.initState();
  }

  Future<void> _refreshStudents(BuildContext context) {
    _totalItens = -1;
    _loadStudents(context);
  }

  Future<Null> _loadStudents(BuildContext context) async {
    final pessoaList = gestorService.pessoaList;
    print('xx');

    pessoaList.carregarPessoas()
    .then((_) {
      if (_totalItens != pessoaList.itemsCount){
        setState((){
          _totalItens = pessoaList.itemsCount;
        });
      }
    })
    .catchError((e) {
        showError(context, e.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    bool carregarPessoas = gestorService == null;

    gestorService = Provider.of(context);

    if (carregarPessoas)
      _loadStudents(context);

    final pessoaList = gestorService.pessoaList.items;

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
//      drawer: AppDrawer(),
      body: RefreshIndicator(
        onRefresh: () => _refreshStudents(context),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListView.builder(
            itemCount: pessoaList.length,
            itemBuilder: (ctx, i) {
              return Column(
                children: <Widget>[
                StudentItem(pessoaList[i]),
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
