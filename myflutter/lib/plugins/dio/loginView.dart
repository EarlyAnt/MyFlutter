import 'dart:io';

import 'package:flutter/material.dart';
import 'package:myflutter/utils/dio/dioUtils.dart';

class LoginView extends StatefulWidget {
  LoginView({Key key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var _userName = TextEditingController();
  var _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('登录', textAlign: TextAlign.center),
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(0.0, 80.0, 12.0, 0.0),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/texture/b1.jpg'),
                  fit: BoxFit.cover)),
          child: Column(
            children: <Widget>[
              Image.asset(
                'assets/texture/jingyu.jpg',
                width: 200.0,
                height: 200.0,
                fit: BoxFit.fill,
              ),
              SizedBox(height: 20.0),
              Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    //child: Icon(Icons.home, size: 28),
                    child: Image.asset(
                      "assets/texture/user.png",
                      width: 28.0,
                      height: 28.0,
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: '请输入用户名',
                          hintStyle: TextStyle(color: Colors.white60)),
                      maxLines: 1,
                      maxLength: 20,
                      style: TextStyle(color: Colors.white),
                      controller: _userName,
                    ),
                    // ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    // child: Icon(Icons.pages, size: 28),
                    child: Image.asset(
                      "assets/texture/password.png",
                      width: 28.0,
                      height: 28.0,
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: '请输入密码',
                          hintStyle: TextStyle(color: Colors.white60)),
                      maxLines: 1,
                      maxLength: 20,
                      style: TextStyle(color: Colors.white),
                      controller: _password,
                    ),
                  ),
                ],
              ),
              FlatButton(
                child: Text('登陆'),
                color: Colors.blue,
                highlightColor: Color(0xffF88B0A),
                onPressed: () {
                  print('username: ' + _userName.text);
                  print('password: ' + _password.text);
                  _login(_userName.text, _password.text);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

Future _login(String userName, String password) {
  Map<String, String> head = {};
  // Map<String, String> body = {
  //   'email': '54763755@qq.com',
  //   'password': 'bobo123456'
  // };
  Map<String, String> body = {
    'email': userName,
    'password': password,
  };

  DioUtils.postHttp(
    'https://m.api.gululu-a.com:9443/api/v1/m/user/login',
    parameters: body,
    onSuccess: (data) {
      print(data);
    },
    onError: (errorText) {
      print(errorText);
    },
  );
}
