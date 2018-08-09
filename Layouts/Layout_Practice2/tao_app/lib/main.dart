import "package:flutter/material.dart";
import 'package:tao_app/first_screen.dart';
import 'package:tao_app/second_screed.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new FreeAccountScreen() 
    );
  }
}
