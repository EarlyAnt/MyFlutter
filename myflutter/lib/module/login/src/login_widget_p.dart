import 'dart:io';

import 'package:flutter/material.dart';
import '../../reminder/src/topReminder_widget.dart';

class PasswordLoginView extends StatefulWidget {
  //Login({Key key}) : super(key: key);

  final String parameter;
  PasswordLoginView({
    @required this.parameter,
  });

  @override
  _PasswordLoginViewState createState() => _PasswordLoginViewState();
}

class _PasswordLoginViewState extends State<PasswordLoginView> {
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
          child: Stack(
            children: [
              Positioned(top: 120, left: 135, child: _imgLogo()),
              Positioned(top: 190, left: 170, child: _txtTitle()),
              Positioned(top: 15, right: 10, child: _txtLoginType()),
              Positioned(
                  top: 300,
                  left: 24,
                  child: Container(
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _txtOperate(),
                          SizedBox(height: 10),
                          _txtPhone(),
                          SizedBox(height: 20),
                          _txtPassword(),
                        ],
                      ))),
              Positioned(
                top: 470,
                left: 22,
                child: Container(
                  alignment: Alignment.center,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(width: 435, height: 50, child: _btnLogin()),
                        _btnLink()
                      ]),
                ),
              ),
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
          style: TextStyle(color: Colors.white, fontSize: 20),
        ));
  }

  Widget _txtLoginType() {
    return TextButton(
      onPressed: () {
        print('验证码登陆');
        Navigator.of(context).pushNamed('/login_v');
      },
      child: Text(
        '验证码登陆',
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }

  Widget _txtOperate() {
    return Align(
        alignment: Alignment.topLeft,
        child: Text('密码登录',
            textAlign: TextAlign.start,
            style: TextStyle(color: Colors.white, fontSize: 20)));
  }

  Widget _txtPhone() {
    return Container(
      width: 430.0,
      height: 50.0,
      padding: EdgeInsets.fromLTRB(10, 0, 20, 0),
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
          hintStyle:
              TextStyle(fontStyle: FontStyle.italic, color: Colors.grey[200]),
          contentPadding: EdgeInsets.symmetric(vertical: 8.0),
        ),
      ),
    );
  }

  Widget _txtPassword() {
    return Container(
      width: 430.0,
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
          hintStyle:
              TextStyle(fontStyle: FontStyle.italic, color: Colors.grey[200]),
          contentPadding: EdgeInsets.symmetric(vertical: 8.0),
          suffixIcon: IconButton(
            icon:
                Icon(passwordVisible ? Icons.visibility_off : Icons.visibility),
            onPressed: () {
              setState(() {
                passwordVisible = !passwordVisible;
              });
            },
          ),
        ),
      ),
    );
  }

  Widget _btnLogin() {
    return RawMaterialButton(
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
            else if (_passwordController.text.isEmpty)
              TopReminder.open(context, '请输入密码');
            else if (!_loginVerify())
              TopReminder.open(context, '用户名或密码错误');
            else
              TopReminder.open(context, '登陆成功');
          });
        },
        child: Text('登陆', style: TextStyle(color: Colors.white, fontSize: 20)));
  }

  Widget _btnLink() {
    return TextButton(
      onPressed: () => print('忘记密码'),
      child: Text('忘记密码',
          style: TextStyle(
              decoration: TextDecoration.underline,
              color: Colors.white,
              fontSize: 20)),
    );
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
