import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_animais/Controller.dart';
import 'package:app_animais/View.dart';

class ListaAnimaisApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
      create: (context) => AnimalController(),
      child: TelaListaAnimais(),
    ),
    );
  }
}