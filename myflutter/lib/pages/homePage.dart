import 'dart:io';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _disposed;
  Duration _duration;
  int _imageIndex;
  Map<int, Image> _images;
  var _rawImage;

  @override
  void initState() {
    super.initState();
    _disposed = false;
    _duration = Duration(milliseconds: 83);
    _imageIndex = 1;
    _images = this._getImages();
    this._updateImage();
  }

  @override
  void dispose() {
    super.dispose();
    _disposed = true;
    this._getImages().clear();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 240.0,
        height: 320.0,
        alignment: Alignment.center,
        child: this._rawImage != null
            ? Image(image: this._rawImage)
            : Container(child: Text('加载中。。。')),
      ),
    );
  }

  Map<int, Image> _getImages() {
    Directory dir = new Directory(
        '/Users/gaobo/FlutterPractice/MyFlutter/myflutter/asset/animations/paint');
    List<FileSystemEntity> files = dir.listSync();
    List<String> fileNames = [];
    for (var file in files) {
      if (FileSystemEntity.isFileSync(file.path)) {
        fileNames.add(file.path);
      }
    }
    fileNames.sort();

    Map<int, Image> images = {};
    int index = 1;
    for (String fileName in fileNames) {
      print('##file_$index -> $fileName\n');
      images[index] = Image.file(File(fileName));
      index += 1;
    }
    return images;
  }

  void _updateImage() {
    if (_disposed || this._images.isEmpty) {
      return;
    }

    setState(() {
      this._rawImage = this._images[this._imageIndex].image;
      this._imageIndex =
          this._imageIndex >= this._images.length ? 1 : this._imageIndex + 1;
      print('<><_HomePageState._updateImage>current image: ${this._rawImage}');
    });

    Future.delayed(_duration, () {
      _updateImage();
    });
  }
}
