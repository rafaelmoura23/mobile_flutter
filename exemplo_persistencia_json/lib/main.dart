import 'package:exemplo_persistencia_json/View/PaginaInicial.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Persistencia Json",
      theme: ThemeData(
        primarySwatch: Colors.amber
      ),
      home: HomePage(),
    );
  }
}