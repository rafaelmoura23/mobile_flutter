import 'package:flutter/material.dart';

class CadastrarLivrosScreen extends StatefulWidget {
  const CadastrarLivrosScreen({super.key});

  @override
  State<CadastrarLivrosScreen> createState() => _CadastrarLivrosScreenState();
}

class _CadastrarLivrosScreenState extends State<CadastrarLivrosScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Livros'),
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
