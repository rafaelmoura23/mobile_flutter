// Construa uma página que contenha um ListView com pelo menos 10 itens.
// Cada item deve ser representado por um card simples, exibindo informações fictícias.

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // int numeroSorteado = Random().nextInt(10) + 1;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('List View | Classificação ⚽'),
        ),
        body: ListView.builder (
          // quantidade de cards
          itemCount: 10,
          itemBuilder: (context,index) {
            return Card(
              child: ListTile(
                // itens de dentro de cada card
                leading: Icon(Icons.sports_soccer),
                title: Text('Time $index'),
                subtitle: Text('Gols: $index')
              ),
            );
          },
          ),
        ),
      );
  }
}

