import 'package:flutter/material.dart';
import 'package:sa2_app_tasks/View/LoginPageView.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "SA2 - APP TASKS",
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
