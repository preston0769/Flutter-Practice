import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(new PaintingApp());

class PaintingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Painting App',
      theme: new ThemeData(),
      home: new HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: new Text(
          "Radial Button",
          style: TextStyle(
              color: Colors.white, fontFamily: 'Nunito', letterSpacing: 1.0),
        ),
        backgroundColor: Color(0xFF2979FF),
        centerTitle: true,
      ),
      body: new HomeContent(),
    );
  }
}

class HomeContent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeContentState();
  }
}

class _HomeContentState extends State<HomeContent> {
  double percentage;
  Color completeColor;

  @override
  void initState() {
    setState(() {
      percentage = 0.0;
      completeColor = Colors.blue;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: new Container(
      height: 200.0,
      width: 200.0,
      child: new CustomPaint(
        foregroundPainter: new MyPainter(
            completeColor: completeColor,
            lineColor: Theme.of(context).primaryColorLight,
            completePercent: percentage,
            width: 20.0),
        child: new Padding(
          padding: const EdgeInsets.all(20.0),
          child: new RaisedButton(
            color: Theme.of(context).buttonColor,
            splashColor: Colors.red,
            shape: new CircleBorder(),
            child: Icon(FontAwesomeIcons.plus, color: Colors.black,size: 26.0,),
            onPressed: () {
              setState(() {
                percentage += 5.0;
                if (percentage > 50 && percentage < 100) {
                  completeColor =
                      Colors.green[(percentage / 10).toInt() * 100 - 300];
                }
                if (percentage > 100.0) {
                  percentage = 0.0;
                  completeColor = Colors.blue;
                }
              });
            },
          ),
        ),
      ),
    ));
  }
}

class MyPainter extends CustomPainter {
  Color lineColor;
  Color completeColor;
  double completePercent;
  double width;

  MyPainter(
      {this.lineColor, this.completeColor, this.completePercent, this.width});

  @override
  void paint(Canvas canvas, Size size) {
    Paint line = new Paint()
      ..color = lineColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;

    Paint complete = new Paint()
      ..color = completeColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;
    Offset center = new Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);

    canvas.drawCircle(center, radius, line);

    double arcAngle = 2 * pi * (completePercent / 100);

    canvas.drawArc(new Rect.fromCircle(center: center, radius: radius), -pi / 2,
        arcAngle, false, complete);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
