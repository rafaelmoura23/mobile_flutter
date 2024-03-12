// Crie uma página que faça uso do widget TabBar para organizar conteúdo em diferentes
// abas.

// Implemente uma barra de navegação personalizada, utilizando o widget AppBar e ícones.
// Crie diferentes abas que levem a seções distintas da sua aplicação.

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home: DefaultTabController(
      // numero de abas
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Exercício barra de navegação'),
          bottom: TabBar(
            // abas
            tabs: [
              Tab(icon: Icon(Icons.flight)),
              Tab(icon: Icon(Icons.directions_transit)),
              Tab(icon: Icon(Icons.directions_car)),
              Tab(icon: Icon(Icons.electric_bike))
            ],
          ),
        ),
      ),
      ),
    );
  }
}
