import 'View.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Project SQLITE and SharedPreferences",
      theme: ThemeData(
        brightness: Brightness.light, // Define o tema claro como padrão
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark, // Define o tema escuro
      ),
      home: HomePage(),
    );
  }
}