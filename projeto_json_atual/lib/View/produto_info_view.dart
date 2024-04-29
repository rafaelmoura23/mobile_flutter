import 'package:flutter/material.dart';
import 'package:projeto_json_atual/Model/produtos_model.dart';

class ProdutoInfoPage extends StatelessWidget {
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
            Text('Preço: '  '${produto.preco}'),
            Text('Categoria: ${produto.categoria}'),
            Text('Imagem': )
          ],
        ),
      ),
    );
  }
}
