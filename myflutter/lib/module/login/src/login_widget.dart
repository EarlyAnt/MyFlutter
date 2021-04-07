import 'dart:io';

import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        style: new TextStyle(color: Colors.white, fontSize: 19),
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
                                  style: new TextStyle(
                                      color: Colors.white, fontSize: 16))),
                          Container(
                            width: 430.0,
                            height: 30.0,
                            child: TextField(
                              controller: this._userNameController,
                              textAlign: TextAlign.start,
                              style: new TextStyle(
                                  color: Colors.white, fontSize: 16),
                              decoration: InputDecoration(
                                hintText: '用户名',
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
                            height: 30.0,
                            child: TextField(
                              controller: this._passwordController,
                              textAlign: TextAlign.start,
                              style: new TextStyle(
                                  color: Colors.white, fontSize: 16),
                              decoration: InputDecoration(
                                hintText: '密码',
                                hintStyle: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    color: Colors.white),
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 8.0),
                              ),
                            ),
                          ),
                        ],
                      ))),
              Positioned(
                  top: 410,
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
                                        style: new TextStyle(
                                            color: Colors.white,
                                            fontSize: 17)))),
                            SizedBox(height: 10),
                            Text('忘记密码',
                                style: new TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Colors.white,
                                    fontSize: 15))
                          ]))),
            ],
          ),
        ));
  }
}
