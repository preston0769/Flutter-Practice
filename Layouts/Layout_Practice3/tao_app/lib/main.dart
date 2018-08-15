import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

var AssetPath = [
  "assets/notes.png",
  "assets/money.png",
  "assets/statistics.png",
  "assets/lights.png",
  "assets/stack.png",
  "assets/data.png",
];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new LP3Screen(),
    );
  }
}

class LP3Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sWidth = MediaQuery.of(context).size.width;
    final sHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.white,
          leading: new Icon(
            Icons.menu,
            color: Colors.grey,
            size: 24.0,
          ),
          title: new Text(
            "LP3Screen",
            style: TextStyle(color: Colors.grey),
          ),
          centerTitle: true,
          elevation: 0.0,
          actions: <Widget>[
            new Container(
              height: 35.0,
              width: 35.0,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
            ),
            SizedBox(
              width: 20.0,
            ),
          ],
          bottom: PreferredSize(
            child: new Container(
              width: sWidth - 30.0,
              height: 0.4,
              color: Colors.grey,
            ),
          ),
        ),
        body: Column(children: <Widget>[
          new Expanded(
              flex: 8,
              child: GridView.count(
                mainAxisSpacing: 0.0,
                crossAxisCount: 2,
                children: List.generate(6, (index) {
                  return MyTile(
                      caption: "test",
                      imagePath: AssetPath[index],
                      alertCount: index);
                }),
              )),
          new Expanded(
              flex: 1,
              child: new Column(children: <Widget>[
                RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  color: Colors.red,
                  child: new Container(
                      alignment: Alignment(0.0, 0.0),
                      width: sWidth-100.0,
                      child: new Text("INFORMATION",style: TextStyle(color: Colors.white),)),
                  onPressed: () {},
                )
              ]))
        ]));
  }
}

class MyTile extends StatelessWidget {
  String imagePath;
  String caption;
  int alertCount = 0;

  MyTile({@required this.imagePath, @required this.caption, this.alertCount});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Stack(
              alignment: Alignment.bottomRight,
              children: <Widget>[
                Image(
                  width: 70.0,
                  height: 70.0,
                  image: AssetImage(this.imagePath),
                  fit: BoxFit.cover,
                ),
                new Container(
                  width: 25.0,
                  height: 25.0,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: Colors.red),
                  child: Center(
                      child: new Text(
                    alertCount.toString(),
                    style: TextStyle(color: Colors.white),
                  )),
                )
              ],
            ),
            new Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: new Text(
                this.caption,
                style: Theme.of(context).textTheme.headline,
              ),
            )
          ],
        ),
      ),
    );
  }
}
