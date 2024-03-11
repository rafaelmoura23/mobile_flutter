// Crie um formulário de contato com campos para nome, e-mail e mensagem.
// Utilize o widget TextField para entrada de dados e adicione um botão para enviar o
// formulário.
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(Exercise5());
}

class Exercise5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Exercício 5 - Forms')),
        ),
        body: Center(
          child:Container(
          width: 600,
          height: 300,
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(8.0)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.people),
                  labelText: 'Nome',
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.email),
                  labelText: 'E-mail',
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.message),
                  labelText: 'Mensagem',
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: (

                ) {

                },
                child: Text('Enviar'),
              ),
            ],
            ),
          ),
        ),
      ),
    );
  }
}
