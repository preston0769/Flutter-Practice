import 'package:flutter/material.dart';

//====================
class Menu {
  List<MenuItem> items;
  Menu({@required this.items});
}

//====================
class MenuItem {
  String id;
  String title;

  MenuItem({@required this.id, @required this.title});
}

//======================
class MenuScreen extends StatefulWidget {
  Menu menu;
  String selectedMenuItemId;
  Function(String) onMenuItemSelected;

  MenuScreen(
      {@required this.menu,
      this.selectedMenuItemId,
      @required this.onMenuItemSelected});

  @override
  State<StatefulWidget> createState() {
    return new _MenuScreenState();
    // TODO: implement createState
  }
}

// ===================
class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
  }
}

enum MenuState { opening, open, closing, closed }

// ===================
class MenuController extends ChangeNotifier {
  final TickerProvider vsync;
  final AnimationController _animationController;

  MenuState state = MenuState.closed;

  MenuController({this.vsync})
      : _animationController = new AnimationController(vsync: vsync) {
    _animationController
      ..duration = const Duration(milliseconds: 250)
      ..addListener(() {
        notifyListeners();
      })
      ..addStatusListener((AnimationStatus status) {
        switch (status) {
          case AnimationStatus.forward:
            state = MenuState.opening;
            break;
          case AnimationStatus.reverse:
            state = MenuState.closing;
            break;
          case AnimationStatus.completed:
            state = MenuState.open;
            break;
          case AnimationStatus.dismissed:
            state = MenuState.closed;
            break;
        }
        notifyListeners();
      });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  get percentOpen {
    return _animationController.value;
  }

  open() {
    _animationController.forward();
  }

  close() {
    _animationController.reverse();
  }

  toggle() {
    if (state == MenuState.closed) {
      open();
    }
    if (state == MenuState.open) {
      close();
    }
  }
}

// ===================

final menuList = new Menu(items: [
  new MenuItem(id: 'restaurant', title: 'THE PODDOCK'),
  new MenuItem(id: 'other1', title: 'THE HERO'),
  new MenuItem(id: 'other2', title: 'HELP US GROW'),
  new MenuItem(id: 'other3', title: 'SETTINGS'),
]);
