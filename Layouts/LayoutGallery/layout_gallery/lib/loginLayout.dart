import 'package:flutter/material.dart';
import 'package:layout_gallery/support/ensureWhenVisibleWhenFocus.dart';

class LoginLayout extends StatefulWidget {
  @override
  _LoginLayoutState createState() => _LoginLayoutState();
}

class _LoginLayoutState extends State<LoginLayout> {
  FocusNode _focusNode = new FocusNode();

  @override
  Widget build(BuildContext context) {
    var screenH = MediaQuery.of(context).size.height + 180;
    return WillPopScope(
      
          child: Scaffold(
        backgroundColor: Color(0xFF383838),
        body: SafeArea(
          child: SingleChildScrollView(
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
                SizedBox( height: 100.0,),
                Center(
                    child: Text(
                  "Login",
                  style: TextStyle(
                      color: Colors.white.withAlpha(180),
                      fontSize: 45.0,
                      fontWeight: FontWeight.w200),
                )),
                SizedBox( height: 100.0,),
                Container(
                  child: Column(
                    children: <Widget>[
                      EnsureVisibleWhenFocused(
                        focusNode: _focusNode,
                        child: TextInputWithIcon(
                          iconWidget: ImageIcon(
                            AssetImage("assets/icons/profile.png"),
                            color: Colors.white.withAlpha(60),
                          ),
                          hintText: "Username",
                          focusNode: _focusNode,
                        ),
                      ),
                      SizedBox( height: 40.0,),
                      TextInputWithIcon(
                        iconWidget: ImageIcon(
                          AssetImage("assets/icons/lock.png"),
                          color: Colors.white.withAlpha(60),
                        ),
                        focusNode: null,
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
                SizedBox(height: 100.0,),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    height: 60.0,
                    color: Color(0xAA19A4B9),
                    child: Center(
                      child: Text("Sign In",
                          style:
                              TextStyle(fontSize: 16.0, color: Colors.white)),
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
        ),
      ), onWillPop: () {},
    );
  }
}

class TextInputWithIcon extends StatelessWidget {
  final Widget iconWidget;
  final String hintText;
  final FocusNode focusNode;

  TextInputWithIcon({this.iconWidget, this.hintText, @required this.focusNode});
  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: focusNode,
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
