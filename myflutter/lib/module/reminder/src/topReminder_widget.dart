import 'dart:async';
import 'package:flutter/material.dart';

//自定义的顶部提醒组件
class TopReminder extends StatefulWidget {
  ///提醒文本。
  final String reminderText;

  TopReminder({
    @required this.reminderText,
  });

  @override
  _TopReminderState createState() => _TopReminderState();

  static void open(context, String reminderText) {
    Navigator.of(context).push(
      PageRouteBuilder(
          opaque: false,
          pageBuilder: (BuildContext context, _, __) {
            return TopReminder(reminderText: reminderText);
          },
          transitionsBuilder:
              (_, Animation<double> animation, __, Widget child) {
            return FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(0.0, -0.3),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              ),
            );
          }),
    );
  }
}

class _TopReminderState extends State<TopReminder> {
  Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer(
      Duration(seconds: 2),
      () {
        Navigator.of(context).pop(true);
      },
    );
  }

  void _cancelTimer() {
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 95.0,
            color: const Color(0xFFFF6F6F),
            child: Align(
              alignment: Alignment(0, 0.8),
              //使用材料（`Material`）组件来避免文本下方的黄色线条。
              child: Material(
                color: const Color(0xFFFF6F6F),
                child: Text(
                  widget.reminderText,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            padding: EdgeInsets.only(bottom: 7.0),
          ),
        ],
      ),
      onTap: () {
        _cancelTimer();
        Navigator.of(context).pop(true);
      },
    );
  }
}
