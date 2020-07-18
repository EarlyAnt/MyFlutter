import 'package:flutter/material.dart';
import 'Tabs.dart';


/*----------------origin control----------------*/
import '../widgets/simple/origin/Origin.dart';
import '../widgets/simple/origin/Button.dart';
import '../widgets/simple/origin/TextField.dart';
import '../widgets/simple/origin/CheckBox.dart';
import '../widgets/simple/origin/Radio.dart';

//配置路由
final routes = {
  '/': (context) => Tabs(),
  '/buttonPage': (context) => ButtonDemoPage(),
  '/textField': (context) => TextFieldDemoPage(),
  '/checkBox': (context) => CheckBoxDemo(),
  '/radio': (context) => RadioDemo(),
};

//固定写法
var onGenerateRoute = (RouteSettings settings) {
  // 统一处理
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};
