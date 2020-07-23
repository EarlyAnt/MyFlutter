import 'dart:math' as math;

import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';

class CircularProgressDemo extends StatefulWidget {
  @override
  _CircularProgressDemoState createState() => _CircularProgressDemoState();
}

class _CircularProgressDemoState extends State<CircularProgressDemo> {
  var data = <double>[0.1, 0.3, 0.5, 0.7, null];
  double _progress = 0.0;
  double _angleZ = 0.0;
  bool _customProgressBar = true;
  bool _stopRefresh = false;

  @override
  void initState() {
    this._refreshValue(3);
    super.initState();
  }

  @override
  void dispose() {
    this._stopRefresh = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Circular Progress')),
      body: Center(
          child: Column(
        children: <Widget>[
          RaisedButton(
            color: Colors.blue,
            child: Text(this._customProgressBar ? '显示标准进度条' : '显示自定义进度条'),
            onPressed: () {
              // setState(() {
              this._customProgressBar = !this._customProgressBar;
              // });
            },
          ),
          SizedBox(height: 120.0),
          Visibility(
            visible: !this._customProgressBar,
            child: Wrap(
              spacing: 15,
              children: data.map((e) => this._buildProgressBar(e)).toList(),
            ),
          ),
          Visibility(
            visible: this._customProgressBar,
            child: Column(
              children: <Widget>[
                this._buildProgressBar(this._progress),
                SizedBox(height: 20.0),
                Text('Angle: ' + NumUtil.getNumByValueDouble(this._angleZ, 1).toString()),
                this._buildSlideBar(),
              ],
            ),
          )
        ],
      )),
    );
  }

  Widget _buildProgressBar(double value) {
    return Transform.rotate(
      angle: (this._angleZ * math.pi) / 180,
      child: Container(
        width: 50,
        height: 50,
        // transform: Matrix4.skewY(0.3),
        child: CircularProgressIndicator(
          value: value,
          backgroundColor: Colors.grey.withAlpha(33),
          valueColor: AlwaysStoppedAnimation(Colors.orange),
          strokeWidth: 5,
        ),
      ),
    );
  }

  Widget _buildSlideBar() {
    return Container(
      width: 300.0,
      child: Column(
        children: <Widget>[
          Slider(
            value: this._angleZ,
            max: 360.0,
            min: 0.0,
            activeColor: Colors.blue,
            onChanged: (double value) {
              this.setState(() {
                this._angleZ = value;
              });
            },
          ),
          Wrap(
            spacing: 20.0,
            children: <Widget>[
              this._buildAngleButton(0),
              this._buildAngleButton(90),
              this._buildAngleButton(180),
              this._buildAngleButton(225),
              this._buildAngleButton(270),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAngleButton(double angle) {
    return RaisedButton(
        child: Text('$angle度'),
        onPressed: () {
          this._angleZ = angle;
        });
  }

  void _refreshValue(double duration) {
    setState(() {
      Future.delayed(Duration(milliseconds: 20)).then((value) {
        this._progress = this._progress < 1 ? this._progress + ((1 / duration) / 20) : 0.0;
        if (this._stopRefresh) {
          return;
        } else {
          this._refreshValue(duration);
        }
      });
    });
  }
}
