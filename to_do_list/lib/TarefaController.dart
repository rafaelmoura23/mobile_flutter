import 'package:flutter/material.dart';
import 'package:to_do_list/TarefaModel.dart';

import 'package:quickalert/quickalert.dart';

class ListaTarefasControler extends ChangeNotifier {
  BuildContext context;
  List<Tarefa> _tarefas = [];

  List<Tarefa> get tarefas => _tarefas;

  ListaTarefasControler(this.context);
  

  // Métodos CRUD
  void adicionarTarefa(String descricao) {
    if(descricao.trim().isNotEmpty){
    _tarefas.add(Tarefa(descricao.trim(), false));
    // Notifica os ouvintes (widgets) sobre a mudança no estadi
    notifyListeners();
    } else{
      showAlert(context);
    }
  }

  void marcarComoConcluida(int indice) {
    if (indice >= 0 && indice < _tarefas.length) {
      _tarefas[indice].concluida = !_tarefas[indice].concluida;
      notifyListeners();
    }
  }

  void excluirTarefa(int indice) {
    if (indice >= 0 && indice < _tarefas.length) {
      _tarefas.removeAt(indice);
      notifyListeners();
    }
  }

  // método para aparecer uma mensagem na tela
  void showAlert(BuildContext context){
    QuickAlert.show(
      context: context, 
      type: QuickAlertType.error);
  }
}
