import 'package:exemplo_firebase/controllers/todolist_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CadastroTask extends StatefulWidget {
  const CadastroTask({super.key});

  @override
  State<CadastroTask> createState() => _CadastroTaskState();
}

class _CadastroTaskState extends State<CadastroTask> {
  final _tituloController = TextEditingController();

  // initstate
  @override
  void initState() {
    
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(

    );
  }
}