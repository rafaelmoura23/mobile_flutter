import 'package:flutter/material.dart';
import 'package:projeto_json/View/home_screen_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Amazon Books",
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: const HomeScreen(),
    );
  }
}
