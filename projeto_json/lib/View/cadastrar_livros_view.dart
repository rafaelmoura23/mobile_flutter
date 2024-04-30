import 'package:flutter/material.dart';

class CadastrarLivrosScreen extends StatefulWidget {
  const CadastrarLivrosScreen({super.key});

  @override
  State<CadastrarLivrosScreen> createState() => _CadastrarLivrosScreenState();
}

class _CadastrarLivrosScreenState extends State<CadastrarLivrosScreen> {
  // Create controllers
  final TextEditingController _tituloController =  TextEditingController();
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
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Editora',
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Sinopse',
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Categoria',
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'ISBN',
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Preço',
                ),
              )
            ],
          ),
        ),
      ),
      ),
    );
  }
}
