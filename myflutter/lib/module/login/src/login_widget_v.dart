import 'dart:io';

import 'package:flutter/material.dart';
import '../../reminder/src/topReminder_widget.dart';

class VerifyNumberLoginView extends StatefulWidget {
  //Login({Key key}) : super(key: key);

  final String parameter;
  VerifyNumberLoginView({
    @required this.parameter,
  });

  @override
  _VerifyNumberLoginViewState createState() => _VerifyNumberLoginViewState();
}

class _VerifyNumberLoginViewState extends State<VerifyNumberLoginView> {
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool passwordVisible = true;

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
              SizedBox(height: 20),
              _txtLoginType(),
              SizedBox(height: 100),
              _imgLogo(),
              SizedBox(height: 20),
              _txtTitle(),
              SizedBox(height: 80),
              _txtOperate(),
              SizedBox(height: 10),
              _txtPhone(),
              SizedBox(height: 20),
              _btnGetVerifyNumber(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _imgLogo() {
    return Container(
        width: 868 / 4,
        height: 193 / 4,
        child: Image.asset('assets/texture/app/logo.png'));
  }

  Widget _txtTitle() {
    return Container(
        width: 868 / 4,
        height: 193 / 4,
        child: Text(
          '健康+有趣=好习惯',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ));
  }

  Widget _txtLoginType() {
    return Padding(
        padding: EdgeInsets.fromLTRB(280, 0, 0, 0),
        child: TextButton(
          onPressed: () {
            print('密码登陆');
            Navigator.of(context).pushReplacementNamed('/login_p');
          },
          child: Text(
            '密码登陆',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ));
  }

  Widget _txtOperate() {
    return Padding(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Text('手机号登陆/注册',
            textAlign: TextAlign.start,
            style: TextStyle(color: Colors.white, fontSize: 20)));
  }

  Widget _txtPhone() {
    return Padding(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Container(
          height: 50.0,
          padding: EdgeInsets.fromLTRB(8, 0, 20, 0),
          decoration: ShapeDecoration(
            color: Colors.white30,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(6))),
          ),
          child: TextFormField(
            controller: this._userNameController,
            textAlign: TextAlign.start,
            style: TextStyle(color: Colors.white, fontSize: 16),
            decoration: InputDecoration(
              icon: Icon(Icons.person),
              border: InputBorder.none,
              hintText: '请输入手机号',
              hintStyle: TextStyle(
                  fontStyle: FontStyle.italic, color: Colors.grey[200]),
              contentPadding: EdgeInsets.symmetric(vertical: 8.0),
            ),
          ),
        ));
  }

  Widget _btnGetVerifyNumber() {
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
                    if (_userNameController.text.isEmpty)
                      TopReminder.open(context, '手机号不能为空');
                    else if (!_phoneNumberValid(_userNameController.text))
                      TopReminder.open(context, '请输入正确的手机号');
                    else
                      TopReminder.open(context, '验证码获取成功');
                  });
                },
                child: Text('获取验证码',
                    style: TextStyle(color: Colors.white, fontSize: 20)))));
  }

  bool _phoneNumberValid(String str) {
    return new RegExp(
            '^((13[0-9])|(15[^4])|(166)|(17[0-8])|(18[0-9])|(19[8-9])|(147,145))\\d{8}\$')
        .hasMatch(str);
  }

  bool _loginVerify() {
    if (_userNameController.text == '17621798266' &&
        _passwordController.text == '123')
      return true;
    else
      return false;
  }
}