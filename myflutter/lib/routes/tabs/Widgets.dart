import 'package:flutter/material.dart';
import 'package:myflutter/widgets/simple/origin/Origin.dart';

class Widgets extends StatefulWidget {
  Widgets({Key key}) : super(key: key);

  _WidgetsState createState() => _WidgetsState();
}

class _WidgetsState extends State<Widgets> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[Expanded(child: this._buildTabBar())],
            ),
          ),
          body: this._buildTabBarView()),
    );
  }

  Widget _buildTabBar() {
    return TabBar(
      isScrollable: true, //如果多个按钮的话可以滑动
      indicatorColor: Colors.yellow,
      labelColor: Colors.yellow,
      unselectedLabelColor: Colors.white,
      indicatorSize: TabBarIndicatorSize.label,
      tabs: <Widget>[
        Tab(text: "Button"),
        Tab(text: "TextField"),
        Tab(text: "ListView"),
        Tab(text: "GridView"),
        Tab(text: "Animation"),
        Tab(text: "Origin"),
      ],
    );
  }

  Widget _buildTabBarView() {
    return TabBarView(
      children: <Widget>[
        ListView(
          padding: EdgeInsets.fromLTRB(100, 0, 100, 0),
          children: <Widget>[
            this._buildRaiseButton('Animated Container', '/animatedContainer'),
            this._buildRaiseButton('PageRouteBuilder', '/pageRouteBuilder'),
            this._buildRaiseButton(
                'AnimationController', '/animationController'),
            this._buildRaiseButton('Tween', '/tween'),
          ],
        ),
        Container(alignment: Alignment.center, child: Text('TextField')),
        Container(alignment: Alignment.center, child: Text('ListView')),
        Container(alignment: Alignment.center, child: Text('GridView')),
        Container(alignment: Alignment.center, child: Text('Animation')),
        Origin(),
      ],
    );
  }

  Widget _buildRaiseButton(String buttonText, String routeName) {
    return RaisedButton(
      child: Text(buttonText),
      color: Colors.blue,
      textColor: Colors.white,
      onPressed: () {
        Navigator.pushNamed(context, routeName);
      },
    );
  }
}
