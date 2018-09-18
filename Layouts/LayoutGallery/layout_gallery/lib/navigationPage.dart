import 'dart:math';

import 'package:flutter/material.dart';
import 'package:layout_gallery/flip_carosel.dart';
import 'package:layout_gallery/loginLayout.dart';
import 'package:layout_gallery/shoppingcartLayout.dart';

List<NavigationItem> screens = [
  new NavigationItem(
      sreen: ShoppingCartLayout(),
      title: "ShoppingCart",
      subTitle: "Simple Shoping Cart"),
  new NavigationItem(
      sreen: FlipCaroselLayout(),
      title: "Flip Carosel",
      subTitle: "Test Flip Carosel"),
  new NavigationItem(
      sreen: LoginLayout(),
      title: "Login Page",
      subTitle: "Now for input")
];

List colors = [
  Colors.red,
  Colors.blue,
  Colors.deepOrangeAccent,
  Colors.green,
  Colors.orange
];

class NavigationPage extends StatefulWidget {
  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  Color _randomColor() {
    Random random = new Random();
    return colors[random.nextInt(colors.length)];
  }

  Widget _buildItem(BuildContext context, NavigationItem item) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => item.sreen));
        },
        child: Container(
          decoration: ShapeDecoration(
              gradient: LinearGradient(colors: [
                Color(0xff81CDFF),
                Color(0xFF79F3FF),
              ]),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)))),
          padding: EdgeInsets.all(20.0),
          child: Row(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    color: _randomColor(),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Color(0x33000000),
                          blurRadius: 5.0,
                          offset: Offset(2.0, 2.0))
                    ]),
                height: 50.0,
                width: 50.0,
              ),
              SizedBox(
                width: 20.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(item.title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: Colors.white)),
                  ),
                  Text(item.subTitle,
                      style: TextStyle(fontSize: 18.0, color: Colors.black)),
                ],
              ),
              Expanded(
                child: new Container(),
              ),
              IconButton(
                  icon: Icon(
                Icons.arrow_forward,
                color: Colors.white,
                size: 30.0,
              ))
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
            title: Text(
          "Navigations",
          style: TextStyle(fontSize: 30.0),
        )),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                  children: screens.map((screen) {
                return _buildItem(context, screen);
              }).toList()),
            ),
          ),
        ),
      ),
    );
  }
}

class NavigationItem {
  String title;
  String subTitle;
  String assetImage;
  Widget sreen;
  NavigationItem(
      {@required this.title,
      @required this.subTitle,
      this.assetImage = "",
      @required this.sreen});
}
