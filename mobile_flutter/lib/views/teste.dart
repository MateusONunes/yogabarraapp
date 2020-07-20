import 'package:flutter/material.dart';
import '../utils/AlertDialogs.dart';

class Teste extends StatefulWidget {
  @override
  _TesteState createState() => _TesteState();
}

class _TesteState extends State<Teste> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Teste"),
          backgroundColor: Colors.cyan,
        ),
        body: Container(
            child: Column(
              children: <Widget>[
                FlatButton(
                    onPressed: (){
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Título da Mensagem"),
                              content: Text("Texto da mensagem"),
                              actions: [
                                FlatButton(
                                  child: Text("OK"),
                                  onPressed: () { Navigator.of(context).pop();},
                                ),FlatButton(
                                  child: Text("Cancelar"),
                                  onPressed: () { Navigator.of(context).pop();},
                                ),
                              ]
                            );
                          }
                      );
                    },
                    child: Text("Teste")
                ),FlatButton(
                    onPressed: (){showAlertDialog(context, 'teste de título', 'Teste de mensagem');},
                    child: Text("Teste-2")
                ),
              ],
            )
        )
    );
  }
}
