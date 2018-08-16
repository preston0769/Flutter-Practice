import 'dart:ui';
import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  var buttonTextStyle = TextStyle(
      color: Color(0xEE666666),
      fontSize: 16.0,
      letterSpacing: 2.0,
      fontWeight: FontWeight.w400);

  @override
  Widget build(BuildContext context) {
    return new Container(
        child: SizedBox.expand(
      child: new Column(
        children: <Widget>[
          new SizedBox(
            height: 50.0,
          ),
          new Text("minimal".toUpperCase(),
              style: TextStyle(
                  fontSize: 32.0,
                  color: Colors.black,
                  letterSpacing: 12.0,
                  fontWeight: FontWeight.w200,
                  decoration: TextDecoration.none)),
          new Expanded(
              child: new Padding(
            padding: EdgeInsets.all(20.0),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                new SizedBox(
                    width: double.infinity,
                    child: new RaisedButton(
                      elevation: 0.0,
                      padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                      color: Colors.white,
                      colorBrightness: Brightness.light,
                      child:
                          Text('Login'.toUpperCase(), style: buttonTextStyle),
                      onPressed: () {},
                    )),
                new SizedBox(
                  height: 20.0,
                ),
                new SizedBox(
                    width: double.infinity,
                    child: new RaisedButton(
                      elevation: 0.0,
                      padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                      color: Colors.white,
                      child: Text('Register'.toUpperCase(),
                          style: buttonTextStyle),
                      onPressed: () {},
                    )),
              ],
            ),
          ))
        ],
      ),
    ));
  }
}
