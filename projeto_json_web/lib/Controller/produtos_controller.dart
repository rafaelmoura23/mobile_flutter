import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:projeto_json_atual/Model/produtos_model.dart';

class ProdutosController {
  // atributos -> lista vazia
  List<Produto> produtos = [];
  // URL do arquivo JSON na nuvem
  final String url = 'http://10.109.195.197:3000/produtos';

  Future<List<Produto>> loadProdutos() async {
    try {
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

  Future<bool> adicionarProduto(Produto produto) async {
    final String json = jsonEncode(produto.toJson());
    final response = await http.post(Uri.parse(url),
    headers: {"Content-Type": "application/json"},
    body: json
    );

    if(response.statusCode == 201){
      return true;
    }
    return false;
  }

  Future<bool> deletarProduto(Produto produto) async {
  final String id = produto.id; // Obter ID do produto a ser deletado
  final String urlDelecao = '$url/$id'; // Formar URL com o ID

  final response = await http.delete(Uri.parse(urlDelecao));

  if (response.statusCode == 200) {
    // Remover o produto da lista local
    produtos.removeWhere((prod) => prod.id == id);
    return true;
  } else {
    // Se a requisição falhar, retornar falso
    return false;
  }
}

Future<bool> atualizarProduto(Produto produto) async {
  final String id = produto.id; // Obter ID do produto a ser atualizado
  final String urlAtualizacao = '$url/$id'; // Formar URL com o ID
  final String json = jsonEncode(produto.toJson()); // Codificar o produto em JSON

  final response = await http.put(Uri.parse(urlAtualizacao),
    headers: {"Content-Type": "application/json"},
    body: json
  );

  if (response.statusCode == 200) {
    // Atualizar o produto na lista local
    final index = produtos.indexWhere((prod) => prod.id == id);
    if (index != -1) {
      produtos[index] = produto;
    }
    return true;
  } else {
    // Se a requisição falhar, retornar falso
    return false;
  }
}




}
