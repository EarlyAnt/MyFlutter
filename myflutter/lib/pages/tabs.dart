import 'package:flutter/material.dart';
import 'homePage.dart';
import 'chat.dart';
import 'personalCenter.dart';

class Tabs extends StatefulWidget {
  Tabs({Key key}) : super(key: key);

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _currentIndex = 0;
  List _pageList = [
    HomePage(),
    Chat(),
    PersonalCenter(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text("练习-底部导航按钮")),
        body: this._pageList[this._currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: this._currentIndex,
          onTap: (int index) {
            setState(() {
              this._currentIndex = index;
              print(this._currentIndex);
            });
          },
          iconSize: 36.0,
          fixedColor: Colors.red,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("首页"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info),
              title: Text("聊天"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text("设置"),
            ),
          ],
        ),
      ),
    );
  }
}
