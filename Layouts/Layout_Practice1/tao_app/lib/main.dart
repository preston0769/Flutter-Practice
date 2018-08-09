import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tao_app/firstScreen.dart';
import 'package:tao_app/secondScreen.dart';

void main() => runApp(new TaoApp());

class TaoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new Scaffold(
          body: 
         new BackGroundWidget(
      content: new SecondScreen(),
    )));
  }
}

class BackGroundWidget extends StatelessWidget {
  Widget content;

  BackGroundWidget({@required this.content});

  @override
  Widget build(BuildContext context) {
    return new Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: new AssetImage('assets/images/Bk.jpg'), fit: BoxFit.cover),
        ),
        child: BackdropFilter(
            filter: new ImageFilter.blur(sigmaX: 12.0, sigmaY: 10.0),
            child: new SafeArea(
              child: content,
            )));
  }
}
