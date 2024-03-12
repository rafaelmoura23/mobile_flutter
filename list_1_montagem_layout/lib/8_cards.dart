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
          backgroundColor: Colors.blueAccent,
        ),
        body: Center(
          // card
          child: Card(
            shadowColor: Colors.black,
            child: Container(
              width: 300,
              height: 200,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      child: CircleAvatar(
                        backgroundColor: const Color.fromARGB(255, 189, 189, 189),
                        backgroundImage: NetworkImage(
                            "https://imgs.search.brave.com/RE-TzKbU0pUHqVXC1pCZKQt7S6YIUZb__M0iP09JVP4/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9jZG4u/aWNvbi1pY29ucy5j/b20vaWNvbnMyLzI2/NDUvUE5HLzUxMi9w/ZXJzb25faWNvbl8x/NTk5MjEucG5n"),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "People 1",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.blue,
                        fontWeight: FontWeight.w400,
                        fontFamily: AutofillHints.birthdayMonth,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Rafael de Sousa Moura - Data Science",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 150,
                      child: ElevatedButton(
                      onPressed: () {}, 
                      style: ButtonStyle(
                        foregroundColor: 
                        MaterialStatePropertyAll(Colors.white),
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.blue)
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.touch_app),
                                  Text('Contratar')
                                ],
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
