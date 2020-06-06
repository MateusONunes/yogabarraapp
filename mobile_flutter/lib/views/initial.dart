/*
Tela "Gerenciar Produtois" - Tela que exibe grid de produtos com opção editar/excluir

**/
import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class Initial extends StatefulWidget{
  @override
  _InitialState createState() => _InitialState();
}

class _InitialState extends State<Initial> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: AppBar(
          title: Text('Seja bem vindo')
        ),
        drawer: AppDrawer(),
        body: Column(
          children: <Widget>[
            Expanded(
              child:
                Image.asset('assets/images/yogabarra.png')
            )
          ],
        )
      );

  }
}
