import 'dart:math';

import 'package:flutter/material.dart';

class CalenderLayout extends StatefulWidget {
  @override
  _CalenderLayoutState createState() => _CalenderLayoutState();
}

class _CalenderLayoutState extends State<CalenderLayout> {
  Widget _buildTopBars() {
    return Container(
      padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.dehaze,
            color: Colors.white,
            size: 32.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              "March 2018".toUpperCase(),
              style: TextStyle(fontSize: 20.0, color: Colors.white),
            ),
          ),
          Expanded(child: Container()),
          Icon(
            Icons.keyboard_arrow_left,
            color: Colors.white,
            size: 32.0,
          ),
          Icon(
            Icons.keyboard_arrow_right,
            color: Colors.white,
            size: 32.0,
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          HeaderText(title: "SUN"),
          HeaderText(title: "MON"),
          HeaderText(title: "TUE"),
          HeaderText(title: "WED"),
          HeaderText(title: "THU"),
          HeaderText(title: "FRI"),
          HeaderText(title: "SAT"),
        ],
      ),
    );
  }

  Widget _buildCalender() {
    return Container(
      width: double.infinity,
      height: 320.0,
      child: Column(
        children: <Widget>[
          _buildHeader(),
          Expanded(
            child: GridView.count(
              crossAxisCount: 7,
              children: List.generate(35, (dateNum) {
                dateNum = 1 + dateNum % 30;
                return CalenderDayItem(
                  dateNum: dateNum,
                  isFocused: dateNum == 17 ? true : false,
                );
              }),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildItemList() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ActivityItem(
            iconImagePath: "assets/flip_carosel/object2.jpg",
            locationStr: "Taotao home",
            timeStr: "7 pm",
            title: "Watch youtube",
          ),
          ActivityItem(
            iconImagePath: "assets/flip_carosel/object5.jpg",
            locationStr: "Etihad Stadium",
            timeStr: "8 pm",
            title: "AFL Final",
            highlightColor: Colors.blue,
          ),
          ActivityItem(
            iconImagePath: "assets/flip_carosel/object5.jpg",
            locationStr: "NGV Gallery",
            timeStr: "9:30 am",
            title: "Gallery visiting",
            highlightColor: Colors.yellow,
          ),
          ActivityItem(
            iconImagePath: "assets/flip_carosel/object2.jpg",
            locationStr: "Botanic Garden",
            timeStr: "10 am",
            title: "Spring touring",
            highlightColor: Colors.pinkAccent,
          ),
          ActivityItem(
            iconImagePath: "assets/flip_carosel/object6.jpg",
            locationStr: "Docklands",
            timeStr: "10 pm",
            title: "Fireworks play",
            highlightColor: Colors.orange,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF313131),
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              _buildTopBars(),
              _buildCalender(),
              SizedBox(
                height: 20.0,
              ),
              Expanded(child: _buildItemList()),
            ],
          ),
        ),
      ),
      bottomNavigationBar: MyBottomBar(),
    );
  }
}

class ActivityItem extends StatelessWidget {
  final String title;
  final Color highlightColor;
  final String timeStr;
  final String locationStr;
  final String iconImagePath;

  ActivityItem(
      {@required this.title,
      this.highlightColor = Colors.red,
      @required this.timeStr,
      @required this.locationStr,
      @required this.iconImagePath});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(2.0),
        child: Container(
          padding: EdgeInsets.only(right: 16.0),
          decoration: BoxDecoration(
              color: Color(0xFF414141),
              borderRadius: BorderRadius.circular(2.0)),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 5.0,
                  color: highlightColor,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        title,
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.timer,
                              size: 12.0,
                              color: Colors.white.withAlpha(120),
                            ),
                            Text(
                              timeStr,
                              style: TextStyle(
                                color: Colors.white.withAlpha(120),
                                fontSize: 12.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.location_on,
                              size: 12.0,
                              color: Colors.white.withAlpha(120),
                            ),
                            Text(
                              locationStr,
                              style: TextStyle(
                                color: Colors.white.withAlpha(120),
                                fontSize: 12.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    width: 24.0,
                    height: 24.0,
                    decoration: BoxDecoration(
                        color: Colors.orange, shape: BoxShape.circle),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: Image.asset(
                          iconImagePath,
                          fit: BoxFit.cover,
                        )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF212121),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 24.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Icon(
                Icons.calendar_today,
                size: 24.0,
                color: Colors.white,
              ),
              Icon(
                Icons.people,
                size: 24.0,
                color: Colors.white,
              ),
              Container(
                width: 48.0,
                height: 48.0,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xFF2389DD)),
                child: Icon(
                  Icons.add_circle_outline,
                  size: 24.0,
                  color: Colors.white,
                ),
              ),
              Icon(
                Icons.mail_outline,
                size: 24.0,
                color: Colors.white,
              ),
              Icon(
                Icons.settings,
                size: 24.0,
                color: Colors.white,
              ),
            ]),
      ),
    );
  }
}

class CalenderDayItem extends StatelessWidget {
  final int dateNum;
  final bool isFocused;
  CalenderDayItem({@required this.dateNum, this.isFocused = false});

  Color _randomColor() {
    var random = Random();
    if (random.nextInt(100) % 4 == 0) return Colors.transparent;
    return Color.fromARGB(
        255, random.nextInt(255), random.nextInt(255), random.nextInt(255));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: isFocused
            ? BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.withAlpha(40),
                border: Border.all(
                    color: Colors.red.withAlpha(180),
                    style: BorderStyle.solid,
                    width: 3.0))
            : null,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              dateNum.toString(),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Container(
                height: 6.0,
                width: 6.0,
                decoration: BoxDecoration(
                    color: isFocused ? Colors.transparent : _randomColor(),
                    shape: BoxShape.circle),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class HeaderText extends StatelessWidget {
  final String title;
  HeaderText({@required this.title});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Text(
        title,
        style: TextStyle(
            color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.w500),
      ),
    );
  }
}
