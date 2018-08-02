import 'package:flutter/material.dart';
import 'package:zoom_menu_practice/zoom_scaffold.dart';


GlobalKey menuScreenKey = new GlobalKey(debugLabel: 'menuScreenKey');
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
      this.controller}):super(key:menuScreenKey);

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


  createMenuItems(MenuController controller){
    final List<Widget> listItems = [];

    for(var i = 0;i<widget.menu.items.length;i++){
      final isSelected = widget.menu.items[i].id == widget.selectedMenuItemId;

      listItems.add(
        new AnimatedMenuListItem(
          menuState: controller.state,
          isSelected: isSelected,
          duration: const Duration(milliseconds: 500),
          curve: new Interval(0.0, 0.9,curve: Curves.easeOut),
          menuListItem: new _MenuListItem(
            title: widget.menu.items[i].title,
            isSelected: isSelected,
            onTap: (){
              widget.onMenuItemSelected(widget.menu.items[i].id);
              controller.close();
            },
          ),
      )
      );
    }

      return new Transform(
        transform: new Matrix4.translationValues(0.0, 225.0, 0.0),
        child: Column(
          children: listItems,
        ),
      );
  }

  @override
  Widget build(BuildContext context) {

    var shouldRenderSelector = true;
        var actualSelectorYTop = selectorYTop;
        var actualSelectorYBottom = selectorYBottom;
        var selectorOpacity = 1.0;

        if (rootController.state == MenuState.closed
            || rootController.state == MenuState.closing
            || selectorYTop == null) {
          final RenderBox menuScreenRenderBox = context.findRenderObject() as RenderBox;

          if (menuScreenRenderBox != null) {
            final menuScreenHeight = menuScreenRenderBox.size.height;
            actualSelectorYTop = menuScreenHeight - 50.0;
            actualSelectorYBottom = menuScreenHeight;
            selectorOpacity = 0.0;
          } else {
            shouldRenderSelector = false;
          }
        }


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
            createMenuItems(rootController),
            shouldRenderSelector?
            new ItemSelector(
              topY: actualSelectorYTop,
              bottomY: actualSelectorYBottom,
              opacity: selectorOpacity):new Container()
          ],
        ),
      ),
    );
    // TODO: implement build
  }

}

class ItemSelector extends ImplicitlyAnimatedWidget {

  final double topY;
  final double bottomY;
  final double opacity;

  ItemSelector({
    this.topY,
    this.bottomY,
    this.opacity,
  }) : super(duration: const Duration(milliseconds: 250));

  @override
  _ItemSelectorState createState() => new _ItemSelectorState();
}

class _ItemSelectorState extends AnimatedWidgetBaseState<ItemSelector> {

  Tween<double> _topY;
  Tween<double> _bottomY;
  Tween<double> _opacity;

  @override
  void forEachTween(TweenVisitor visitor) {
    _topY = visitor(
      _topY,
      widget.topY,
      (dynamic value) => new Tween<double>(begin: value),
    );
    _bottomY = visitor(
      _bottomY,
      widget.bottomY,
      (dynamic value) => new Tween<double>(begin: value),
    );
    _opacity = visitor(
      _opacity,
      widget.opacity,
      (dynamic value) => new Tween<double>(begin: value),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Positioned(
      top: _topY.evaluate(animation),
      child: new Opacity(
        opacity: _opacity.evaluate(animation),
        child: new Container(
          width: 5.0,
          height: _bottomY.evaluate(animation) - _topY.evaluate(animation),
          color: Colors.red,
        ),
      ),
    );
  }
}



class  AnimatedMenuListItem extends ImplicitlyAnimatedWidget{

  final _MenuListItem menuListItem;
  final MenuState menuState;
  final bool isSelected;
  final Duration duration;

AnimatedMenuListItem({
  this.menuListItem,
  this.menuState,
  this.isSelected,
  this.duration,
  curve,
}):super(duration:duration,curve:curve);

  @override
  AnimatedWidgetBaseState<ImplicitlyAnimatedWidget> createState() {
    return new _AnimatedMenuListItemState();
    // TODO: implement createState
  }

}

class _MenuListItem extends StatelessWidget{
  final String title;
  final bool isSelected;

  final Function() onTap;

  _MenuListItem({this.title,this.isSelected,this.onTap});

  @override
  Widget build(BuildContext context) {
    return new InkWell(

      splashColor: const Color(0x44000000),
      onTap: isSelected?null:onTap,
      child: Container(
        width: double.infinity,
        child:  new Padding(
          padding:  const EdgeInsets.only(left: 50.0,top:15.0,bottom: 15.0),
          child: new Text(
            title,
            style:  new TextStyle(
              color: isSelected?Colors.red:Colors.white,
              fontSize: 25.0,
              fontFamily: 'bebas-neus',
              letterSpacing: 2.0
            ),
          ),
        ),
      ),
    );
  }

}

class _AnimatedMenuListItemState  extends AnimatedWidgetBaseState<AnimatedMenuListItem>{

  final double closedSlidePosition = 200.0;
  final double openSlidePosition = 0.0;

  Tween<double> _translation;
  Tween<double> _opacity;


  updateSelectedRenderBox(){
    final renderBox = context.findRenderObject() as RenderBox;
    if(renderBox !=null&& widget.isSelected){
      (menuScreenKey.currentState as _MenuScreenState).setSelectedRenderBox(renderBox);
    }
  }


  @override
  void forEachTween(TweenVisitor visitor) {
    var slide, opacity;

    switch (widget.menuState) {
      case MenuState.closed:
      case MenuState.closing:
        slide = closedSlidePosition;
        opacity = 0.0;
        break;
      case MenuState.open:
      case MenuState.opening:
        slide = openSlidePosition;
        opacity = 1.0;
        break;
    }

    _translation = visitor(
      _translation,
      slide,
      (dynamic value) => new Tween<double>(begin: value),
    );

    _opacity = visitor(
      _opacity,
      opacity,
      (dynamic value) => new Tween<double>(begin: value),
    );
  }
  




  @override
  Widget build(BuildContext context) {
    updateSelectedRenderBox();

    return new Opacity(
      opacity: _opacity.evaluate(animation),
      child: new Transform(
        transform: new Matrix4.translationValues(0.0, _translation.evaluate(animation), 0.0),
        child: widget.menuListItem,
      ),
    );
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
