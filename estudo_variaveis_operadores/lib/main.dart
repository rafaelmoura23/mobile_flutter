// void main() {
// // Declarando e inicializando variáveis
// String nome = "João";
// int idade = 25;
// double altura = 1.75;
// bool estudante = true;

// // Imprimindo variáveis
// print("Nome: $nome");
// print("Idade: $idade anos");
// print("Altura: $altura metros");
// print("Estudante: $estudante");
// }

import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(CalculadoraApp());
}

class CalculadoraApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Calculadora(),
    );
  }
}

class Calculadora extends StatefulWidget {
  @override
  _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  TextEditingController _controllerNumero1 = TextEditingController();
  TextEditingController _controllerNumero2 = TextEditingController();
  String _resultado = '';

  void _calcular(String operacao) {
    double numero1 = double.tryParse(_controllerNumero1.text) ?? 0.0;
    double numero2 = double.tryParse(_controllerNumero2.text) ?? 0.0;
    double resultado;

    setState(() {
      double soma = numero1 + numero2;
      double subtracao = numero1 - numero2;
      double multiplicacao = numero1 * numero2;
      double divisao = numero1 * numero2;

      calculo(setState) {
        switch (operacao) {
          case 0:
            return soma;
            break;
          case 1:
            return subtracao;
            break;
          case 2:
          return multiplicacao;
            break;
          case 3:
          return divisao;
            break;
          default:
            print('invalid entry');
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora Flutter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _controllerNumero1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Número 1'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _controllerNumero2,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Número 2'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => _calcular('soma'),
              child: Text('Somar'),
            ),
            ElevatedButton(
              onPressed: () => _calcular('subtracao'),
              child: Text('Subtração'),
            ),
            ElevatedButton(
              onPressed: () => _calcular('multiplicacao'),
              child: Text('Multiplicação'),
            ),
            ElevatedButton(
              onPressed: () => _calcular('divisao'),
              child: Text('Divisão'),
            )
          ],
        ),
      ),
    );
  }
}
