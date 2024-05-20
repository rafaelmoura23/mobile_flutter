import 'package:flutter/material.dart';
import 'package:projeto_json_atual/Controller/produtos_controller.dart';
import 'package:projeto_json_atual/Model/produtos_model.dart';

class CadastroView extends StatefulWidget {
  @override
  _CadastroViewState createState() => _CadastroViewState();
}

class _CadastroViewState extends State<CadastroView> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nomeController = TextEditingController();
  TextEditingController _precoController = TextEditingController();
  TextEditingController _categoriaController = TextEditingController();
  TextEditingController _imagemController = TextEditingController();

  ProdutosController _produtosController = ProdutosController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Produtos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: _nomeController,
                decoration: InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, insira o nome do produto';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _precoController,
                decoration: InputDecoration(labelText: 'Preço'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, insira o preço do produto';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _categoriaController,
                decoration: InputDecoration(labelText: 'Categoria'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, insira a categoria do produto';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _imagemController,
                decoration: InputDecoration(labelText: 'URL da Imagem'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, insira a URL da imagem do produto';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Cria um novo produto com os valores do formulário
                      Produto novoProduto = Produto(
                        nome: _nomeController.text,
                        preco: int.parse(_precoController.text),
                        categoria: _categoriaController.text,
                        imagem: _imagemController.text,
                      );

                      // Chama o método adicionarProduto do ProdutosController
                      _produtosController.adicionarProduto(novoProduto);

                      // Limpa os campos do formulário após adicionar o produto
                      _nomeController.clear();
                      _precoController.clear();
                      _categoriaController.clear();
                      _imagemController.clear();
                    }
                  },
                  child: Text('Salvar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

