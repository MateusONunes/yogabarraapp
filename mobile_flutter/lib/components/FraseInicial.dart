/*
https://www.udemy.com/course/curso-flutter/learn/lecture/17939042#questions
37. Criando Widget Questão
Componentização - Criando componentes

*/
import 'package:flutter/material.dart';


class FraseInicial extends StatelessWidget {
  
  final void Function() 
  
  FraseInicial(this.FraseGerada);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Text(
        FraseGerada,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}