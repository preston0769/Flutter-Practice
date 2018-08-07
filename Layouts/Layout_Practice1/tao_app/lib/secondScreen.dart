import 'package:flutter/material.dart';
import 'dart:ui';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
        child: SizedBox.expand(
            child: new Column(children: <Widget>[
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
      new SizedBox(
        height: 50.0,
      ),
      new Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Padding(
              padding: EdgeInsets.all(20.0),
              child: Container(
                  child: new Column(children: <Widget>[
                new SizedBox(
                    width: double.infinity,
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              fillColor: Colors.white,
                              filled: true,
                              contentPadding: EdgeInsets.all(16.0),
                              hintText: "Username"),
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              letterSpacing: 1.0),
                        ))),
                new SizedBox(
                  height: 20.0,
                ),
                new SizedBox(
                    width: double.infinity,
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              fillColor: Colors.white,
                              filled: true,
                              contentPadding: EdgeInsets.all(16.0),
                              hintText: "Password"),
                          obscureText: true,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              letterSpacing: 1.0),
                        )))
              ])),
            ),
            new SizedBox(
                width: double.infinity,
                child: new Padding(
                  padding: EdgeInsets.all(20.0),
                  child: new RaisedButton(
                    padding: EdgeInsets.all(16.0),
                    color: Colors.white,
                    onPressed: () => {},
                    child: new Text(
                      "login".toUpperCase(),
                      style: TextStyle(
                          fontSize: 16.0,
                          letterSpacing: 2.0,
                          color: Color(0xEE666666)),
                    ),
                  ),
                ))
          ],
        ),
      )
    ])));
  }
}
