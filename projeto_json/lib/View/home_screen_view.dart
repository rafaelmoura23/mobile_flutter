import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Amazon Books")),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: onPressed, child: Text("Books List")),
              SizedBox(height: 16),
              ElevatedButton(
                  onPressed: onPressed, child: Text("Cadastro de Livros")),
            ],
          ),
        ),
      ),
    );
  }
}
