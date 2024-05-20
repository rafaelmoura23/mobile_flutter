import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:projeto_json_atual/Model/produtos_model.dart';

class ProdutosController {
  // atributos -> lista vazia
  List<Produto> produtos = [];

  Future<List<Produto>> loadProdutos() async {
    try {
      // URL do arquivo JSON na nuvem
      final String url = 'https://raw.githubusercontent.com/rafaelmoura23/mobile_flutter/main/produtos.json';

      // Faz a solicitação HTTP para obter o conteúdo do arquivo JSON
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        // Decodifica o conteúdo JSON em uma lista dinâmica
        final jsonList = json.decode(response.body) as List<dynamic>;
        produtos.clear();
        // Converte os objetos JSON em instâncias de Produto e adiciona à lista de produtos
        produtos.addAll(jsonList.map((e) => Produto.fromJson(e)));
        return produtos;
      } else {
        // Se a solicitação falhar, lança uma exceção
        throw Exception('Falha ao carregar produtos');
      }
    } catch (e) {
      // Captura e trata qualquer exceção ocorrida durante o processo
      print('Erro ao carregar produtos: $e');
      rethrow; // Re-lança a exceção para que ela seja tratada em um nível superior, se necessário
    }
  }
}
