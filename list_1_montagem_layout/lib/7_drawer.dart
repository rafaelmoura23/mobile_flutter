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
          title: Text('Exercício 7 - Menu Lateral(Drawer)'),
        ),
        drawer: Drawer(
          child: Container(
            child: ListView(
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 78, 107, 130),
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
                  onTap: () {},
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
        ),
      ),
    );
  }
}
