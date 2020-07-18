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
              children: <Widget>[
                Expanded(
                  child: TabBar(
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
                  ),
                )
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Container(alignment: Alignment.center, child: Text('Button')),
              Container(alignment: Alignment.center, child: Text('TextField')),
              Container(alignment: Alignment.center, child: Text('ListView')),
              Container(alignment: Alignment.center, child: Text('GridView')),
              Container(alignment: Alignment.center, child: Text('Animation')),
              Origin(),
            ],
          )),
    );
  }
}
