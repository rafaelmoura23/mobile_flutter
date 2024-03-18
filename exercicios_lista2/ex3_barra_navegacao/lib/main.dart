// Crie uma página que faça uso do widget TabBar para organizar conteúdo em diferentes
// abas.

// Implemente uma barra de navegação personalizada, utilizando o widget AppBar e ícones.
// Crie diferentes abas que levem a seções distintas da sua aplicação.

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        // numero de abas
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Exercício 3'),
            bottom: TabBar(
              // abas
              tabs: [
                Tab(
                    icon: Column(
                  children: [
                    Icon(
                      Icons.one_k,
                      color: Colors.pink,
                    ) , Text("1ª aba")],
                )),
                Tab(
                    icon: Column(
                  children: [Icon(Icons.two_k, color: Colors.blue,), Text("2ª aba")],
                )),
                Tab(
                    icon: Column(
                  children: [Icon(Icons.three_k, color: Colors.green,), Text("3ª aba")],
                )),
                Tab(
                    icon: Column(
                  children: [Icon(Icons.four_k, color: Colors.amber,), Text("4ª aba")],
                )),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              // conteúdo das abas
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            color: Color.fromARGB(255, 117, 208, 238),
                            width: 100,
                            height: 100,
                            child: Icon(Icons.ice_skating)),
                        SizedBox(height: 16.0),
                        Container(
                            color: Color.fromARGB(255, 231, 243, 123),
                            width: 100,
                            height: 100,
                            child: Icon(Icons.sunny)),
                        SizedBox(height: 16.0),
                        Container(
                            color: Color.fromARGB(255, 243, 143, 123),
                            width: 100,
                            height: 100,
                            child: Icon(Icons.hot_tub)),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            color: Color.fromARGB(255, 117, 238, 155),
                            width: 100,
                            height: 100,
                            child: Icon(Icons.nature)),
                        SizedBox(height: 16.0),
                        Container(
                            color: Color.fromARGB(255, 123, 239, 243),
                            width: 100,
                            height: 100,
                            child: Icon(Icons.cloud)),
                        SizedBox(height: 16.0),
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              color: Color.fromARGB(255, 161, 132, 254),
                            ),
                            // color: Color.fromARGB(255, 243, 143, 123),
                            width: 100,
                            height: 100,
                            child: Icon(Icons.star_purple500)),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            color: Color.fromARGB(255, 247, 147, 189),
                            width: 100,
                            height: 100,
                            child: Icon(Icons.flourescent)),
                        SizedBox(height: 16.0),
                        Container(
                            color: Color.fromARGB(255, 200, 242, 244),
                            width: 100,
                            height: 100,
                            child: Icon(Icons.token)),
                        SizedBox(height: 16.0),
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              color: Color.fromARGB(255, 221, 143, 245),
                            ),
                            // color: Color.fromARGB(255, 243, 143, 123),
                            width: 100,
                            height: 100,
                            child: Icon(Icons.science)),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            color: Color.fromARGB(255, 117, 208, 238),
                            width: 100,
                            height: 100,
                            child: Icon(Icons.ice_skating)),
                        SizedBox(height: 16.0),
                        Container(
                            color: Color.fromARGB(255, 231, 243, 123),
                            width: 100,
                            height: 100,
                            child: Icon(Icons.sunny)),
                        SizedBox(height: 16.0),
                        Container(
                            color: Color.fromARGB(255, 243, 143, 123),
                            width: 100,
                            height: 100,
                            child: Icon(Icons.hot_tub)),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            color: Color.fromARGB(255, 117, 238, 155),
                            width: 100,
                            height: 100,
                            child: Icon(Icons.nature)),
                        SizedBox(height: 16.0),
                        Container(
                            color: Color.fromARGB(255, 123, 239, 243),
                            width: 100,
                            height: 100,
                            child: Icon(Icons.cloud)),
                        SizedBox(height: 16.0),
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              color: Color.fromARGB(255, 161, 132, 254),
                            ),
                            // color: Color.fromARGB(255, 243, 143, 123),
                            width: 100,
                            height: 100,
                            child: Icon(Icons.star_purple500)),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            color: Color.fromARGB(255, 247, 147, 189),
                            width: 100,
                            height: 100,
                            child: Icon(Icons.flourescent)),
                        SizedBox(height: 16.0),
                        Container(
                            color: Color.fromARGB(255, 200, 242, 244),
                            width: 100,
                            height: 100,
                            child: Icon(Icons.token)),
                        SizedBox(height: 16.0),
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              color: Color.fromARGB(255, 221, 143, 245),
                            ),
                            // color: Color.fromARGB(255, 243, 143, 123),
                            width: 100,
                            height: 100,
                            child: Icon(Icons.science)),
                      ],
                    )
                  ],
                ),
              ),
             Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            color: Color.fromARGB(255, 117, 208, 238),
                            width: 100,
                            height: 100,
                            child: Icon(Icons.ice_skating)),
                        SizedBox(height: 16.0),
                        Container(
                            color: Color.fromARGB(255, 231, 243, 123),
                            width: 100,
                            height: 100,
                            child: Icon(Icons.sunny)),
                        SizedBox(height: 16.0),
                        Container(
                            color: Color.fromARGB(255, 243, 143, 123),
                            width: 100,
                            height: 100,
                            child: Icon(Icons.hot_tub)),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            color: Color.fromARGB(255, 117, 238, 155),
                            width: 100,
                            height: 100,
                            child: Icon(Icons.nature)),
                        SizedBox(height: 16.0),
                        Container(
                            color: Color.fromARGB(255, 123, 239, 243),
                            width: 100,
                            height: 100,
                            child: Icon(Icons.cloud)),
                        SizedBox(height: 16.0),
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              color: Color.fromARGB(255, 161, 132, 254),
                            ),
                            // color: Color.fromARGB(255, 243, 143, 123),
                            width: 100,
                            height: 100,
                            child: Icon(Icons.star_purple500)),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            color: Color.fromARGB(255, 247, 147, 189),
                            width: 100,
                            height: 100,
                            child: Icon(Icons.flourescent)),
                        SizedBox(height: 16.0),
                        Container(
                            color: Color.fromARGB(255, 200, 242, 244),
                            width: 100,
                            height: 100,
                            child: Icon(Icons.token)),
                        SizedBox(height: 16.0),
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              color: Color.fromARGB(255, 221, 143, 245),
                            ),
                            // color: Color.fromARGB(255, 243, 143, 123),
                            width: 100,
                            height: 100,
                            child: Icon(Icons.science)),
                      ],
                    )
                  ],
                ),
              ),
             Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            color: Color.fromARGB(255, 117, 208, 238),
                            width: 100,
                            height: 100,
                            child: Icon(Icons.ice_skating)),
                        SizedBox(height: 16.0),
                        Container(
                            color: Color.fromARGB(255, 231, 243, 123),
                            width: 100,
                            height: 100,
                            child: Icon(Icons.sunny)),
                        SizedBox(height: 16.0),
                        Container(
                            color: Color.fromARGB(255, 243, 143, 123),
                            width: 100,
                            height: 100,
                            child: Icon(Icons.hot_tub)),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            color: Color.fromARGB(255, 117, 238, 155),
                            width: 100,
                            height: 100,
                            child: Icon(Icons.nature)),
                        SizedBox(height: 16.0),
                        Container(
                            color: Color.fromARGB(255, 123, 239, 243),
                            width: 100,
                            height: 100,
                            child: Icon(Icons.cloud)),
                        SizedBox(height: 16.0),
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              color: Color.fromARGB(255, 161, 132, 254),
                            ),
                            // color: Color.fromARGB(255, 243, 143, 123),
                            width: 100,
                            height: 100,
                            child: Icon(Icons.star_purple500)),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            color: Color.fromARGB(255, 247, 147, 189),
                            width: 100,
                            height: 100,
                            child: Icon(Icons.flourescent)),
                        SizedBox(height: 16.0),
                        Container(
                            color: Color.fromARGB(255, 200, 242, 244),
                            width: 100,
                            height: 100,
                            child: Icon(Icons.token)),
                        SizedBox(height: 16.0),
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              color: Color.fromARGB(255, 221, 143, 245),
                            ),
                            // color: Color.fromARGB(255, 243, 143, 123),
                            width: 100,
                            height: 100,
                            child: Icon(Icons.science)),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
