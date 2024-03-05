// Construa uma página que contenha um ListView com pelo menos 10 itens.
// Cada item deve ser representado por um card simples, exibindo informações fictícias.

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('List View'),
        ),
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text('Pessoa $index'),
                subtitle: Text('Cargo $index'),
                trailing: Icon(Icons.arrow_forward),
              ),
            );
          },
        ),
      ),
    );
  }
}

