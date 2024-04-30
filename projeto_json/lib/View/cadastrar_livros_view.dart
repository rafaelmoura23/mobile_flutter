import 'package:flutter/material.dart';

class CadastrarLivrosScreen extends StatefulWidget {
  const CadastrarLivrosScreen({super.key});

  @override
  State<CadastrarLivrosScreen> createState() => _CadastrarLivrosScreenState();
}

class _CadastrarLivrosScreenState extends State<CadastrarLivrosScreen> {
  // Create controllers
  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _autorController = TextEditingController();
  final TextEditingController _editoraController = TextEditingController();
  final TextEditingController _sinopseController = TextEditingController();
  final TextEditingController _categoriaController = TextEditingController();
  final TextEditingController _isbnController = TextEditingController();
  final TextEditingController _precoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar Livro'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Título do Livro',
                  ),
                  controller: _tituloController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Insira um título';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Autor',
                  ),
                  controller: _autorController,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Editora',
                  ),
                  controller: _editoraController,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Sinopse',
                  ),
                  controller: _sinopseController,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Categoria',
                  ),
                  controller: _categoriaController,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'ISBN',
                  ),
                  controller: _isbnController,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Preço',
                  ),
                  controller: _precoController  ,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
