import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color colorPurple = Colors.deepPurpleAccent;

  void _changeColor(Color color) {
    setState(() {
      colorPurple = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    double boxAltura = 100;
    double boxLargura = 100;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Exercicío 2'),
        ),
        body: Center(
          child: AnimatedContainer(
            duration: Duration(seconds: 2),
            curve: Curves.fastOutSlowIn,
            width: boxLargura,
            height: boxAltura,
            decoration: BoxDecoration(
              color: colorPurple,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () => _changeColor(Colors.blue),
              icon: Icon(Icons.palette),
            ),
            IconButton(
              onPressed: () => _changeColor(Colors.green),
              icon: Icon(Icons.palette),
            ),
            IconButton(
              onPressed: () => _changeColor(Colors.red),
              icon: Icon(Icons.palette),
            ),
          ],
        ),
      ),
    );
  }
}
