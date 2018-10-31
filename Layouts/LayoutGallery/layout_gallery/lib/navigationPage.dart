import 'dart:math';

import 'package:flutter/material.dart';
import 'package:layout_gallery/appointmentLayout/appointmentLayout.dart';
import 'package:layout_gallery/calenderLayout/calenderLayout.dart';
import 'package:layout_gallery/checkoutLayout.dart';
import 'package:layout_gallery/flipcaroselLayout.dart';
import 'package:layout_gallery/furnitureshopLayout.dart';
import 'package:layout_gallery/loginLayout.dart';
import 'package:layout_gallery/shoppingcartLayout.dart';

List<NavigationItem> screens = [
  new NavigationItem(
      sreen: FlipCaroselLayout(),
      title: "Flip Carosel",
      subTitle: "Test Flip Carosel"),
  new NavigationItem(
      sreen: LoginLayout(), title: "Login Page", subTitle: "Now for input"),
  new NavigationItem(
      sreen: ShoppingCartLayout(),
      title: "ShoppingCart",
      subTitle: "Simple Shoping Cart"),
  new NavigationItem(
      sreen: FurnitureShopLayout(),
      title: "Furniture Shop",
      subTitle: "Furniture shop"),
  new NavigationItem(
      sreen: AppointmentLayout(),
      title: "Appoinment",
      subTitle: "Drop down and selector"),
  new NavigationItem(
      sreen: CalenderLayout(),
      title: "Calender",
      subTitle: "Calender layout"),

  new NavigationItem(
      sreen: CheckoutLayout(),
      title: "Checkout",
      subTitle: "A simple checkout page")
];

List<Color> colors = [
  Colors.red,
  Colors.pink,
  Colors.lightBlue,
  Colors.lightBlueAccent.shade200,
  Colors.blue,
  Colors.deepOrangeAccent,
  Colors.green,
  Colors.orange,
  Colors.cyan,
  Colors.blueGrey,
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
                Color(0x9981CDEE),
                Color(0x9979F3EE),
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
                  Container(
                    width: 170.0,
                    height: 20.0,
                    child: OverflowBox(
                      child: Text(item.subTitle,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black.withAlpha(200))),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: new Container(),
              ),
              IconButton(
                  onPressed: () {},
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
        backgroundColor: Colors.white70,
        appBar: AppBar(
            title: Text(
          "Navigations",
          style: TextStyle(fontSize: 30.0),
        )),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.only( left: 20.0,right: 20.0),
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
