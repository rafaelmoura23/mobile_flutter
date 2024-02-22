import 'package:flutter/material.dart';
import 'package:to_do_list/TarefaModel.dart';

class ListaTarefasControler extends ChangeNotifier {
  List<Tarefa> _tarefas = [];

  List<Tarefa> get tarefas => _tarefas;

  // Métodos CRUD
  void adicionarTarefa(String descricao) {
    _tarefas.add(Tarefa(descricao, false));
    // Notifica os ouvintes (widgets) sobre a mudança no estadi
    notifyListeners();
  }

  void marcarComoConcluida(int indice) {
    if (indice <= 0 && indice < _tarefas.length) {
      _tarefas[indice].concluida = true;
      notifyListeners();
    }
  }

  void excluirTarefa(int indice) {
    if (indice >= 0 && indice < _tarefas.length) {
      _tarefas.removeAt(indice);
      notifyListeners();
    }
  }
}
