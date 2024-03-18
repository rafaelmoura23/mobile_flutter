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
          title: Text('Exercicío 7'),
        ),
        body: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    color: const Color.fromARGB(255, 255, 17, 0),
                  ),
                  Container(
                    width: 150,
                    height: 150,
                    color: const Color.fromARGB(255, 0, 108, 4),
                  ),
                  Container(
                    width: 200,
                    height: 200,
                    color: Color.fromARGB(255, 151, 251, 0),
                  ),
                ],
              ),SizedBox(width: 16.0,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 200,
                        height: 200,
                        color: Color.fromARGB(255, 140, 0, 255),
                      ),
                      Container(
                        width: 150,
                        height: 150,
                        color: const Color.fromARGB(255, 0, 65, 2),
                      ),
                      Container(
                        width: 100,
                        height: 100,
                        color: const Color.fromARGB(255, 0, 140, 255),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
