import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Weather Forecast App")),
      body: Container(
        color: Color.fromARGB(255, 176, 190, 197), // Define a cor de fundo como azul
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset( // Adiciona a imagem ao centro
                  'assets/img/Weather-temperature.png', // substitua pelo caminho da sua imagem
                  width: 300, // ajuste o tamanho conforme necessário
                  height: 300,
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/cadastro');
                  },
                  child: Text("Cadastrar"),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/lista'),
                  child: Text("Produtos"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}