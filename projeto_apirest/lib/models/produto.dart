class Produto {
  // atributos
  final int id;
  final String nome;
  final double preco;

  Produto({required this.id, required this.nome, required this.preco});

  //to json
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'preco': preco,
    };
  }

  //from json
  factory Produto.fromJson(Map<String, dynamic> json) {
    return Produto(
      id: json['id'],
      nome: json['nome'],
      preco: json['preco'],
    );
  }
}
