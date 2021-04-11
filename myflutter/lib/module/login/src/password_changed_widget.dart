import 'dart:io';

import 'package:flutter/material.dart';
import '../../reminder/src/topReminder_widget.dart';

class PasswordChangedWidget extends StatefulWidget {
  //Login({Key key}) : super(key: key);

  final String parameter;
  PasswordChangedWidget({
    @required this.parameter,
  });

  @override
  _PasswordChangedWidgetState createState() => _PasswordChangedWidgetState();
}

class _PasswordChangedWidgetState extends State<PasswordChangedWidget> {
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _passwordConfirmController = TextEditingController();
  bool passwordVisible = true;
  bool passwordConfirmVisible = true;

  @override
  Widget build(BuildContext context) {
    // print(widget.parameter);
    return Container(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 69, 124, 187),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 170),
              _txtTitle(),
              SizedBox(height: 20),
              _txtTransferPage(),
              SizedBox(height: 100),
              imgOK(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _txtTitle() {
    return Padding(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Text(
          '密码设置成功',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 38),
        ));
  }

  Widget _txtTransferPage() {
    return Padding(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Text('正在自动跳回登陆页面(3s)',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white30, fontSize: 18)));
  }

  Widget imgOK() {
    return Padding(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Icon(
          Icons.arrow_circle_up,
          color: Colors.white,
          size: 128,
        ));
  }
}
