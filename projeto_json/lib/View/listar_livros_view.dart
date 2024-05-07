import 'dart:io';

import 'package:flutter/material.dart';
import 'package:projeto_json/Controller/livros_controller.dart';

class ListarLivrosScreen extends StatefulWidget {
  const ListarLivrosScreen({super.key});

  @override
  State<ListarLivrosScreen> createState() => _ListarLivrosScreenState();
}

class _ListarLivrosScreenState extends State<ListarLivrosScreen> {
  final LivrosController _controller = LivrosController();


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('List of Books'),
        ),
        body: Expanded(
            child: Padding(
          padding: EdgeInsets.all(16),
          child: //lista livros
              ListView.builder(
            itemCount: _controller.listLivros.length,
            itemBuilder: (context, index) {
              ListTile(
                leading: Image.file(File(_controller.listLivros[index].capa)),
                title: Text(_controller.listLivros[index].titulo),
                subtitle: Text(_controller.listLivros[index].autor),
              );
              return null;
            },
          ),
        )));
  }
}
