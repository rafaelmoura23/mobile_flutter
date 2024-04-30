import 'package:flutter/material.dart';
import 'package:projeto_json/View/cadastrar_livros_view.dart';
import 'package:projeto_json/View/home_screen_view.dart';
import 'package:projeto_json/View/listar_livros_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Amazon Books",
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/home': (context) => const HomeScreen(),
        '/cadastro':(context) => const CadastrarLivrosScreen(),
        '/listar':(context) => const ListarLivrosScreen(),
      },
    );
  }
}
