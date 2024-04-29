class Produto {
  final String nome;
  final int preco;
  final String categoria;

  // Construtor
  Produto({required this.nome, required this.preco, required this.categoria});

  // Mapeamento com chave-valor na Lista do Map, entre aspas é o nome da "coluna" no JSON que será relacionada com a variável
  // Recebe do Json e traduz pra flutter
  factory Produto.fromJson(Map<String, dynamic> json) {
    return Produto(
      nome: json['nome'],
      preco: json['preco'],
      categoria: json['categoria']
    );
  }

  // Pegando os valores do flutter e relacionando com a coleção do JSON
  // Associando a chave do Json ao nome do atributo
  // Manda para o Json
  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'preco': preco,
      'categoria': categoria
    };
  }
}