import 'package:flutter/material.dart';

class FreeAccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xBBA5A3A5),
        elevation: 0.0,
        title: new Text(
          "Sign Up".toUpperCase(),
          style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
              letterSpacing: 2.0),
        ),
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          FractionallySizedBox(
              heightFactor: 0.3,
              child: new Container(
                color: Colors.red,
              )),
          FractionallySizedBox(
              heightFactor: 0.2,
              child: new Container(
                color: Colors.blue,
              ))
        ],
      ),
    );
  }
}
