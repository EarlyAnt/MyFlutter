import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("MyApp")),
        body: Center(
          child: Container(
            height: 300.0,
            width: 400.0,
            alignment: Alignment.center,
            color: Colors.lightGreen,
            child: Text(
              "This is my Hello world",
              style: TextStyle(
                fontSize: 32.0,
                color: Colors.white,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
