import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Container(
          height: 300.0,
          width: 400.0,
          alignment: Alignment.center,
          color: Colors.lightGreen,
          child: Text(
            "首页",
            style: TextStyle(
              fontSize: 32.0,
              color: Colors.white,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ),
    );
  }
}
