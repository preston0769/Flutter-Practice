import "package:flutter/material.dart";
import 'first_screen.dart';
import 'second_screed.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  var index = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return index == 0
        ? FirstScreen(changeScreen: (int i) {
            setState(() {
              index = 1;
            });
          })
        : FreeAccountScreen(changeScreen: (int i) {
            setState(() {
              index = 0;
            });
          });
  }
}
