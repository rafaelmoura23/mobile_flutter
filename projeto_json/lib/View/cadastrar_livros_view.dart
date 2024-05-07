import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projeto_json/Controller/livros_controller.dart';
import 'package:projeto_json/Model/livros_model.dart';

class CadastrarLivrosScreen extends StatefulWidget {
  const CadastrarLivrosScreen({super.key});

  @override
  State<CadastrarLivrosScreen> createState() => _CadastrarLivrosScreenState();
}

class _CadastrarLivrosScreenState extends State<CadastrarLivrosScreen> {
  // Create controllers
  final TextEditingController _tituloController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  LivrosController _controller = new LivrosController();

  File? _imagemSelecionada;

  TextEditingController _autorController = TextEditingController();
  TextEditingController _editoraController = TextEditingController();
  TextEditingController _sinopseController = TextEditingController();
  TextEditingController _categoriaController = TextEditingController();
  TextEditingController _isbnController = TextEditingController();
  TextEditingController _precoController = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
          padding: const EdgeInsets.all(12),
          child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                // não aparece o overflowed(faixa amarela de pouco espaço) e cria um scroller
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
                    TextFormField(
                        controller: _autorController,
                        decoration: const InputDecoration(
                          labelText: 'Autor do Livro',
                        ),
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return "Autor não pode ser Vazio";
                          } else {
                            return null;
                          }
                        }),
                    TextFormField(
                        controller: _editoraController,
                        decoration: const InputDecoration(
                          labelText: 'Editora do Livro',
                        ),
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return "Editora não pode ser Vazio";
                          } else {
                            return null;
                          }
                        }),
                    TextFormField(
                        controller: _sinopseController,
                        decoration: const InputDecoration(
                          labelText: 'Sinopse do Livro',
                        ),
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return "Sinopse não pode ser Vazio";
                          } else {
                            return null;
                          }
                        }),
                    TextFormField(
                        controller: _categoriaController,
                        decoration: const InputDecoration(
                          labelText: 'Categorias do Livro, separe por vírgula!',
                        ),
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return "Categorias não pode ser Vazio";
                          } else {
                            return null;
                          }
                        }),
                    TextFormField(
                        controller: _isbnController,
                        decoration: const InputDecoration(
                          labelText: 'ISBN do Livro',
                        ),
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return "ISBN não pode ser Vazio";
                          } else {
                            return null;
                          }
                        }),
                    TextFormField(
                        controller: _precoController,
                        decoration: const InputDecoration(
                          labelText: 'Preço do Livro',
                        ),
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return "Preço não pode ser Vazio";
                          } else {
                            return null;
                          }
                        }),
                    _imagemSelecionada != null
                        ? Image.file(
                            _imagemSelecionada!,
                            height: 150,
                            width: 150,
                            fit: BoxFit.cover,
                          )
                        : SizedBox.shrink(),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: _tirarFoto,
                      child: Text('Tirar Foto Capa do Livro'),
                    ),
                    ElevatedButton(
                      child: Text("Cadastrar"),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _cadastrarLivro();
                        }
                      },
                    )
                  ],
                ),
              ))),
    );
  }

  Future<void> _tirarFoto() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _imagemSelecionada = File(pickedFile.path);
      });
    }
  }

  _cadastrarLivro() {
    final livro = Livro(
      id: _controller.listLivros.length + 1,
      titulo: _tituloController.text,
      autor: _autorController.text,
      editora: _editoraController.text,
      sinopse: _sinopseController.text,
      categoria: _categoriaController.text.split(","),
      isbn: _isbnController.text,
      preco: double.parse(_precoController.text),
      capa: _imagemSelecionada!.path,
    );
    _controller.addLivro(livro);
    _cleanController();
    //snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Livro cadastrado com sucesso!'),
      ),
    );
  }

  void _cleanController() {
    _tituloController.clear();
    _autorController.clear();
    _editoraController.clear();
    _sinopseController.clear();
    _categoriaController.clear();
    _isbnController.clear();
    _precoController.clear();
    _imagemSelecionada = null;

    setState(() {});
  }
}
