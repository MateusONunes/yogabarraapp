import 'package:flutter/material.dart';
import './screens/initial.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    home: YogaBarraApp(),
  ));
}


class YogaBarraApp extends StatefulWidget {
  // This widget is the root of your application.
  YogaBarraAppState createState(){
    return YogaBarraAppState();
  }
}

class YogaBarraAppState extends State<YogaBarraApp> {
  @override

  var CompanyName = 'Yoga da Barra';

  final Frases = ['Pratique Yoga, Faz bem para sua vida',
                  'Viva e Deixe Viver',
                  'Viva o Presente'];

  var FraseGerada = 'Pratique Yoga, Faz bem para sua vida';

  void NovaFrase(){
    var Sorteio = Random().nextInt(Frases.length);

    setState((){
      FraseGerada = Frases[Sorteio];
    });
  }

  void Login(BuildContext context){
    Navigator.push(context,  //172. Navegando para uma Nova Tela - 07:30 - https://www.udemy.com/course/curso-flutter/learn/lecture/18383450#questions
                   MaterialPageRoute(
                   builder: (context) => Initial()
    ));
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(CompanyName)
        ),
        body: Column(
          children: <Widget>[
            Text(CompanyName),
            RaisedButton(
              child: Text('Entrar'),
              onPressed: () => Login(context)
                /*
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => TelaSecundaria()
                    ),
                );
                */
            ),
            RaisedButton(
              child: Text('Sair'),
              onPressed: () {print('sair');},
            ),
            InkWell( // 172. Navegando para uma Nova Tela-04:17-https://www.udemy.com/course/curso-flutter/learn/lecture/18383450#questions
              onTap: () => NovaFrase(),
              borderRadius: BorderRadius.circular(15),
              //splashColor: Theme.of(context).#FFFFFF,

              child: Text(FraseGerada),
            ),



/*            RaisedButton(
              child: Text('Sobre'),
              onPressed: () => print('Sobre'),
            )
*/            
          ],
        )
      )
    );
  }
}
