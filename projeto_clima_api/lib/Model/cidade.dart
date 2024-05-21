class Cidade {
  late int id;
  String nome;
  bool status;

  Cidade({
    required this.id,
    required this.nome,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      "nome": nome,
      "status": status,
    };
  }

  factory Cidade.fromMap(Map<String, dynamic> map) {
    return Cidade(
      id: map["id"],
      nome: map["nome"],
      status: map["status"],
    );
  }
}
