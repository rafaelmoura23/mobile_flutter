// Classe responsável por exibir a página inicial do aplicativo
import 'package:app_cadastro_login/ViewLogado.dart';
import 'package:flutter/material.dart';

import 'DataBaseController.dart';
import 'Model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final dbHelper = DatabaseHelper();
  final _formKey = GlobalKey<FormState>();

  // Controllers para cadastro dos dados
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();

  // Controllers para login
  TextEditingController _nameLoginController = TextEditingController();
  TextEditingController _passwordLoginController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameLoginController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _passwordLoginController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true, // não mostra a senha sendo digitada
            ),
            ElevatedButton(
              onPressed: () async {
                String name = _nameLoginController.text;
                String password = _passwordLoginController.text;

                // Verifica se o nome e a senha existem no banco de dados
                bool loginSuccess = await dbHelper.login(name, password);

                if (loginSuccess) {
                  // Redireciona para a page do sharedPreferences
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoggedInPage()),
                  );
                } else {
                  // snackbar caso o usuario não consiga logar
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text(
                            'Login failed. Please check your credentials.')),
                  );
                }
              },
              child: Text('Login'),
            ),

            SizedBox(height: 16.0),
            ElevatedButton(
                onPressed: () {
                  _showAddContactDialog(context);
                },
                child: Text('Cadastrar')) // Espaçamento entre os botões
          ],
        ),
      ),
    );
  }

  // showDialog associado ao botão de cadastro
  void _showAddContactDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Cadastro de Usuários'),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Name'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                TextFormField(
                  controller: _senhaController,
                  decoration: InputDecoration(labelText: 'Senha'),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _addContact();
                  Navigator.of(context).pop();
                }
              },
              child: Text('Cadaster'),
            ),
          ],
        );
      },
    );
  }


  // Método para adicionar um novo usuario ao banco de dados
  void _addContact() {
    final newContact = ContactModel(
      name: _nameController.text,
      email: _emailController.text,
      senha: _senhaController.text,
    );
    dbHelper.create(newContact);
  }
}
