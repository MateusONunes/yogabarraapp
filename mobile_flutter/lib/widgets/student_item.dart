import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/exceptions/http_exception.dart';

import '../providers/person_pers.dart';
import '../providers/person_perss.dart';
import '../utils/app_routes.dart';

class StudentItem extends StatelessWidget {
  final Person_pers person_pers;

  StudentItem(this.person_pers);

  @override
  Widget build(BuildContext context) {
    final scaffold = Scaffold.of(context);
    return ListTile(
      title: Text('${person_pers.code_pers} - ' + person_pers.name_pers),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              color: Theme.of(context).primaryColor,
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(AppRoutes.STUDENTS_FORM, arguments: person_pers);
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
                      await Provider.of<Person_perss>(context, listen: false)
                          .deletePerson(person_pers.id);
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
