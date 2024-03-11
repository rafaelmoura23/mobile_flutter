// Torne o seu layout responsivo utilizando o widget MediaQuery.
// Adapte o conteúdo para diferentes tamanhos de tela e orientações.

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Obtém informações sobre o ambiente de exibição
    MediaQueryData mediaQueryData = MediaQuery.of(context);

    // largura da tela
    double screenWidth = mediaQueryData.size.width;

    // Calcula o tamanho do texto com base na largura da tela
    double textSize = screenWidth * 0.05;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Exercício 6 - MediaQuery'),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                    width: screenWidth * 0.8,
                    padding: EdgeInsets.all(16.0),
                    color: Color.fromARGB(255, 2, 73, 106),
                    child: Text(
                      'Texto 1 - MediaQuery',
                      style: TextStyle(fontSize: textSize),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Container(
                    width: screenWidth * 0.8,
                    padding: EdgeInsets.all(16.0),
                    color: Color.fromARGB(255, 142, 164, 173),
                    child: Text(
                      'Texto 2 - MediaQuery',
                      style: TextStyle(fontSize: textSize),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Container(
                    width: screenWidth * 0.8,
                    padding: EdgeInsets.all(16.0),
                    color: Color.fromARGB(255, 19, 220, 193),
                    child: Text(
                      'Texto 3 - MediaQuery',
                      style: TextStyle(fontSize: textSize),
                      textAlign: TextAlign.center,
                    ),
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
