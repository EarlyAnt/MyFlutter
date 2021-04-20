import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  TextEditingController _passwordController = TextEditingController();

  @override
  _PasswordFieldState createState() => _PasswordFieldState();

  String getPassword() {
    return _passwordController.text;
  }
}

class _PasswordFieldState extends State<PasswordField> {
  bool _passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: widget._passwordController,
        obscureText: _passwordVisible,
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
            icon: Icon(
                _passwordVisible ? Icons.visibility_off : Icons.visibility),
            onPressed: () {
              setState(() {
                _passwordVisible = !_passwordVisible;
                print("_passwordVisible: " + _passwordVisible.toString());
              });
            },
          ),
        ),
      ),
    );
  }
}
