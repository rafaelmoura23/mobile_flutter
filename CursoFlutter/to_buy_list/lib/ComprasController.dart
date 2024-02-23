import 'package:flutter/material.dart';
import 'package:to_buy_list/ComprasModel.dart';

import 'package:quickalert/quickalert.dart';

class ListaComprasControler extends ChangeNotifier {
  BuildContext context;
  List<Compra> _compras = [];

  List<Compra> get compras => _compras;

  ListaComprasControler(this.context);

  // Métodos CRUD
  void adicionarCompra(String descricao) {
    if (descricao.trim().isNotEmpty) {
      bool taskExist = false;
      var compra;

      for(compra in _compras) {
        if(compra.descricao.toLowerCase() == descricao.trim().toLowerCase()){
          taskExist = true;
          break;
        }
      }
      if(taskExist){
        showAlertExist(context);
      } else{
        _compras.add(Compra(descricao.trim(), false));
      // Notifica os ouvintes (widgets) sobre a mudança no estado
      notifyListeners();
      showAlertSucess(context);
        }
      } else {
      showAlert(context);
    }
  }

  void marcarComoConcluida(int indice) {
    if (indice >= 0 && indice < _compras.length) {
      _compras[indice].concluida = !_compras[indice].concluida;
      notifyListeners();
    }
  }

  void excluirTarefa(int indice) {
    if (indice >= 0 && indice < _compras.length) {
      _compras.removeAt(indice);
      notifyListeners();
    }
  }

  // Método para atualizar as compras
  void atualizarTarefa(int indice, String newDescription) {
    if (indice >= 0 && indice < _compras.length) {
      _compras[indice].descricao = newDescription;
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
            "Escreva algo na tarefa, não é permitido adicionar compras em branco!",
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

  void showAlertExist(BuildContext context) {
    QuickAlert.show(
        context: context,
        title: "TAREFA EXISTENTE!",
        text: "Já existe uma tarefa com esse nome",
        type: QuickAlertType.warning);
  }
}
