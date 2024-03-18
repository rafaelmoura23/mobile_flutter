import 'package:ex6_drawer/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Defina a rota inicial para a página com o Drawer
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        '/home': (context) => Home(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercício 7 - Menu Lateral(Drawer)'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 78, 107, 130),
              ),
              child: Text(
                'Drawer',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/home'); 
              },
            ),
            ListTile(
              title: Text('Tela 2'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Tela 3'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Tela 4'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
