import 'dart:convert';

import '../models/produto.dart';
import 'package:http/http.dart' as http;

class ProdutosController {
  List<Produto> _listProdutos = [];
  
  List<Produto> get listProdutos => _listProdutos;
  
  //getPRodutosFromJson http
  Future<List<Produto>> getProdutosFromJson() async {
    final response = await http.get(Uri.parse('http://10.109.207.166:3000/produtos'));
    if (response.statusCode == 200) {
      List<dynamic> result = await json.decode(response.body);
      _listProdutos = result.map((prod) => Produto.fromJson(prod)).toList();
      return _listProdutos;
    } else {
      throw Exception('Failed to load Produtos');
    }
  }
  //postProdutos toJson http
  Future<String> postProdutosToJson(Produto produto) async {
    final response = await http.post(Uri.parse('http://10.109.207.166:3000/produtos'),
        body: json.encode(produto.toJson()));
    if (response.statusCode == 201) {
      return response.body;
    } else {
      throw Exception('Failed to load Produtos');
    }
  }
}