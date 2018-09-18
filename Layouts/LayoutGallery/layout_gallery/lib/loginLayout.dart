import 'package:flutter/material.dart';

class LoginLayout extends StatefulWidget {
  @override
  _LoginLayoutState createState() => _LoginLayoutState();
}

class _LoginLayoutState extends State<LoginLayout> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xFF232325),
      child: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: new Container(
                alignment: Alignment(-1.0, 0.0),
                child: Icon(
                  Icons.dehaze,
                  color: Colors.white,
                  size: 40.0,
                ),
              ),
            ),
            SizedBox.shrink(
              child: Container(),
            ),
            Container(
                child: Text(
              "Login",
              style: TextStyle(color: Colors.white, fontSize: 50.0),
            )),
            Expanded(
              child: Container(),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  TextField(
                    obscureText: true,
                    onChanged: (String text) {},
                    decoration: InputDecoration(
                        counterText: "100",
                        counterStyle: TextStyle(color: Colors.grey[300]),
                        fillColor: Colors.grey[300],
                        filled: true,
                        hintText: "This is a hint"),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Username",
                        hintStyle: TextStyle(color: Color(0xFF888888)),
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xFF999999),
                                style: BorderStyle.solid,
                                width: 1.0))),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle: TextStyle(color: Color(0xFF888888)),
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF999999)))),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
