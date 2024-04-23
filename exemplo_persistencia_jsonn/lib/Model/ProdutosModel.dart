class Produto {
  final String nome;
  final double preco;
  final String categoria;

  // Construtor
  Produto({required this.nome, required this.preco, required this.categoria});

  // Mapeamento com chave-valor na Lista do Map, entre aspas é o nome da "coluna" no JSON que será relacionada com a variável 
  factory Produto.fromJson(Map<String, dynamic> json) {
    return Produto(
      nome: json['nome'],
      preco: json['preco'],
      categoria: json['categoria'],
    );
  }

  // Pegando os valores do flutter e relacionando com a coleção do JSON
  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'preco': preco,
      'categoria': categoria,
    };
  }
}
