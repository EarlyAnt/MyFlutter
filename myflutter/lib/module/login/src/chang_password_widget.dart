import 'dart:io';

import 'package:flutter/material.dart';
import '../../reminder/src/topReminder_widget.dart';

class ChangePasswordWidget extends StatefulWidget {
  ChangePasswordWidget({Key key}) : super(key: key);

  @override
  _ChangePasswordWidgetState createState() => _ChangePasswordWidgetState();
}

class _ChangePasswordWidgetState extends State<ChangePasswordWidget> {
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _passwordConfirmController = TextEditingController();
  bool passwordVisible = true;
  bool passwordConfirmVisible = true;

  @override
  Widget build(BuildContext context) {
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
              SizedBox(height: 50),
              _txtOperate(),
              SizedBox(height: 10),
              _txtPassword(),
              SizedBox(height: 20),
              _txtPasswordPassword(),
              SizedBox(height: 20),
              _btnConfirm(),
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
          '输入新密码',
          textAlign: TextAlign.start,
          style: TextStyle(color: Colors.white, fontSize: 38),
        ));
  }

  Widget _txtOperate() {
    return Padding(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Text('密码登录',
            textAlign: TextAlign.start,
            style: TextStyle(color: Colors.white, fontSize: 20)));
  }

  Widget _txtPassword() {
    return Padding(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Container(
          height: 50.0,
          padding: EdgeInsets.fromLTRB(10, 5, 20, 0),
          decoration: ShapeDecoration(
            color: Colors.white30,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(6))),
          ),
          child: TextFormField(
            controller: this._passwordController,
            obscureText: passwordVisible,
            textAlign: TextAlign.start,
            style: TextStyle(color: Colors.white, fontSize: 16),
            decoration: InputDecoration(
              icon: Icon(Icons.lock),
              border: InputBorder.none,
              hintText: '请输入密码',
              hintStyle: TextStyle(
                  fontStyle: FontStyle.italic, color: Colors.grey[200]),
              contentPadding: EdgeInsets.symmetric(vertical: 8.0),
              suffixIcon: IconButton(
                icon: Icon(
                    passwordVisible ? Icons.visibility_off : Icons.visibility),
                onPressed: () {
                  setState(() {
                    passwordVisible = !passwordVisible;
                  });
                },
              ),
            ),
          ),
        ));
  }

  Widget _txtPasswordPassword() {
    return Padding(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Container(
          height: 50.0,
          padding: EdgeInsets.fromLTRB(10, 5, 20, 0),
          decoration: ShapeDecoration(
            color: Colors.white30,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(6))),
          ),
          child: TextFormField(
            controller: this._passwordConfirmController,
            obscureText: passwordConfirmVisible,
            textAlign: TextAlign.start,
            style: TextStyle(color: Colors.white, fontSize: 16),
            decoration: InputDecoration(
              icon: Icon(Icons.lock),
              border: InputBorder.none,
              hintText: '请再次输入密码',
              hintStyle: TextStyle(
                  fontStyle: FontStyle.italic, color: Colors.grey[200]),
              contentPadding: EdgeInsets.symmetric(vertical: 8.0),
              suffixIcon: IconButton(
                icon: Icon(passwordConfirmVisible
                    ? Icons.visibility_off
                    : Icons.visibility),
                onPressed: () {
                  setState(() {
                    passwordConfirmVisible = !passwordConfirmVisible;
                  });
                },
              ),
            ),
          ),
        ));
  }

  Widget _btnConfirm() {
    return Padding(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Container(
            height: 50,
            child: RawMaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6))),
                fillColor: Color.fromARGB(255, 68, 178, 232),
                splashColor: Color.fromARGB(200, 68, 178, 232),
                onPressed: () {
                  setState(() {
                    if (_passwordController.text.isEmpty)
                      TopReminder.open(context, '密码不能为空');
                    else if (_passwordConfirmController.text.isEmpty)
                      TopReminder.open(context, '密码确认不能为空');
                    else if (_passwordController.text !=
                        _passwordConfirmController.text)
                      TopReminder.open(context, '两次密码输入不一致');
                    else
                      TopReminder.open(context, '修改成功');
                  });
                },
                child: Text('确定',
                    style: TextStyle(color: Colors.white, fontSize: 20)))));
  }
}
