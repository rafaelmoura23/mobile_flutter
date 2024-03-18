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
        body: ListView.builder (
          // quantidade de cards
          itemCount: 5,
          itemBuilder: (context,index) {
            return Card(
              color: Color.fromARGB(255, 159, 227, 245),
              elevation: 7.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: ListTile(
                
                // itens de dentro de cada card
                leading: Image.network("https://imgs.search.brave.com/lCZfFZFh2g_7F7kp5rhwauOAO42-esoigtE7tBeYMVc/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9wbHVz/cG5nLmNvbS9pbWct/cG5nL3BuZy1mb3It/c2NpZW5jZS0tMzE2/LnBuZw"),
                iconColor: Color.fromARGB(255, 10, 68, 116),
                title: Text('Experience'),
                subtitle: Text('Nota: $index'),
                trailing: Icon(Icons.science),
                textColor: const Color.fromARGB(255, 48, 69, 104),
              ),
              
            );
          },
          ),
        ),
      );
  }
}

