import 'package:flutter/material.dart';

class LayoutTest extends StatefulWidget {
  LayoutTest({Key key}) : super(key: key);

  @override
  _LayoutTestState createState() => _LayoutTestState();
}

class _LayoutTestState extends State<LayoutTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 69, 124, 187),
      body: _test2(),
    );
  }

  Widget _test1() {
    return Container(
      color: Colors.blueAccent,
      child: Stack(
        //Stack布局控件是以其所有子控件确定边界，这一点跟不设置宽高的Container一样
        //alignment: Alignment.bottomCenter,//alignment属性使其子控件在此Stack的区域中定位
        children: [
          Container(
              //不设置宽高的Container，以其子控件的大小为大小
              color: Colors.amber,
              child: Text('文本',
                  style: TextStyle(fontSize: 36), textAlign: TextAlign.center)),
          Padding(
            //Padding控件的作用是，使其子控件在父控件中确定一个位置或边界，
            //如果只设置某个轴向上的一个值，效果为“绑定到与某边界多少距离的位置”；
            //如果设置了某个轴向上的两个值，效果为“在此轴向上自适应大小”
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 200),
            child: Container(
                color: Colors.cyan,
                child: Text('边界',
                    style: TextStyle(fontSize: 88),
                    textAlign: TextAlign.center)),
          ),
        ],
      ),
    );
  }

  Widget _test2() {
    //padding约束的是控件内部的边界，margin约束的是控件外部的边界
    return Container(
      color: Colors.lime[100],
      child: Stack(
        children: [
          Container(
              margin: EdgeInsets.all(
                  20), //flutter中的margin只对控件本身有效，与周边的其他控件无效，这一点与Winform中的不同
              decoration: BoxDecoration(
                  color: Colors
                      .black26, //decoration中指定了color，Container就不能再指定color了，两者冲突
                  border: Border.all(color: Colors.red, width: 3),
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  shape: BoxShape.rectangle),
              child: Text('陈钰琪',
                  style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      color: Colors.red[100]))),
          Container(
              margin: EdgeInsets.all(120),
              decoration: BoxDecoration(
                  color: Colors.black26,
                  border: Border.all(color: Colors.red, width: 3),
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  shape: BoxShape.rectangle),
              child: Text('赵丽颖',
                  style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      color: Colors.greenAccent))),
          Container(
              margin: EdgeInsets.all(220),
              decoration: BoxDecoration(
                  color: Colors.black26,
                  border: Border.all(color: Colors.red, width: 3),
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  shape: BoxShape.rectangle),
              child: Text('张雨绮',
                  style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[100]))),
        ],
      ),
    );
  }
}
