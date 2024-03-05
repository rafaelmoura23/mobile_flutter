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
        body: Center(
          child: Container(
              width: 200,
              height:300,
              color: const Color.fromARGB(255, 163, 210, 248),
              child: Column(
                    children: [
                Text(
                  'Pai',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 150,
                  height: 50,
                  color: Colors.green,
                  child: Center(
                    child: Text(
                      'Filho 1',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.red,
                  child: Center(
                    child: Text(
                      'Filho 2',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 80,
                  height: 40,
                  color: const Color.fromARGB(255, 127, 54, 244),
                  child: Center(
                    child: Text(
                      'Filho 3',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            ),
        ),
      ),
    );
  }
}
