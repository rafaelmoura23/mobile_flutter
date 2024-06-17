class Produto {
  final String id;
  final String nome;
  final int preco;
  final String categoria;
  final String imagem;

  // Construtor
  Produto({required this.nome, required this.preco, required this.categoria, required this.imagem, required this.id});

  // Mapeamento com chave-valor na Lista do Map, entre aspas é o nome da "coluna" no JSON que será relacionada com a variável
  // Recebe do Json e traduz pra flutter
  factory Produto.fromJson(Map<String, dynamic> json) {
    return Produto(
      id: json['id'],
      nome: json['nome'],
      preco: json['preco'],
      categoria: json['categoria'],
      imagem: json['imagem']
    );
  }

  // Pegando os valores do flutter e relacionando com a coleção do JSON
  // Associando a chave do Json ao nome do atributo
  // Manda para o Json
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'preco': preco,
      'categoria': categoria,
      'imagem': imagem
    };
  }
}