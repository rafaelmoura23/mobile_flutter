import 'package:flutter/material.dart';
import 'package:projeto_json_atual/View/home_screen.dart';
import 'package:projeto_json_atual/View/produto_info_view.dart';
import 'package:projeto_json_atual/View/produtos_cadastro_view.dart';
import 'package:projeto_json_atual/View/produtos_view.dart';

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
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/home':(context) => const HomeScreen(),
        '/cadastro':(context) => CadastroView(),
      },
    );
  }
}