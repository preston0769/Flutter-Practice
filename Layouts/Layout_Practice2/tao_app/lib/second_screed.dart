import 'package:flutter/material.dart';

class FreeAccountScreen extends StatelessWidget {
  final Function(int index) changeScreen;

  FreeAccountScreen({this.changeScreen});

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      key: new GlobalKey(debugLabel: "AppBar"),
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
    );

    return new Scaffold(
        appBar: appBar,
        body: ConstrainedBox(
          constraints: const BoxConstraints.expand(),
          child: Stack(
            alignment: new Alignment(0.0, 0.85),
            children: <Widget>[
              new Column(children: [
                new Expanded(
                  flex: 180,
                  child: Container(
                    color: Color(0xBBA5A3A5),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.only(bottom: 40.0),
                              child: new Container(
                                  height: 100.0,
                                  width: 100.0,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image:
                                              AssetImage("assets/image1.jpg"),
                                          fit: BoxFit.cover)))),
                          Padding(
                              padding: EdgeInsets.only(bottom: 20.0),
                              child: Text("Free Account".toUpperCase())),
                          new Text("Limited features,slow upload speed"),
                          new Form(
                            child: Container(
                              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                              width: 270.0,
                              child: Column(children: <Widget>[
                                TextFormField(
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(20.0),
                                        hintText: "Username",
                                        fillColor: Colors.white,
                                        filled: true,
                                        border: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0x33DDDDDD))))),
                                TextFormField(
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(20.0),
                                        hintText: "Password",
                                        fillColor: Colors.white,
                                        filled: true,
                                        border: UnderlineInputBorder(
                                            borderRadius: BorderRadius.zero,
                                            borderSide: BorderSide(
                                                color: Color(0x33DDDDDD))))),
                                TextFormField(
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(20.0),
                                        hintText: "Confirm Password",
                                        fillColor: Colors.white,
                                        filled: true,
                                        border: UnderlineInputBorder(
                                            borderRadius: BorderRadius.zero,
                                            borderSide: BorderSide(
                                                color: Color(0x33DDDDDD))))),
                                RaisedButton(
                                  color: Color.fromRGBO(230, 230, 230, 0.8),
                                  child: new Center(
                                    child: Text("Sign up now".toUpperCase()),
                                  ),
                                  onPressed: () {},
                                )
                              ]),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                new Expanded(
                  flex: 20,
                  child: Container(
                    color: Color(0xEA333B48),
                  ),
                )
              ]),
              new ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Container(
                    color: Color(0xFF333B48),
                    height: 30.0,
                    width: 100.0,
                    child: new InkWell(
                      onTap: (){
                        changeScreen(0);
                      },
                        child: new Center(
                            child: Text(
                      "Premium".toUpperCase(),
                      style:
                          TextStyle(color: Color(0xBBEEEEEE), fontSize: 12.0),
                    ))),
                  ))
            ],
          ),
        ));
  }
}
