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
          title: Text('Exercício 2'),
        ),
        body: Container(
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Elevated Button
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(100, 50),
                  ),
                  child: Text('Elevated Button'),
                ),
                SizedBox(width: 16.0),
                // Outlined Button
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    minimumSize: Size(100, 50),
                  ),
                  child: Text('Outlined Button'),
                ),
                SizedBox(width: 16.0),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    minimumSize: Size(100, 50),
                  ),
                  child: Text('Text Button'),
                ),
                SizedBox(width: 16.0),
                ElevatedButton(
                  style: raisedButtonStyle,
                  onPressed: () {},
                  child: Text('Raised Button'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  foregroundColor: Colors.black87, backgroundColor: Colors.grey[300],
  minimumSize: Size(100, 50),
  padding: EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(50)),
  ),
);
