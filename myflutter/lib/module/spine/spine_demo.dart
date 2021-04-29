import 'package:flutter/material.dart';
import 'package:flutter_spine/flutter_spine.dart';

class SpineDemoWidget extends StatefulWidget {
  final String title = 'spine动画演示';

  @override
  _SpineDemoWidgetState createState() => _SpineDemoWidgetState();
}

class _SpineDemoWidgetState extends State<SpineDemoWidget> {
  SkeletonAnimation _skeleton;
  bool _spineLoaded = false;

  @override
  void initState() {
    super.initState();
    _loadSkeleton();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Center(child: Text(widget.title))),
      body: Stack(children: <Widget>[
        Align(
            alignment: Alignment.center,
            child: Container(
                width: 300,
                height: 400,
                color: Colors.grey,
                child: SkeletonRenderObjectWidget(
                    skeleton: _skeleton,
                    alignment: Alignment.center,
                    fit: BoxFit.fill,
                    playState: PlayState.Playing))),
        Align(
            alignment: Alignment.center,
            child: Padding(
                padding: EdgeInsets.only(top: 450),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                        margin: const EdgeInsets.all(5.0),
                        child: MaterialButton(
                            child: const Text('Jump'),
                            textColor: Colors.white,
                            color: Colors.blue,
                            onPressed: () {
                              //新的序列播放方式
                              _skeleton.state
                                ..setAnimation(0, 'jump', false)
                                ..addAnimation(0, 'walk', true, 0.0);

                              // //老的序列播放方式
                              // _skeleton.state
                              //     .setAnimation(0, 'jump', false)
                              //     .onCompleteCallback = (trackEntry) {
                              //   print('[跳]播放完成，开始播放[走]');
                              //   _skeleton.state
                              //       .addAnimation(0, 'walk', true, 0.0);
                              // };
                            })),
                    Container(
                        margin: const EdgeInsets.all(5.0),
                        child: MaterialButton(
                            child: const Text('Shoot'),
                            textColor: Colors.white,
                            color: Colors.blue,
                            onPressed: () {
                              setState(() {
                                _skeleton.state
                                  ..setAnimation(0, 'shoot', false)
                                  ..addAnimation(0, 'walk', true, 0.0);
                              });
                            })),
                    Container(
                        margin: const EdgeInsets.all(5.0),
                        child: MaterialButton(
                            child: const Text('Death'),
                            textColor: Colors.white,
                            color: Colors.blue,
                            onPressed: () {
                              setState(() {
                                _skeleton.state
                                  ..setAnimation(0, 'death', false)
                                  ..addAnimation(0, 'walk', true, 0.0);
                              });
                            })),
                  ],
                ))),
      ]));

  void _loadSkeleton() {
    if (_spineLoaded) {
      return;
    }
    SkeletonAnimation.createWithFiles(
      'spineboy.atlas',
      'spineboy.json',
      'spineboy.png',
      pathPrefix: 'assets/spine/spineboy/',
    ).then((SkeletonAnimation skeleton) {
      skeleton.state.setAnimation(0, 'walk', true);
      setState(() => _skeleton = skeleton);
    });
    _spineLoaded = true;
  }
}
