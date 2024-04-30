import 'package:flutter/material.dart';

class ListarLivrosScreen extends StatefulWidget {
  const ListarLivrosScreen({super.key});

  @override
  State<ListarLivrosScreen> createState() => _ListarLivrosScreenState();
}

class _ListarLivrosScreenState extends State<ListarLivrosScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Livros'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [],
          ),
        ),
      ),
    );
  }
}