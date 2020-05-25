import 'package:flutter/material.dart';

/*
class Initial extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Tela Inicial')
        )
      )
    );
  }
}
*/

class Initial extends StatefulWidget {
  // This widget is the root of your application.
  InitialState createState(){
    return InitialState();
  }
}

class InitialState extends State<Initial> {
  @override


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela Inicial')
      )
    );
  }
}

