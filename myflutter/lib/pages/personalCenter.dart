import 'package:flutter/material.dart';

class PersonalCenter extends StatelessWidget {
  const PersonalCenter({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Container(
          height: 300.0,
          width: 400.0,
          alignment: Alignment.center,
          color: Colors.yellow,
          child: Text(
            "个人中心",
            style: TextStyle(
              fontSize: 32.0,
              color: Colors.grey,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ),
    );
  }
}
