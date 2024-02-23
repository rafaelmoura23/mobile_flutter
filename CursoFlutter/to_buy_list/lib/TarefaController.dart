import 'package:flutter/material.dart';
import 'package:to_buy_list/TarefaModel.dart';

import 'package:quickalert/quickalert.dart';

class ListaTarefasControler extends ChangeNotifier {
  BuildContext context;
  List<Tarefa> _tarefas = [];

  List<Tarefa> get tarefas => _tarefas;

  ListaTarefasControler(this.context);

  // Métodos CRUD
  void adicionarTarefa(String descricao) {
    if (descricao.trim().isNotEmpty) {
      _tarefas.add(Tarefa(descricao.trim(), false));
      // Notifica os ouvintes (widgets) sobre a mudança no estadi
      notifyListeners();
      showAlertSucess(context);
    } else {
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

  // Método para atualizar as tarefas
  void atualizarTarefa(int indice, String newDescription) {
    if (indice >= 0 && indice < _tarefas.length) {
      _tarefas[indice].descricao = newDescription;
      notifyListeners();
      showAlertUpdate(context);
    }
  }

  // método para aparecer uma mensagem na tela
  void showAlert(BuildContext context) {
    QuickAlert.show(
        context: context,
        title: "TASK IS BLANK!",
        text:
            "Escreva algo na tarefa, não é permitido adicionar tarefas em branco!",
        type: QuickAlertType.error);
  }

  void showAlertSucess(BuildContext context) {
    QuickAlert.show(
        context: context,
        title: "TASK ADDED!",
        text: "Tarefa adicionada com Sucesso!",
        type: QuickAlertType.success);
  }

  void showAlertUpdate(BuildContext context) {
    QuickAlert.show(
        context: context,
        text: "Tarefa atualizada com sucesso!",
        type: QuickAlertType.info);
  }
}
