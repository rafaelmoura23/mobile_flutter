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
          title: Text('Exercicío 2'),
        ),
        body: Container(
          child: Row(
            children: [
              Column(
                children: [
                  Text("Coluna 1"),
                  Icon(Icons.abc),
                  Icon(Icons.people),
                  Icon(Icons.catching_pokemon)
                ],
              ),
              SizedBox(width: 16.0),
              Column(
                children: [
                  Text("Coluna 2"),
                  Text("Nome"),
                  Text("Rafael"),
                  Container(
                    width: 100.0, // Define a largura desejada da imagem
                    height: 100.0, // Define a altura desejada da imagem
                    child: Image.asset('..//lib/assets/flutter.png'),
                  )
                ],
              ),
              SizedBox(width: 16.0),
              Column(
                children: [
                  Text("Coluna 3"),
                  Text("Idade"), 
                  Text("20 anos"),
                  Container(
                    width: 100.0, // Define a largura desejada da imagem
                    height: 100.0, // Define a altura desejada da imagem
                    child: Image.network('https://imgs.search.brave.com/v5SISfnf2pD8H0-1PueumhYLHIox0uppHmzcTo29ddY/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9jYW1v/LmdpdGh1YnVzZXJj/b250ZW50LmNvbS8y/ODkyNGE4Y2YzOTlj/NDg5YTVkZWJmZGQ5/ZTFmNTBmZDRmOTM2/ZmFmN2RlZmQ0MDFh/NGRjZjhjM2Y1ZjE5/MDA4LzY4NzQ3NDcw/NzMzYTJmMmY3Mzc0/NmY3MjYxNjc2NTJl/Njc2ZjZmNjc2YzY1/NjE3MDY5NzMyZTYz/NmY2ZDJmNjM2ZDcz/MmQ3Mzc0NmY3MjYx/Njc2NTJkNjI3NTYz/NmI2NTc0MmY2MzM4/MzIzMzY1MzUzMzYy/MzM2MTMxNjEzNzYy/MzA2NDMzMzY2MTM5/MmU3MDZlNjc')
                  )
                  ],
                  
              )
            ],
          ),
        ),
      ),
    );
  }
}
