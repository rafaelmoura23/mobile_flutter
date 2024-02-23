import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:to_buy_list/ComprasController.dart';
import 'package:to_buy_list/ComprasView.dart';

class ListaComprasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
      create: (context) => ListaComprasControler(context),
      child: ListaComprasScreen(),
    ),
    );
  }
}