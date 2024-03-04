// Importa o pacote de material Flutter
import 'package:flutter/material.dart';

// Função principal que inicializa a aplicação Flutter
void main() {
// Inicia a execução da aplicação com o widget MyApp
  runApp(MyApp());
}

// Definindo a classe MyApp que herda de StatelessWidget
class MyApp extends StatelessWidget {
// Método build, obrigatório em StatelessWidget, retorna a árvore de widgets da aplicação
  @override
  Widget build(BuildContext context) {
// Retorna um MaterialApp, que é o widget raiz da aplicação Flutter
    return MaterialApp(
// Configura a tela inicial como um Scaffold
      home: Scaffold(
// Barra superior da tela (AppBar)
        appBar: AppBar(
// Título da barra superior
          title: Text('Exercicíos Flutter 🌏'),
        ),
// Corpo da tela, composto por um Column (coluna vertical) de widgets
        body: Column(
          children: [
            
// Texto simples como primeiro filho da coluna
             Container(
              child: Row(
                children: [
                  Text('Rafael de Sousa Moura'),
                  Icon(Icons.people)
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  Text('20 anos'),
                  Icon(Icons.numbers)
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  Text('Rua dos Sábias, 321'),
                  Icon(Icons.home)
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  Text('(19)1234-5678'),
                  Icon(Icons.phone)
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  Text('rafael@email.com'),
                  Icon(Icons.email)
                ],
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
