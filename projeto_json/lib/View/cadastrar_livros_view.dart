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
      appBar: AppBar(),
      body: Padding(
          padding: const EdgeInsets.all(12),
          child: Form(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                  controller: _tituloController,
                  decoration: const InputDecoration(
                    labelText: 'Título do Livro',
                  ),
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return "Título não pode ser Vazio";
                    } else {
                      return null;
                    }
                  }),
                  SizedBox(height: 20,),
                  ElevatedButton(child: Text("Cadastrar"),
                  onPressed: _cadastrarLivro(),)
            ],
          ))),
    );
  }
  
  
  _cadastrarLivro() {}
}
