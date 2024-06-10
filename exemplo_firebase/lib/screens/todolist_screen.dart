import 'package:exemplo_firebase/controllers/todolist_controller.dart';
import 'package:exemplo_firebase/models/todolist.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../service/auth_service.dart';

class TodolistScreen extends StatefulWidget {
  final User user;
  const TodolistScreen({super.key, required this.user});

  @override
  State<TodolistScreen> createState() => _TodolistScreenState();
}

class _TodolistScreenState extends State<TodolistScreen> {
  final TodolistController _controller = TodolistController();
  final TextEditingController _tituloController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadTodolist();
  }

  Future<void> _loadTodolist() async {
    await _controller.listar('user123'); // Substitua 'user123' pelo ID do usuário real
    setState(() {});
  }

  Future<void> _addTodolist() async {
    if (_tituloController.text.isNotEmpty) {
      Todolist newTodo = Todolist(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        titulo: _tituloController.text,
        userId: 'user123', // Substitua 'user123' pelo ID do usuário real
        timestamp: DateTime.now(),
      );
      await _controller.add(newTodo);
      _tituloController.clear();
      _loadTodolist();
    }
  }

  Future<void> _deleteTodolist(String id) async {
    await _controller.delete(id);
    _loadTodolist();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todolist'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _tituloController,
              decoration: InputDecoration(
                labelText: 'Adicionar Tarefa',
                suffixIcon: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: _addTodolist,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _controller.list.length,
              itemBuilder: (context, index) {
                Todolist todo = _controller.list[index];
                return ListTile(
                  title: Text(todo.titulo),
                  onLongPress: () => _deleteTodolist(todo.id),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}