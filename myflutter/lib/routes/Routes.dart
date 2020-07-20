import 'package:flutter/material.dart';
import 'Tabs.dart';

/*----------------  animations  ----------------*/
import '../widgets/simple/animation/basic/AnimatedContainer.dart';
import '../widgets/simple/animation/basic/PageRouteBuilderDemo.dart';
import '../widgets/simple/animation/basic/AnimationControllerDemo.dart';
import '../widgets/simple/animation/basic/TweenDemo.dart';
import '../widgets/simple/animation/basic/AnimatedBuilderDemo.dart';
import '../widgets/simple/animation/basic/TypewriterTweenDemo.dart';

/*----------------origin control----------------*/
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
  '/animatedContainer': (context) => AnimatedContainerDemo(),
  '/pageRouteBuilder': (context) => PageRouteBuilderDemo(),
  '/animationController': (context) => AnimationControllerDemo(),
  '/tween': (context) => TweenDemo(),
  '/animatedBuilder': (context) => AnimatedBuilderDemo(),
  '/typewriterTween': (context) => TypewriterTweenDemo(),
};

//固定写法
var onGenerateRoute = (RouteSettings settings) {
  // 统一处理
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route = MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};
