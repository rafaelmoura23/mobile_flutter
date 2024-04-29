import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:projeto_json_atual/Model/produtos_model.dart';

class ProdutosController {
  // atributos
  List<Produto> produtos = [];

Future<List<Produto>> loadProdutos() async {
    // Carrega o conteúdo do arquivo JSON da pasta assets
    final data = await rootBundle.loadString('assets/produtos.json'); // 
    // DECODIFICA o conteúdo JSON em uma lista dinâmica
    final jsonList = json.decode(data) as List<dynamic>;
    // Converte os objetos JSON em instâncias de Produto e adiciona à lista de produtos
    produtos.addAll(jsonList.map((e) => Produto.fromJson(e)));
    return produtos;
  }
}