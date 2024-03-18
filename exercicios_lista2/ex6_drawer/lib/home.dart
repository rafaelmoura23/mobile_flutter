import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Página HOME'),
        ),
        body: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.home),
                  Text("Página Home"),
                  Image.network("https://imgs.search.brave.com/gCBAhKxVVtbcChmA-Y5BK1WjZ4RvJk_LME3jhY8AdlQ/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9oZXJt/ZXMuZGlvLm1lL2Nv/dXJzZXMvYmFkZ2Uv/YjVhZjJmMjYtZGM1/ZC00ZTljLTkxN2Mt/ODliMTk3NmFiNTlk/LnBuZw")
                ],
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
