// Desenvolva uma tela que utilize o widget Card para exibir informações de produtos
// fictícios.
// Os cards devem conter uma imagem, título e descrição.

// Desenvolva uma interface que faça uso dos widgets Row e Column para organizar
// elementos de forma horizontal e vertical.
// Adicione diversos widgets (como Text, Icon e Image) para demonstrar a organização.

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
          title: Text('Exercicío 8 - Widget Card'),
        ),
        body: Center(
          child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      leading: Icon(Icons.album),
                      title: Text('Card 1'),
                    ),
                    Image.network(
                      'https://imgs.search.brave.com/so6bclYur-RRzVYgStSjJBcVNLCiQuEIYPHG94zpieQ/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9wb3J0/YWxkb2NvbG9yYWRv/LmNvbS5ici93cC1j/b250ZW50L3VwbG9h/ZHMvMjAyMi8wNi9l/c3BvcnRlLWNvcGEt/dGFjYS0yMDE4MDYx/NC0wMDEtMS02ODB4/NDMwLmpwZw',
                    fit:BoxFit.cover,
                    ),
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'Descrição',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      )
                  ],
                ),
              ),
              
        ),
      ),
    );
  }
}
