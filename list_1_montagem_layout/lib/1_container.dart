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
            children: [
              Column(
                children: [
                  Container(
                    color: Colors.red,
                    width: 100,
                    height: 100,
                    child: Text("Container 1")
                  ),
                  Container(
                    color: Colors.blue,
                    width: 200,
                    height: 200,
                    child: Text("Container 2")
                  ),
                  Container(
                    color: Colors.purple,
                    width: 300,
                    height: 150,
                    child: Text("Container 3")
                  ),
                ],
              )
             
              ],
            ),
            ),
        ),
    );
  }
}
