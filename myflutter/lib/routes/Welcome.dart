import 'dart:async';

import 'package:flutter/material.dart';
import '../module/login/login.dart';

class Welcome extends StatefulWidget {
  Welcome({Key key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;
  CurvedAnimation _animationCurve;
  Timer _timer;

  @override
  void initState() {
    this._animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    this._animationCurve =
        CurvedAnimation(parent: _animationController, curve: Curves.easeIn);
    this._animation = Tween(begin: 0.0, end: 1.0).animate(this._animationCurve);

    this._autoHide();
    super.initState();
  }

  @override
  void dispose() {
    if (this._timer != null) {
      this._timer.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    this._animationController.animateTo(1.0);

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/texture/bg01.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 175, 0, 0),
          child: Column(
            children: <Widget>[
              Container(
                  width: 96,
                  height: 96,
                  child: Image.asset('assets/texture/icon2.png')),
              SizedBox(height: 360.0),
              CustomFadeAnimation(
                widget: Text(
                  'flutter程序集',
                  style: TextStyle(
                      color: Colors.black.withAlpha(60), fontSize: 24),
                ),
              ),
              SizedBox(height: 10.0),
              CustomFadeAnimation(
                widget: Text(
                  'EarlyAnt',
                  style: TextStyle(
                      color: Colors.black.withAlpha(30),
                      fontStyle: FontStyle.italic,
                      fontSize: 20),
                ),
              ),
              SizedBox(height: 10.0),
              CustomFadeAnimation(
                widget: RaisedButton(
                  child: Text('Skip'),
                  onPressed: () {
                    this._timer.cancel();
                    Navigator.of(context).pushNamed('/home');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _autoHide() {
    this._timer = Timer(Duration(seconds: 5), () {
      print('<><_WelcomeState._autoHide>+ + + + +');
      // Navigator.of(context).pushNamed('/login', arguments: 'login_success');
      Navigator.push(context,
          new MaterialPageRoute(builder: (BuildContext context) {
        return VerifyNumberLoginView(parameter: 'verify_number_login_success');
      }));
      this._timer.cancel();
    });
  }
}

enum AnimationTypes {
  Fade,
  Move,
  Rotate,
  Scale,
}

class CustomFadeAnimation extends StatefulWidget {
  CustomFadeAnimation({Key key, this.widget}) : super(key: key);
  final Widget widget;

  @override
  _CustomFadeAnimationState createState() => _CustomFadeAnimationState();
}

class _CustomFadeAnimationState extends State<CustomFadeAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;
  CurvedAnimation _animationCurve;

  @override
  void initState() {
    this._animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    this._animationCurve =
        CurvedAnimation(parent: _animationController, curve: Curves.easeIn);
    this._animation = Tween(begin: 0.0, end: 1.0).animate(this._animationCurve);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    this._animationController.animateTo(1.0);
    return Container(
      child: FadeTransition(
        opacity: this._animation,
        child: widget.widget,
      ),
    );
  }
}
