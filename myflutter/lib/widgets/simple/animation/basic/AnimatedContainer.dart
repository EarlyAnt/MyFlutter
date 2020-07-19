import 'dart:math';
import 'package:flutter/material.dart';

double generateBorderRadius() => Random().nextDouble() * 64;
double generateMargin() => Random().nextDouble() * 64;
Color generateColor() => Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF));

class AnimatedContainerDemo extends StatefulWidget {
  AnimatedContainerDemo({Key key}) : super(key: key);

  @override
  _AnimatedContainerDemoState createState() => _AnimatedContainerDemoState();
}

class _AnimatedContainerDemoState extends State<AnimatedContainerDemo> {
  Color _color;
  double _borderRadius;
  double _margin;

  @override
  Widget build(BuildContext context) {
    // print('<><_AnimatedContainerDemoState.build>${DateTime.now()}');
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AnimatedContainer(
                width: 128,
                height: 128,
                margin: EdgeInsets.all(this._margin),
                padding: EdgeInsets.all(30.0),
                decoration: BoxDecoration(
                    color: this._color,
                    borderRadius: BorderRadius.circular(this._borderRadius)),
                duration: Duration(milliseconds: 200),
                child: FloatingActionButton(
                  child: Text('Play'),
                  onPressed: () {
                    this._change();
                  },
                ),
              ),
              Text(
                '点击Play按钮，切换AnimatedContainer的margin, color, borderRadius属性',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    // print('<><_AnimatedContainerDemoState.initState>${DateTime.now()}');
    _color = Colors.deepPurple;
    _borderRadius = generateBorderRadius();
    _margin = generateMargin();
    super.initState();
  }

  void _change() {
    setState(() {
      _color = generateColor();
      _borderRadius = generateBorderRadius();
      _margin = generateMargin();
    });
  }
}
