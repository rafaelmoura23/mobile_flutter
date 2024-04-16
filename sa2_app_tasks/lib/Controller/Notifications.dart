import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

void showAlert(BuildContext context) {
  QuickAlert.show(
      context: context,
      title: "CAMPO EM BRANCO!",
      text: "Escreva algo, não é permitido adicionar produtos em branco!",
      type: QuickAlertType.error);
}

void showAlertRemove(BuildContext context) {
  QuickAlert.show(
      context: context,
      title: "ITEM EXCLUÍDO!",
      text: "O item selecionado foi deletado!",
      type: QuickAlertType.info);
}

void showAlertUpdate(BuildContext context) {
  QuickAlert.show(
      context: context,
      text: "Item atualizada com sucesso!",
      type: QuickAlertType.info);
}

void showAlertExist(BuildContext context) {
  QuickAlert.show(
      context: context,
      title: "PRODUTO EXISTENTE!",
      text: "Já existe uma item com esse nome",
      type: QuickAlertType.warning);
}

void showAlertSucess(BuildContext context) {
  QuickAlert.show(
      context: context,
      title: "USUÁRIO CADASTRADO COM SUCESSO!",
      text: "Usuário adicionada com Sucesso!",
      type: QuickAlertType.success);
}

void showAlertExists(BuildContext context) {
  QuickAlert.show(
      context: context,
      title: "Já existe um usuário com esse Email!",
      text: "bu",
      type: QuickAlertType.success);
}
