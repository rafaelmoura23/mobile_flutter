import 'package:flutter/material.dart';
import 'package:to_buy_list/ComprasModel.dart';
import 'package:quickalert/quickalert.dart'; // import alerts

class ListaComprasControler extends ChangeNotifier {
  BuildContext context;
  List<Compra> _compras = [];

  List<Compra> get compras => _compras;

  ListaComprasControler(this.context);

  // Métodos CRUD
  // ========================================================
  void adicionarCompra(String descricao) {
    if (descricao.trim().isNotEmpty) {
      bool taskExist = false;
      var compra;

      // Verificando se já existe uma compra adicionada na lista com o mesmo nome
      for(compra in _compras) {
        if(compra.descricao.toLowerCase() == descricao.trim().toLowerCase()){
          taskExist = true;
          break;
        }
      }
      // Se já existir um produto igual
      if(taskExist){
        showAlertExist(context);
      } else{
        // Obter a data atual
        DateTime dataAtual = DateTime.now();
        _compras.add(Compra(descricao.trim(), false, dataAtual));
        // Notifica os ouvintes (widgets) sobre a mudança no estado
        notifyListeners();
        showAlertSucess(context);
        }
      } else {
      showAlert(context);
    }
  }

  // ========================================================
  void marcarComoConcluida(int indice) {
    if (indice >= 0 && indice < _compras.length) {
      _compras[indice].concluida = !_compras[indice].concluida;
      notifyListeners();
      showAlertRemove(context);
    }
  }

  // ========================================================
  void excluirTarefa(int indice) {
    if (indice >= 0 && indice < _compras.length) {
      _compras.removeAt(indice);
      notifyListeners();
      // showAlertRemove(context);
    }
  }

  // ========================================================
  // Método para atualizar as compras
  void atualizarTarefa(int indice, String newDescription) {
    if (indice >= 0 && indice < _compras.length) {
      _compras[indice].descricao = newDescription;
      notifyListeners();
      showAlertUpdate(context);
    }
  }

  // ==============================================
  // métodos para aparecer uma mensagem na tela
  void showAlert(BuildContext context) {
    QuickAlert.show(
        context: context,
        title: "CAMPO EM BRANCO!",
        text:
            "Escreva algo, não é permitido adicionar produtos em branco!",
        type: QuickAlertType.error);
  }

  void showAlertSucess(BuildContext context) {
    QuickAlert.show(
        context: context,
        title: "PRODUTO ADICIONADO À LISTA!",
        text: "Tarefa adicionada com Sucesso!",
        type: QuickAlertType.success);
  }

  void showAlertUpdate(BuildContext context) {
    QuickAlert.show(
        context: context,
        text: "Produto atualizada com sucesso!",
        type: QuickAlertType.info);
  }

  void showAlertExist(BuildContext context) {
    QuickAlert.show(
        context: context,
        title: "PRODUTO EXISTENTE!",
        text: "Já existe uma item com esse nome",
        type: QuickAlertType.warning);
  }

  void showAlertRemove(BuildContext context) {
    QuickAlert.show(
        context: context,
        title: "ITEM MARCADO COMO CONCLUÍDO!",
        text: "Item comprado!",
        type: QuickAlertType.confirm);
  }
}
