import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_academias/exceptions/http_exception.dart';
import 'package:app_academias/utils/GlobalObjects.dart';
import '../utils/app_routes.dart';

class StudentItem extends StatelessWidget {
  GestorService gestorService = null;

  // final Person_pers person_pers;
  final Pessoa pessoa;

  StudentItem(this.pessoa);

  @override
  Widget build(BuildContext context) {
    GestorService gestorService = Provider.of(context);

    final scaffold = Scaffold.of(context);
    return ListTile(
      title: Text('${pessoa.codigopess} - ${pessoa.nomepess??''}'),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              color: Theme.of(context).primaryColor,
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(AppRoutes.STUDENTS_FORM, arguments: pessoa);
              },
            ),
            IconButton(
              icon: Icon(Icons.delete),
              color: Theme.of(context).errorColor,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: Text('Excluir Aluno'),
                    content: Text('Tem certeza?'),
                    actions: <Widget>[
                      FlatButton(
                        child: Text('Não'),
                        onPressed: () => Navigator.of(context).pop(false),
                      ),
                      FlatButton(
                        child: Text('Sim'),
                        onPressed: () => Navigator.of(context).pop(true),
                      ),
                    ],
                  ),
                ).then((value) async {
                  if (value) {
                    try {
                      await gestorService.pessoaList.deletePessoa(pessoa.codigopess);
                      gestorService.notifyListeners();
                    } on HttpException catch (error) {
                      scaffold.showSnackBar(
                        SnackBar(
                          content: Text(error.toString()),
                        ),
                      );
                    }
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
