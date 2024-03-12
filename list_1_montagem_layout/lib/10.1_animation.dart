// Integre animações simples em elementos do seu layout.
// Por exemplo, faça um widget mover-se ou mudar de cor ao ser clicado.

// Desenvolva uma interface que faça uso dos widgets Row e Column para organizar
// elementos de forma horizontal e vertical.
// Adicione diversos widgets (como Text, Icon e Image) para demonstrar a organização.

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Exercicío 2').animate().fade().scale(),
        ),
        body: Container(
          child: Row(
            children: [
              Column(
                children: [

                  Text("seahorse").animate().shader(duration: 2.seconds),
                  Image.network(
                      "https://imgs.search.brave.com/bnRUXbqCJOTOI0pHKHZQUb89JUWZsxhROAJjb69rLG4/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9zdGF0/aWMudmVjdGVlenku/Y29tL3RpL3ZldG9y/LWdyYXRpcy90Mi83/MDA0MTktY2F2YWxv/LW1hcmluaG8tcGlu/dGFkby1jb20tYXF1/YXJlbGEtdmV0b3Iu/cG5n").animate().fadeIn(),
                  ElevatedButton(
                    onPressed: () => (),
                    child: Icon(Icons.animation).animate(
                          onPlay: (controller) =>
                              controller.repeat(reverse: true))
                      .fadeOut(curve: Curves.easeInOut),
                  )
                ].animate(interval:  1000.ms).fade(duration: 300.ms),
              ).animate().fadeIn(duration: 600.ms).then(delay: 200.ms).slide(),
            ],
          ),
        ),
      ),
    );
  }
}
