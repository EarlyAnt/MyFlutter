import 'package:flutter/material.dart';
import 'tabs/Widgets.dart';
import 'tabs/Plugins.dart';
import 'tabs/Setting.dart';

class Tabs extends StatefulWidget {
  final index;
  Tabs({Key key, this.index = 0}) : super(key: key);

  _TabsState createState() => _TabsState(this.index);
}

class _TabsState extends State<Tabs> {
  int _currentIndex;
  _TabsState(index) {
    this._currentIndex = index;
  }

  List _pageList = [
    Widgets(),
    Plugins(),
    SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Flutter"),
      ),
      body: this._pageList[this._currentIndex],
      bottomNavigationBar: this._buildBottomNavigationBar(),
      drawer: this._buildDrawer(),
      // endDrawer: this._buildEndDrawer(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: this._currentIndex, //配置对应的索引值选中
      onTap: (int index) {
        setState(() {
          //改变状态
          this._currentIndex = index;
        });
      },
      iconSize: 36.0, //icon的大小
      fixedColor: Colors.blue, //选中的颜色
      type: BottomNavigationBarType.fixed, //配置底部tabs可以有多个按钮
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.adb),
          title: Text("Widgets"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.category),
          title: Text("Plugins"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          title: Text("Settings"),
        )
      ],
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: UserAccountsDrawerHeader(
                  accountName: Text("早起的蚂蚁123"),
                  accountEmail: Text("54763755@qq.com"),

                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage('assets/texture/wechat.jpg'),
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://www.itying.com/images/flutter/2.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  // otherAccountsPictures: <Widget>[
                  //   Image.network("https://www.itying.com/images/flutter/4.png"),
                  //   Image.network("https://www.itying.com/images/flutter/5.png"),
                  // ],
                ),
              ),
            ],
          ),
          ListTile(
            leading: CircleAvatar(child: Icon(Icons.home)),
            title: Text("我的空间"),
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(child: Icon(Icons.people)),
            title: Text("用户中心"),
            onTap: () {
              Navigator.of(context).pop(); //隐藏侧边栏
              Navigator.pushNamed(context, '/user');
            },
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(child: Icon(Icons.settings)),
            title: Text("设置中心"),
          ),
          Divider(),
        ],
      ),
    );
  }

  Widget _buildEndDrawer() {
    return Drawer(
      child: Text('右侧侧边栏'),
    );
  }
}
