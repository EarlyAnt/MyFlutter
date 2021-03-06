import 'package:flutter/material.dart';

/*--------------------pages---------------------*/
import 'Welcome.dart';
import 'HomePage.dart';

/*-------------------buttons--------------------*/
import '../widgets/simple/button/CircularProgressDemo.dart';

/*------------------animations------------------*/
import '../widgets/simple/animation/basic/AnimatedContainer.dart';
import '../widgets/simple/animation/basic/PageRouteBuilderDemo.dart';
import '../widgets/simple/animation/basic/AnimationControllerDemo.dart';
import '../widgets/simple/animation/basic/TweenDemo.dart';
import '../widgets/simple/animation/basic/AnimatedBuilderDemo.dart';
import '../widgets/simple/animation/basic/TypewriterTweenDemo.dart';
import '../widgets/simple/animation/basic/FadeTransitionDemo.dart';

import '../widgets/simple/animation/misc/AnimatedList.dart';
import '../widgets/simple/animation/misc/AnimatedPositioned.dart';
import '../widgets/simple/animation/misc/AnimatedSwitcher.dart';
import '../widgets/simple/animation/misc/CardSwipe.dart';
import '../widgets/simple/animation/misc/Carousel.dart';
import '../widgets/simple/animation/misc/CurvedAnimation.dart';
import '../widgets/simple/animation/misc/ExpandCard.dart';
import '../widgets/simple/animation/misc/FocusImage.dart';
import '../widgets/simple/animation/misc/HeroAnimation.dart';
import '../widgets/simple/animation/misc/PhysicsCardDrag.dart';
import '../widgets/simple/animation/misc/RepeatingAnimation.dart';

/*----------------origin control----------------*/
import '../widgets/simple/origin/Button.dart';
import '../widgets/simple/origin/TextField.dart';
import '../widgets/simple/origin/CheckBox.dart';
import '../widgets/simple/origin/Radio.dart';

/*--------------------plugins-------------------*/
import '../plugins/camera/CameraDemo.dart';
import '../plugins/dio/loginView.dart';
import '../plugins/json/JsonConvertDemo.dart';
import '../plugins/playerPrefs/PlayerPrefsDemo.dart';

//配置路由
final routes = {
  /*--------------------pages-------------------*/
  '/': (context) => Welcome(),
  '/home': (context) => HomePage(),

  /*-------------------buttons------------------*/
  '/circularProgress': (context) => CircularProgressDemo(),

  /*-----------------animations-----------------*/
  '/animatedContainer': (context) => AnimatedContainerDemo(),
  '/pageRouteBuilder': (context) => PageRouteBuilderDemo(),
  '/animationController': (context) => AnimationControllerDemo(),
  '/tween': (context) => TweenDemo(),
  '/animatedBuilder': (context) => AnimatedBuilderDemo(),
  '/typewriterTween': (context) => TypewriterTweenDemo(),
  '/fadeTransition': (context) => FadeTransitionDemo(),
  '/animatedList': (context) => AnimatedListDemo(),
  '/animatedPositioned': (context) => AnimatedPositionedDemo(),
  '/animatedSwitcher': (context) => AnimatedSwitcherDemo(),
  '/cardSwipe': (context) => CardSwipeDemo(),
  '/carousel': (context) => CarouselDemo(),
  '/curvedAnimation': (context) => CurvedAnimationDemo(),
  '/expandCard': (context) => ExpandCardDemo(),
  '/focusImage': (context) => FocusImageDemo(),
  '/heroAnimation': (context) => HeroAnimationDemo(),
  '/physicsCardDrag': (context) => PhysicsCardDragDemo(),
  '/repeatingAnimation': (context) => RepeatingAnimationDemo(),

  /*-------------------plugins------------------*/
  '/camera': (context) => CameraDemo(),
  '/loginView': (context) => LoginView(),
  '/json': (context) => JsonConvertDemo(),
  '/playerPrefs': (context) => PlayerPrefsDemo(),

  /*-------------------origins------------------*/
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
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route = MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};
