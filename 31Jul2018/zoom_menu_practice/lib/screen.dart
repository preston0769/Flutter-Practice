import 'package:flutter/material.dart';

final restaurantScreen = new Screen(
    title: 'THE PALEO PADDOCK',
    background: DecorationImage(
        image: new AssetImage('assets/wood_bk.jpg'), fit: BoxFit.cover),
    contentBuilder: (BuildContext context) {
      return new ListView(
        children: <Widget>[
          new _RestaurantCard(
            headImageAssetPath: 'assets/eggs_in_skillet.jpg',
            iconBackgroundColor: Colors.red,
            icon: Icons.fastfood,
            title: 'il domacca',
            subTitle:
                '78 5th AVENUE, NEW YORK,Wa HHA Wa HHA, ZHE LI YOU ZHI XIAO QING WA',
            heartCount: 109,
          ),
          new _RestaurantCard(
            headImageAssetPath: 'assets/steak_on_cooktop.jpg',
            iconBackgroundColor: Colors.lightGreen,
            icon: Icons.backup,
            title: 'Beef Steak',
            subTitle:
                '100 5th AVENUE, Melbourne',
            heartCount: 12109,
          ),
          new _RestaurantCard(
            headImageAssetPath: 'assets/spoons_of_spices.jpg',
            iconBackgroundColor: Colors.red,
            icon: Icons.local_activity,
            title: 'True Indian',
            subTitle:
                '100 Harbour Esp,Docklands',
            heartCount: 20,
          ),

        ],
      );
    });
final otherScreen = new Screen();

class _RestaurantCard extends StatelessWidget {
  final String headImageAssetPath;
  final IconData icon;
  final Color iconBackgroundColor;
  final String title;
  final String subTitle;
  final int heartCount;

  _RestaurantCard(
      {this.headImageAssetPath,
      this.icon,
      this.iconBackgroundColor,
      this.title,
      this.subTitle,
      this.heartCount});

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
      child: new Card(
        elevation: 10.0,
        child: new Column(
          children: <Widget>[
            new Image.asset(headImageAssetPath,
                width: double.infinity, height: 150.0, fit: BoxFit.cover),
            new Row(
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: new Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: new BoxDecoration(
                      color: iconBackgroundColor,
                      borderRadius:
                          new BorderRadius.all(const Radius.circular(15.0)),
                    ),
                    child: new Icon(icon, color: Colors.white),
                  ),
                ),
                new Expanded(
                    child: new Padding(
                        padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              new Text(
                                title,
                                style: new TextStyle(
                                    fontSize: 25.0, fontFamily: 'mermaid'),
                              ),
                              new Text(subTitle,
                                  style: new TextStyle(
                                      fontSize: 15.0,
                                      fontFamily: 'bebas-neue',
                                      letterSpacing: 1.0,
                                      color: const Color(0xFFAAAAAA))),
                            ]))),
                new Container(
                  width: 1.0,
                  height: 70.0,
                  decoration: new BoxDecoration(
                      gradient: new LinearGradient(colors: [
                      const Color(0xFFAAAAAA),
                      Colors.white,
                      const Color(0xFFAAAAAA)
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                ),
                new Padding(
                  padding: new EdgeInsets.only(left: 15.0, right: 15.0),
                  child: new Column(
                    children: <Widget>[
                      new Icon(
                        Icons.favorite_border,
                        color: Colors.red,
                      ),
                      new Text('$heartCount')
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Screen {
  final String title;
  final DecorationImage background;
  WidgetBuilder contentBuilder;

  Screen({this.title, this.background, this.contentBuilder});
}
