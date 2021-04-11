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
      body: _test1(),
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
}
