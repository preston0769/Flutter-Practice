import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  final Function(int) changeScreen;

  FirstScreen({this.changeScreen});

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xBBA5A3A5),
        elevation: 0.0,
        title: new Text(
          "Sign up".toUpperCase(),
          style: TextStyle(
              color: Color(0xEE333333),
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
              letterSpacing: 2.0),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        // transform: Matrix4.rotationZ(pi/4),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            new Expanded(
              flex: 1,
              child: InkWell(
                  onTap: () {
                    changeScreen(1);
                  },
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    color: Color(0xBBA5A3A5),
                    child: new SafeArea(
                      bottom: false,
                      child: Column(
                        children: <Widget>[
                          new SizedBox(
                            height: 50.0,
                          ),
                          new Container(
                            height: 80.0,
                            width: 80.0,
                            decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage("assets/image1.jpg"),
                                  fit: BoxFit.fill),
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(top: 20.0),
                              child: new Text(
                                "Free account".toUpperCase(),
                                style: TextStyle(
                                    color: Color(0xEE333333),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400),
                              )),
                          Padding(
                            padding: EdgeInsets.only(top: 10.0),
                            child: new Text(
                              "Limited feature,poor download speed",
                              style: TextStyle(
                                  color: Color(0xEE333333), fontSize: 12.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
            ),
            new Expanded(
              flex: 1,
              child: Container(
                height: double.infinity,
                width: double.infinity,
                color: Color(0xBB333B48),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Container(
                      height: 100.0,
                      width: 100.0,
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage("assets/image2.jpg"),
                              fit: BoxFit.cover)),
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: new Text(
                          "Premium account".toUpperCase(),
                          style: TextStyle(
                              color: Color(0xEEEEEEEE),
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400),
                        )),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: new Text(
                        "More feature,dame fast download speed",
                        style:
                            TextStyle(color: Color(0xEEEEEEEE), fontSize: 12.0),
                      ),
                    ),
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
