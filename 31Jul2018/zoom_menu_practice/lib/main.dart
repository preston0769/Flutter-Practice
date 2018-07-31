import 'package:flutter/material.dart';
import 'package:zoom_menu_practice/menu.dart';
import 'package:zoom_menu_practice/screen.dart';
import 'package:zoom_menu_practice/zoom_scaffold.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Zoom Menu',
      theme: new ThemeData(primaryColor: Colors.blue),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _MyHomePageState();
    // TODO: implement createState
  }
}

class _MyHomePageState extends State<MyHomePage> {
  final menu = menuList;

  var selectedMenuItemId = 'restaurant';
  Screen activeScreen = restaurantScreen;

  @override
  Widget build(BuildContext context) {
    return new ZoomScaffold(
      menuScreen: new MenuScreen(
        menu: menu,
        selectedMenuItemId: selectedMenuItemId,
        onMenuItemSelected: (String itemId) {
          selectedMenuItemId = itemId;
          if (itemId == 'restaurant') {
            setState(() {
              activeScreen = restaurantScreen;
            });
          } else {
            setState(() {
              activeScreen = otherScreen;
            });
          }
        },
      ),
      contentScreen: activeScreen,
    );
  }
}
