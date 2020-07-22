import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class Plugins extends StatefulWidget {
  Plugins({Key key}) : super(key: key);

  _PluginsState createState() => _PluginsState();
}

class _PluginsState extends State<Plugins> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
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
                      Tab(text: "Camera"),
                      Tab(text: "Dio"),
                      Tab(text: "Jason"),
                      Tab(text: "Nosql"),
                    ],
                  ),
                )
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              ListView(
                padding: EdgeInsets.fromLTRB(100, 0, 100, 0),
                children: <Widget>[
                  this._buildRaiseButton('Camera', '/camera'),
                  this._buildRaiseButton('Json Convert', '/json'),
                  this._buildActionButton('Print Path', () => this._printPath()),
                ],
              ),
              Container(alignment: Alignment.center, child: Text('Dio')),
              Container(alignment: Alignment.center, child: Text('Jason')),
              Container(alignment: Alignment.center, child: Text('Nosql')),
            ],
          )),
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

  Widget _buildActionButton(String buttonText, Function callback) {
    return RaisedButton(
      child: Text(buttonText),
      color: Colors.blue,
      textColor: Colors.white,
      onPressed: () {
        if (callback != null) callback();
      },
    );
  }

  Future<void> _printPath() async {
    final Directory libraryPath = await getLibraryDirectory();
    // final Directory downloadPath = await getDownloadsDirectory();
    // final Directory temporaryPath = await getTemporaryDirectory();
    // final Directory storagePath = await getExternalStorageDirectory();
    final Directory supportPath = await getApplicationSupportDirectory();
    final Directory documentPath = await getApplicationDocumentsDirectory();

    print('1.libraryPath -> ${libraryPath.path}');
    // print('2.downloadPath -> ${downloadPath.path}');
    // print('3.temporaryPath -> ${temporaryPath.path}');
    // print('4.storagePath -> ${storagePath.path}');
    print('5.supportPath -> ${supportPath.path}');
    print('6.documentPath -> ${documentPath.path}');
  }
}
