import 'package:flutter/material.dart';

class LoginLayout extends StatefulWidget {
  @override
  _LoginLayoutState createState() => _LoginLayoutState();
}

class _LoginLayoutState extends State<LoginLayout> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xFF383838),
      child: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: new Container(
                alignment: Alignment(-1.0, 0.0),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.dehaze,
                    color: Colors.white,
                    size: 40.0,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(),
            ),
            Container(
                child: Text(
              "Login",
              style: TextStyle(
                  color: Colors.white.withAlpha(180),
                  fontSize: 45.0,
                  fontWeight: FontWeight.w200),
            )),
            Expanded(
              flex: 1,
              child: Container(),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  TextInputWithIcon(
                    iconWidget: ImageIcon(
                      AssetImage("assets/icons/profile.png"),
                      color: Colors.white.withAlpha(60),
                    ),
                    hintText: "Username",
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  TextInputWithIcon(
                    iconWidget: ImageIcon(
                      AssetImage("assets/icons/lock.png"),
                      color: Colors.white.withAlpha(60),
                    ),
                    hintText: "Password",
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0, bottom: 30.0),
              child: Center(
                  child: InkWell(
                onTap: () {},
                child: Text(
                  "Forgot passwrod",
                  style: TextStyle(
                      color: Colors.white.withAlpha(80),
                      fontSize: 16.0,
                      letterSpacing: 0.3),
                ),
              )),
            ),
            Expanded(
              flex: 1,
              child: Container(),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                width: double.infinity,
                height: 60.0,
                color: Color(0xAA19A4B9),
                child: Center(
                  child: Text("Sign In",
                      style: TextStyle(fontSize: 16.0, color: Colors.white)),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text("Don't have an account?",
                        style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.white.withAlpha(120),
                            letterSpacing: 0.2)),
                    Text("  Sign Up",
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white.withAlpha(200))),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TextInputWithIcon extends StatelessWidget {
  final Widget iconWidget;
  final String hintText;

  TextInputWithIcon({this.iconWidget, this.hintText});
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (String text) {},
      cursorColor: Colors.white,
      style: TextStyle(color: Colors.white, fontSize: 20.0),
      //TODO Text align so far has problem from framework
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white.withAlpha(180)),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 38.0, right: 10.0, bottom: 12.0),
          child: new Container(
            width: 32.0,
            height: 32.0,
            child: iconWidget,
          ),
        ),
        suffix: Container(width: 80.0),
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white.withAlpha(125))),
      ),
    );
  }
}
