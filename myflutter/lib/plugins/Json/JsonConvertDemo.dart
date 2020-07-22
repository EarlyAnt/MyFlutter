import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'Data.dart';

class JsonConvertDemo extends StatefulWidget {
  JsonConvertDemo({Key key}) : super(key: key);

  @override
  _JsonConvertDemoState createState() => _JsonConvertDemoState();
}

class _JsonConvertDemoState extends State<JsonConvertDemo> {
  List<Friend> _friends;

  @override
  void initState() {
    super.initState();
    this._loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text('Json Convert')),
        body: this._buildList(),
      ),
    );
  }

  void _loadData() async {
    String jsonString = await rootBundle.loadString('assets/friends.json');
    print('<><_JsonConvertDemoState._loadData>jsonString: ' + jsonString);
    List jsonFriend = json.decode(jsonString);
    // print('<><_JsonConvertDemoState._loadData>jsonFriend: ${jsonFriend}');
    this._friends = jsonFriend.map((m) => new Friend.fromJson(m)).toList();
    // print('<><_JsonConvertDemoState._loadData>this._friends: ${this._friends}');
    setState(() {
      print('<><_JsonConvertDemoState._loadData>setState');
      this._buildList();
    });
  }

  Widget _buildList() {
    return this._friends == null || this._friends.length == 0
        ? Center(child: Container(child: Text('正在加载...')))
        : Center(
            child: ListView.builder(
              itemCount: this._friends.length,
              itemBuilder: (context, index) => Card(
                child: Column(children: <Widget>[
                  Text('${this._friends[index].child_sn}'),
                  Text('${this._friends[index].child_name}'),
                  Text('${this._friends[index].game_level}'),
                  Text('${this._friends[index].game_crown_count}'),
                  Text('${this._friends[index].game_bronze_crown}'),
                  Text('${this._friends[index].game_silver_crown}'),
                  Text('${this._friends[index].game_golden_crown}'),
                  Text(this._friends[index].area.isEmpty ? '空' : '${this._friends[index].area}'),
                  Text('${this._friends[index].sort_index}'),
                  Text('${this._friends[index].cup_game_name}'),
                  Text('${this._friends[index].child_head_index}'),
                ]),
              ),
            ),
          );
  }
}
