// Crie um aplicativo Flutter que utilize o widget Container para criar um layout básico.
// Adicione pelo menos três widgets filhos dentro do Container com diferentes estilos e
// cores.

import 'package:flutter/material.dart';

void main() {
  runApp(Exercise1());
}

class Exercise1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Exercicío 1'),
        ),
        body: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      color: Color.fromARGB(255, 117, 208, 238),
                      width: 100,
                      height: 100,
                      child: Icon(Icons.ice_skating)),
                  SizedBox(height: 16.0),
                  Container(
                      color: Color.fromARGB(255, 231, 243, 123),
                      width: 100,
                      height: 100,
                      child: Icon(Icons.sunny)),
                  SizedBox(height: 16.0),
                  Container(
                      color: Color.fromARGB(255, 243, 143, 123),
                      width: 100,
                      height: 100,
                      child: Icon(Icons.hot_tub)),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      color: Color.fromARGB(255, 117, 238, 155),
                      width: 100,
                      height: 100,
                      child: Icon(Icons.nature)),
                  SizedBox(height: 16.0),
                  Container(
                      color: Color.fromARGB(255, 123, 239, 243),
                      width: 100,
                      height: 100,
                      child: Icon(Icons.cloud)),
                  SizedBox(height: 16.0),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      color: Color.fromARGB(255, 161, 132, 254),
                    ),
                      // color: Color.fromARGB(255, 243, 143, 123),
                      width: 100,
                      height: 100,
                      child: Icon(Icons.star_purple500)),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      color: Color.fromARGB(255, 247, 147, 189),
                      width: 100,
                      height: 100,
                      child: Icon(Icons.flourescent)),
                  SizedBox(height: 16.0),
                  Container(
                      color: Color.fromARGB(255, 200, 242, 244),
                      width: 100,
                      height: 100,
                      child: Icon(Icons.token)),
                  SizedBox(height: 16.0),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      color: Color.fromARGB(255, 221, 143, 245),
                    ),
                      // color: Color.fromARGB(255, 243, 143, 123),
                      width: 100,
                      height: 100,
                      child: Icon(Icons.science)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
