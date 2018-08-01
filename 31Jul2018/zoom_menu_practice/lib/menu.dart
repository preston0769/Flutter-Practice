import 'package:flutter/material.dart';
import 'package:zoom_menu_practice/zoom_scaffold.dart';

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
  MenuController controller;

  MenuScreen(
      {@required this.menu,
      this.selectedMenuItemId,
      @required this.onMenuItemSelected,
      this.controller});

  @override
  State<StatefulWidget> createState() {
    return new _MenuScreenState();
    // TODO: implement createState
  }
}

// ===================
class _MenuScreenState extends State<MenuScreen> with TickerProviderStateMixin {
  AnimationController _titleAnimationController;
  MenuController rootController;
  double selectorYTop;
  double selectorYBottom;

  setSelectedRenderBox(RenderBox newRenderBox) async {
    final newYTop = newRenderBox.localToGlobal(const Offset(0.0, 0.0)).dy;
    final newYBottom = newYTop + newRenderBox.size.height;

    if (newYTop != selectorYTop) {
      setState(() {
        selectorYTop = newYTop;
        selectorYBottom = newYBottom;
      });
    }
  }

  @override
  initState() {
    super.initState();
    _titleAnimationController = new AnimationController(
        duration: const Duration(milliseconds: 250), vsync: this);
    rootController = widget.controller;
    rootController.addListener(_onMenuControllerChange);
  }

  @override
  dispose() {
    _titleAnimationController.dispose();
    super.dispose();
  }
  _onMenuControllerChange(){
    setState(() {
        });
  }

  createMenuTitle(MenuController controller) {
    switch (controller.state) {
      case MenuState.open:
      case MenuState.opening:
        _titleAnimationController.forward();
        break;
      case MenuState.closed:
      case MenuState.closing:
        _titleAnimationController.reverse();
        break;
    }
    return new AnimatedBuilder(
      animation: _titleAnimationController,
      child: new OverflowBox(
        maxHeight: double.infinity,
        maxWidth: double.infinity,
        alignment: Alignment.topLeft,
        child: new Padding(
          padding: new EdgeInsets.all(30.0),
          child: new Text(
            'Menu',
            style: new TextStyle(
                color: const Color(0x88444444),
                fontSize: 250.0,
                fontFamily: 'mermaid'),
            textAlign: TextAlign.left,
            softWrap: false,
          ),
        ),
      ),
      builder: (BuildContext context, Widget child) {
        return new Transform(
          transform: new Matrix4.translationValues(
              250.0 * (1.0 - _titleAnimationController.value) - 100.0,
              0.0,
              0.0),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: double.infinity,
      height: double.infinity,
      decoration: new BoxDecoration(
          image: new DecorationImage(
              image: new AssetImage('assets/dark_grunge_bk.jpg'),
              fit: BoxFit.cover)),
      child: new Material(
        color: Colors.transparent,
        child: new Stack(
          children: <Widget>[
            createMenuTitle(rootController),
          ],
        ),
      ),
    );
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
