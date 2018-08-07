import 'package:flutter/material.dart';

void main() => runApp(new LayOutApp());

class LayOutApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primaryColor: Colors.red,
      ),
      home: new Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.blueGrey,
          title: new Text(
            "Layout PlayGround",
            style: new TextStyle(color: Colors.orange),
          ),
        ),
        body: new HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
        // color: Colors.red,
        child: new Column(
      children: <Widget>[
        getRowElement(),
        getColElement(),
        getBaseLineRow(context),
        // createStack()
      ],
    ));
  }

  getRowElement() {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        new Icon(
          Icons.star,
          size: 50.0,
          color: Colors.red,
        ),
        new Icon(
          Icons.star,
          size: 50.0,
          color: Colors.red,
        ),
        new Icon(
          Icons.star,
          size: 50.0,
          color: Colors.red,
        ),
      ],
    );
  }

  getColElement() {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        new Icon(
          Icons.star,
          size: 50.0,
        ),
        new Icon(
          Icons.star,
          size: 50.0,
        ),
        new Icon(Icons.star, size: 50.0),
      ],
    );
  }

  getBaseLineRow(BuildContext context) {
    return new Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: <Widget>[
        new Text('BaseLine', style: Theme.of(context).textTheme.display3),
        new Text('SmallText', style: Theme.of(context).textTheme.body1),
      ],
    );
  }

  createStack() {
    return new Container(
        width: double.infinity,
        height: 200.0,
        color: Colors.amber,
        child: new Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Banner(
              message: "Top Start",
              location: BannerLocation.topStart,
            ),
            Banner(
              message: "Botton End",
              location: BannerLocation.bottomEnd,
            )
          ],
        ));
  }
}
