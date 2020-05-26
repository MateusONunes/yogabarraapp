/*
https://www.udemy.com/course/curso-flutter/learn/lecture/17939042#questions
37. Criando Widget Questão
Componentização - Criando componentes

*/
import 'package:flutter/material.dart';


class FraseInicial extends StatelessWidget {
  
  final void Function() FraseGeradaOnTap;
  
  FraseInicial(this.FraseGerada, this.FraseGeradaOnTap);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child:InkWell( // 172. Navegando para uma Nova Tela-04:17-https://www.udemy.com/course/curso-flutter/learn/lecture/18383450#questions
        onTap: () => FraseGeradaOnTap(),
        borderRadius: BorderRadius.circular(15),
        //splashColor: Theme.of(context).#FFFFFF,

        child: Text(
          FraseGerada,
          style: TextStyle(fontSize: 28),
          textAlign: TextAlign.center,
        ),
      ),      
     
      
    );
  }
}