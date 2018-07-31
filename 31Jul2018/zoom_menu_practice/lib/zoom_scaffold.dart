import 'package:flutter/material.dart';
import 'package:zoom_menu_practice/menu.dart';
import 'package:zoom_menu_practice/screen.dart';

class ZoomScaffold extends StatefulWidget {
  MenuScreen menuScreen;
  Screen contentScreen;

  ZoomScaffold({this.menuScreen, this.contentScreen});

  @override
  State<StatefulWidget> createState() {
    return new _ZoomScaffoldState();
    // TODO: implement createState
  }
}

class _ZoomScaffoldState extends State<ZoomScaffold>
    with TickerProviderStateMixin {
  MenuController controller;

  Curve scaleDownCurve = new Interval(0.0, 0.3, curve: Curves.easeOut);
  Curve scaleUpCurve = new Interval(0.0, 1.0, curve: Curves.easeOut);
  Curve slideOutCurve = new Interval(0.0, 1.3, curve: Curves.easeOut);
  Curve slideInCurve = new Interval(0.0, 1.3, curve: Curves.easeOut);

  @override
  void initState() {
    super.initState();
    controller = new MenuController(vsync: this)
      ..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[widget.menuScreen, createContentDisplay()],
    );
    // TODO: implement build
  }

  createContentDisplay() {}

  zoomAndSlideContent(Widget content){
    var slidePercent,scalePercent;
    switch(controller.state){
      case MenuState.closed:
        slidePercent = 0.0;
        scalePercent = 0.0;
        break;
      case MenuState.open:
        slidePercent = 1.0;
        scalePercent = 1.0;
        break;
      case MenuState.opening:
        slidePercent = slideOutCurve.transform(controller.percentOpen);
        scalePercent = scaleDownCurve.transform(controller.percentOpen);
        break;
      case MenuState.closing:
        slidePercent = slideInCurve.transform(controller.percentOpen);
        scalePercent = scaleUpCurve.transform(controller.percentOpen);
        break;
    }

    final slideAmount = 275*slidePercent;
    final contentScale = 1.0-(0.2*scalePercent);
    final cornerRadius = 10.0*controller.percentOpen;

    return new Transform(
      transform: new Matrix4.translationValues(slideAmount, 0.0, 0.0)
      ..scale(contentScale,contentScale),
      alignment: Alignment.centerLeft,
      child: new Container(
        decoration: new BoxDecoration(boxShadow: [
          new BoxShadow(
            color: const Color(0x44000000),
            offset: const Offset(0.0, 5.0),
            blurRadius: 20.0,
            spreadRadius: 10.0
          )
        ]),
        child: new ClipRRect(
          borderRadius: new BorderRadius.circular(cornerRadius),
          child: content,
        ),
      ),
    );

  }
}


