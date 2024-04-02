import 'package:app_cadastro_login/DataBaseController.dart';
import 'package:app_cadastro_login/Model.dart';
import 'package:flutter/material.dart';

class CadastroPage extends StatefulWidget {
  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final dbHelper = DatabaseHelper();
  final _formKey = GlobalKey<FormState>();

  TextEditingController _idController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();


@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SQLite - Cadastro e Login'),
      ),
    );
  }



void _showAddContactDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Cadastro Usuário'),
        );
        }
    );
}



// Método para adicionar um novo usuario ao banco de dados
  void _addUser() {
    final newUser = UserModel(
      id: int.parse(_idController.text),
      name: _nameController.text,
      password: _passwordController.text,
    );
    dbHelper.create(newUser);
  }

}