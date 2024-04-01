class UserModel {
  int id;
  String name;
  String password;

  UserModel({
    required this.id,
    required this.name,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return{
      'id': id,
      'name' : name,
      'password' : password,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'], 
      name: map['name'], 
      password: map['password']
      );
  }

}