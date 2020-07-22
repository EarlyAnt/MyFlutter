import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PlayerPrefsDemo extends StatefulWidget {
  PlayerPrefsDemo({Key key}) : super(key: key);

  @override
  _PlayerPrefsDemoState createState() => _PlayerPrefsDemoState();
}

class _PlayerPrefsDemoState extends State<PlayerPrefsDemo> {
  final String _YEAR = 'year';
  final String _THING = 'thing';
  SharedPreferences _playerPrefs;
  TextEditingController _yearController = TextEditingController();
  TextEditingController _thingsController = TextEditingController();

  @override
  void initState() {
    this._initPlayerPrefs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PlayerPrefs')),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
        child: Column(
          children: <Widget>[
            Card(
              child: Column(
                children: <Widget>[
                  Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    spacing: 2.0,
                    children: <Widget>[
                      Text('心愿1: 祈盼自己能有个平和的心境，来面对未来'),
                      Container(
                        width: 40.0,
                        height: 20.0,
                        child: TextField(
                          controller: this._yearController,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hintText: '年数',
                            hintStyle: TextStyle(fontStyle: FontStyle.italic),
                            contentPadding: EdgeInsets.symmetric(vertical: 8.0),
                          ),
                        ),
                      ),
                      Text('年的沪漂生活。'),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    spacing: 2.0,
                    children: <Widget>[
                      Text('心愿2: 祈盼自己能在未来的1～2年内，逐步推进在苏州的'),
                      Container(
                        width: 340.0,
                        height: 20.0,
                        child: TextField(
                          controller: this._thingsController,
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(
                            hintText: '事情',
                            hintStyle: TextStyle(fontStyle: FontStyle.italic),
                            contentPadding: EdgeInsets.symmetric(vertical: 8.0),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FloatingActionButton(
                  heroTag: 'read',
                  child: Text('读取'),
                  onPressed: () {
                    setState(() {
                      int year = this._playerPrefs.containsKey(_YEAR) ? this._playerPrefs.getInt(_YEAR) : 0;
                      String things = this._playerPrefs.containsKey(_THING) ? this._playerPrefs.getString(_THING) : '';
                      this._yearController.text = year.toString();
                      this._thingsController.text = things;
                    });
                  },
                ),
                SizedBox(width: 10.0),
                FloatingActionButton(
                  heroTag: 'write',
                  child: Text('保存'),
                  onPressed: () {
                    setState(() {
                      this._playerPrefs.setInt(_YEAR, int.parse(this._yearController.text));
                      this._playerPrefs.setString(_THING, this._thingsController.text);
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _initPlayerPrefs() async {
    this._playerPrefs = await SharedPreferences.getInstance();
  }
}
