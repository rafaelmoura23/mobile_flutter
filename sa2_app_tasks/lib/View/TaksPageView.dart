import 'package:flutter/material.dart';
import 'package:sa2_app_tasks/Controller/Notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class PaginaTasks extends StatefulWidget {
  String email;
  String nome;
  PaginaTasks({required this.email, required this.nome});

  @override
  State<PaginaTasks> createState() =>
      _PaginaTasksState(email: email, nome: nome);
}

class _PaginaTasksState extends State<PaginaTasks> {
  List<String> tasks = []; // Lista de tarefas

  final TextEditingController _controller = TextEditingController();
  late SharedPreferences _prefs;
  String email;
  String nome;

  _PaginaTasksState({required this.email, required this.nome});

  @override
  void initState() {
    super.initState();
    _loadTasksPreferences();
  }

  Future<void> _loadTasksPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      tasks = _prefs.getStringList('${email}tasks') ?? [];
    });
  }

  Future<void> saveTasks() async {
    _prefs = await SharedPreferences.getInstance();
    await _prefs.setStringList('${email}tasks', tasks);
  }

  Future<void> updateTasks(int index, String newTask) async {
    setState(() {
      tasks[index] = newTask;
      saveTasks();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bem vindo(a), $nome! 📃'),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return ListTile(
              title: Text(tasks[index]),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        tasks.removeAt(index);
                        saveTasks();
                        showAlertRemove(context);
                      });
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      TextEditingController _updateController =
                          TextEditingController(text: tasks[index]);
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Editar Tarefa'),
                            content: TextField(
                              controller: _updateController,
                            ),
                            actions: <Widget>[
                              TextButton(
                                  onPressed: () {
                                    if (_updateController.text.isNotEmpty) {
                                      updateTasks(
                                          index, _updateController.text);
                                      Navigator.of(context).pop();
                                    } else {
                                      showAlert(context);
                                    }
                                  },
                                  child: Text('Atualizar!')),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ],
              ));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Nova Tarefa'),
                content: TextField(
                  controller: _controller,
                  decoration: InputDecoration(hintText: 'Digite a tarefa'),
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      if (_controller.text.isNotEmpty) {
                        setState(() {
                          tasks.add(_controller.text);
                          saveTasks();
                          _controller.clear();
                          Navigator.of(context).pop();
                        });
                      } else {
                        showAlert(context);
                      }
                    },
                    child: Text('Adicionar'),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
