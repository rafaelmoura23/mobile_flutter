import 'package:flutter/material.dart';
import 'package:projeto_json_atual/Model/produtos_model.dart';

// ignore: must_be_immutable
class ProdutoInfoPage extends StatefulWidget {
  Produto produto;
  ProdutoInfoPage({
    required this.produto
    });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Produto Info"),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Produto: ${produto.nome}'),
            Text('Preço: R'  '${produto.preco}'),
            Text('Categoria: ${produto.categoria}'),
            Image.asset(produto.imagem),
          ],
        ),
      ),
    );
  }
  
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
