import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Exercicío 2'),
        ),
        body: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("..//../img/planets.png", width: 500, height: 500)
                ],
              ),
              SizedBox(width: 16.0,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network("https://imgs.search.brave.com/lCZfFZFh2g_7F7kp5rhwauOAO42-esoigtE7tBeYMVc/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9wbHVz/cG5nLmNvbS9pbWct/cG5nL3BuZy1mb3It/c2NpZW5jZS0tMzE2/LnBuZw", width: 200, height: 200)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
