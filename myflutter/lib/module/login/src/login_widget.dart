import 'dart:io';

import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 69, 124, 187),
        body: Container(
          // width: 800,
          // height: 400,
          child: Stack(
            children: [
              Positioned(
                  top: 120,
                  left: 135,
                  child: Container(
                      width: 868 / 4,
                      height: 193 / 4,
                      child: Image.asset('assets/texture/app/logo.png'))),
              Positioned(
                  top: 190,
                  left: 170,
                  child: Container(
                      width: 868 / 4,
                      height: 193 / 4,
                      child: Text(
                        '健康+有趣=好习惯',
                        style: TextStyle(color: Colors.white, fontSize: 19),
                      ))),
              Positioned(
                  top: 300,
                  left: 24,
                  child: Container(
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                              alignment: Alignment.topLeft,
                              child: Text('密码登录',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16))),
                          SizedBox(height: 10),
                          Container(
                            width: 430.0,
                            height: 40.0,
                            padding: EdgeInsets.fromLTRB(50, 0, 20, 7),
                            decoration: ShapeDecoration(
                              color: Colors.white30,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6))),
                            ),
                            child: TextFormField(
                              controller: this._userNameController,
                              textAlign: TextAlign.start,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                              decoration: InputDecoration(
                                // icon: Icon(Icons.person),
                                border: InputBorder.none,
                                hintText: '请输入手机号',
                                hintStyle: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    color: Colors.white),
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 8.0),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            width: 430.0,
                            height: 40.0,
                            padding: EdgeInsets.fromLTRB(50, 0, 20, 7),
                            decoration: ShapeDecoration(
                              color: Colors.white30,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6))),
                            ),
                            child: TextFormField(
                              controller: this._passwordController,
                              obscureText: passwordVisible,
                              textAlign: TextAlign.start,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                              decoration: InputDecoration(
                                // icon: Icon(Icons.lock),
                                border: InputBorder.none,
                                hintText: '请输入密码',
                                hintStyle: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    color: Colors.white),
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 8.0),
                                suffixIcon: IconButton(
                                  icon: Icon(passwordVisible
                                      ? Icons.visibility_off
                                      : Icons.visibility),
                                  onPressed: () {
                                    setState(() {
                                      passwordVisible = !passwordVisible;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ))),
              Positioned(
                  top: 490,
                  left: 22,
                  child: Container(
                      alignment: Alignment.center,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                width: 435,
                                height: 50,
                                child: RawMaterialButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(6))),
                                    fillColor:
                                        Color.fromARGB(255, 68, 178, 232),
                                    splashColor:
                                        Color.fromARGB(200, 68, 178, 232),
                                    onPressed: () => print("clicked"),
                                    child: Text('登陆',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17)))),
                            SizedBox(height: 15),
                            Text('忘记密码',
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Colors.white,
                                    fontSize: 15))
                          ]))),
            ],
          ),
        ),
      ),
    );
  }
}
