class ContactModel {
  String name;
  String email;
  String senha;

  ContactModel({
    required this.name,
    required this.email,
    required this.senha,
  });
  
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'senha': senha,
    };
  }

  factory ContactModel.fromMap(Map<String, dynamic> map) {
    return ContactModel(
      name: map['name'],
      email: map['email'],
      senha: map['senha'],
    );
  }
}