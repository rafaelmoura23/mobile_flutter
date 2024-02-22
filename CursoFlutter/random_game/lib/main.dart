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
  // Atributos iniciais da classe
  TextEditingController _controllerNumero1 = TextEditingController();
  String _resultado = '';
  int numeroSorteado = Random().nextInt(10) + 1;
  int cont = 0;
  bool acertou = false;

  void _calcular(String operacao) {
    // Métodos
    int numero = int.tryParse(_controllerNumero1.text) as int;
    
    setState(() {
    cont++;
      if (numero == numeroSorteado) {
        _resultado = "Parabéns meu caro(a), número Correto! Você acertou em $cont tentativas!";
        print("Tentativa $cont");
        acertou = true;
      } else if(numero > numeroSorteado){
        _resultado = "Tente um número menor!";
        print("Tentativa $cont");
      } else if(numero < numeroSorteado){
         _resultado = "Tente um número maior!";
         print("Tentativa $cont");
      }
    });
  }

  void _reset(String operacao){
      cont=0;
      numeroSorteado = Random().nextInt(10) + 1;
      _resultado = "";
      acertou = false;
      print(numeroSorteado);
      setState(() {
        _controllerNumero1.text = "";
      });
    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Game Flutter'),
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
              decoration: InputDecoration(labelText: 'Número'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => _calcular('advinhar'),
              child: Text('Chutar'),
            ),
            SizedBox(height: 16.0),
            Text(_resultado,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                SizedBox(height: 16.0),

                // Método para aparecer o botão resetar apenas quando acertou = true;
                Visibility(visible: acertou,
                  child: ElevatedButton(
              onPressed: () => _reset('resetar'),
              child: Text('Resetar'),
            ),)
          ],
        ),
      ),
    );
  }
}