import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PaginaTasks extends StatefulWidget {
  String email;
  PaginaTasks({required this.email});

  @override
  State<PaginaTasks> createState() => _PaginaTasksState(email: email);
}

class _PaginaTasksState extends State<PaginaTasks> {
  List<String> tasks = []; // Lista de tarefas
  final TextEditingController _controller = TextEditingController();
  late SharedPreferences _prefs;
  String? _tasksOnlyUser;
  String email;

  _PaginaTasksState({required this.email});

  @override
  void initState() {
    super.initState();
    _loadTasksPreferences();
  }

  Future<void> _loadTasksPreferences() async {
    _prefs = await SharedPreferences
        .getInstance(); // Obtém as preferências compartilhadas
    setState(() {
      tasks = _prefs.getStringList('${email}tasks') ?? [];
    });
  }

  Future<void> saveTasks() async {
    _prefs = await SharedPreferences
        .getInstance(); // Obtém as preferências compartilhadas
    await _prefs.setStringList('${email}tasks',tasks); // Salva a lista de tarefas nas preferências compartilhadas
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tarefas'), // Título da barra de aplicativos
      ),
      body: ListView.builder(
        itemCount: tasks.length, // Número de itens na lista de tarefas
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(tasks[index]), // Título do item da lista
            onLongPress: () {
              setState(() {
                tasks.removeAt(index); // Remove a tarefa da lista
                saveTasks(); // Salva as tarefas atualizadas
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Nova Tarefa'), // Título do diálogo de nova tarefa
                content: TextField(
                  controller:
                      _controller, // Controlador de texto para o campo de entrada
                  decoration: InputDecoration(
                      hintText: 'Digite a tarefa'), // Dica no campo de entrada
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      setState(() {
                        tasks.add(
                            _controller.text); // Adiciona a nova tarefa à lista
                        saveTasks(); // Salva as tarefas atualizadas
                        _controller.clear(); // Limpa o campo de entrada
                        Navigator.of(context).pop(); // Fecha o diálogo
                      });
                    },
                    child: Text('Adicionar'), // Botão para adicionar a tarefa
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add), // Ícone do botão de adicionar
      ),
    );
  }
}
