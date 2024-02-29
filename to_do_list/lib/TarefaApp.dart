import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/TarefaController.dart';
import 'package:to_do_list/TarefaView.dart';

class ListaTarefasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
      create: (context) => ListaTarefasControler(context),
      child: ListaTarefasScreen(),
    ),
    );
  }
}