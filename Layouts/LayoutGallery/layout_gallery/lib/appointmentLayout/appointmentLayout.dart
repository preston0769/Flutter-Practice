import 'package:flutter/material.dart';

class AppointmentLayout extends StatefulWidget {
  @override
  _AppointmentLayoutState createState() => _AppointmentLayoutState();
}

class _AppointmentLayoutState extends State<AppointmentLayout> {
  Widget _buildAppBar() {
    return Row(
      children: <Widget>[
        Icon(
          Icons.arrow_back,
          color: Colors.black.withAlpha(120),
          size: 32.0,
        ),
        Expanded(
          child: new Container(),
        ),
        Text("Help",
            style: TextStyle(
                color: Colors.black,
                fontSize: 14.0,
                fontWeight: FontWeight.bold))
      ],
    );
  }

  Widget _buildSeviceModelContent(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 12.0, bottom: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Regular HairCut",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                    letterSpacing: 0.3,
                    height: 1.2),
              ),
              Text("45 Minutes",
                  style: TextStyle(
                      color: Color(0xFF999999),
                      fontSize: 12.0,
                      letterSpacing: 0.3,
                      height: 1.5)),
            ],
          ),
        ),
        Expanded(
          child: Container(),
        ),
        Container(
          padding: EdgeInsets.all(12.0),
          decoration: BoxDecoration(
              color: Colors.orange.shade100,
              borderRadius: BorderRadius.all(
                Radius.circular(12.0),
              )),
          child: Text(
            "\$18",
            style: TextStyle(color: Colors.orange),
          ),
        ),
      ],
    );
  }

  Widget _buildBarberModelContent(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Image.asset(
              "assets/flip_carosel/object1.jpg",
              fit: BoxFit.cover,
              height: 32.0,
              width: 32.0,
            ),
          ),
        ),
        Text("Tom Cruze", style: TextStyle(fontWeight: FontWeight.w600))
      ],
    );
  }

  Widget _buildDateSelector() {
    return CommonBox(
      label: "Date & Time",
      child: Container(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "September 2018",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.black.withAlpha(100),
                  )),
                )
              ],
            ),
            Container(
              width: double.infinity,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    DateItem(dateStr: "Sun", dayNum: 28),
                    DateItem(dateStr: "Mon", dayNum: 29),
                    DateItem(dateStr: "Tue", dayNum: 30),
                    DateItem(dateStr: "Wed", dayNum: 31),
                    DateItem(
                      dateStr: "Thu",
                      dayNum: 1,
                      isActive: true,
                    ),
                    DateItem(dateStr: "Fri", dayNum: 2),
                    DateItem(dateStr: "Sat", dayNum: 3),
                    DateItem(dateStr: "Sun", dayNum: 4),
                    DateItem(dateStr: "Mon", dayNum: 5),
                    DateItem(dateStr: "Tue", dayNum: 6),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTimeSelector() {
    return CommonBox(
      label: "",
      child: Container(
        padding: EdgeInsets.all(8.0),
        width: double.infinity,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: <Widget>[
              TimeItem(timeLabel: "10:30 am"),
              TimeItem(
                timeLabel: "11:30 am",
                isActive: true,
              ),
              TimeItem(timeLabel: "12:00 pm"),
              TimeItem(timeLabel: "14:00 pm"),
              TimeItem(timeLabel: "16:30 pm"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _cardModelViewBuilder(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 8.0, bottom: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "American Express",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontSize: 16.0,
                    height: 1.2),
              ),
              Text(
                "8899 2234 **** ****",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                    fontSize: 14.0,
                    height: 1.2,
                    letterSpacing: 0.5),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _builtBottomControl() {
    return Container(
      color: Theme.of(context).primaryColor,
      height: 100.0,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "\$18.50",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0),
                ),
                Text(
                  "Tax: \$0.50",
                  style: TextStyle(
                    color: Colors.white,
                    height: 1.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(),
            ),
            RaisedButton(
              padding: EdgeInsets.only(
                  top: 16.0, bottom: 16.0, left: 20.0, right: 20.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)),
              elevation: 1.0,
              child: Text(
                "Book Now",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE1E1E1),
      body: Container(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildAppBar(),
              Padding(
                padding:
                    const EdgeInsets.only(left: 4.0, top: 16.0, bottom: 16.0),
                child: Text("Preston Barbers",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      RoundedSelectorWithLabel(
                        label: "Select Service",
                        builder: _buildSeviceModelContent,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      RoundedSelectorWithLabel(
                        label: "Select Barber",
                        builder: _buildBarberModelContent,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      _buildDateSelector(),
                      _buildTimeSelector(),
                      SizedBox(
                        height: 20.0,
                      ),
                      RoundedSelectorWithLabel(
                        label: "Select Payment",
                         highlightColor: Colors.deepOrange,
                        builder: _cardModelViewBuilder,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        )),
      ),
      bottomNavigationBar: _builtBottomControl(),
    );
  }
}

class RoundedSelectorWithLabel extends StatefulWidget {
  final String label;
  final WidgetBuilder builder;
  final Color highlightColor;
  RoundedSelectorWithLabel(
      {@required this.label,
      @required this.builder,
      this.highlightColor = Colors.blue});
  @override
  _RoundedSelectorWithLabelState createState() =>
      _RoundedSelectorWithLabelState();
}

class _RoundedSelectorWithLabelState extends State<RoundedSelectorWithLabel> {
  @override
  Widget build(BuildContext context) {
    return CommonBox(
      label: widget.label,
      child: IntrinsicHeight(
        child: Row(
          children: <Widget>[
            Container(
              color: widget.highlightColor,
              width: 5.0,
              // child: Container(),
            ),
            Expanded(child: widget.builder(context)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: Icon(
                Icons.keyboard_arrow_down,
                color: Colors.black.withAlpha(100),
              )),
            )
          ],
        ),
      ),
    );
  }
}

class CommonBox extends StatelessWidget {
  final String label;
  final Widget child;
  final Color backgroundColor;
  final borderRadius;
  CommonBox(
      {@required this.child,
      this.label,
      this.borderRadius = 4.0,
      this.backgroundColor = const Color(0xFFEAEAEA)});
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 8.0, right: 8.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              label.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.only(
                          left: 4.0, top: 8.0, bottom: 8.0),
                      child: Text(label,
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black45,
                              fontWeight: FontWeight.w600)),
                    )
                  : Padding(padding: const EdgeInsets.only(top: 8.0)),
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(borderRadius),
                    color: backgroundColor,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.grey.shade400,
                          blurRadius: 4.0,
                          offset: Offset(0.0, 2.0))
                    ],
                    border: Border.all(
                        color: Color(0xFFABABAB),
                        style: BorderStyle.solid,
                        width: 0.5),
                  ),
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.all(Radius.circular(borderRadius)),
                    child: child,
                  ))
            ]));
  }
}

class DateItem extends StatelessWidget {
  final String dateStr;
  final int dayNum;
  final bool isActive;
  DateItem({this.dateStr, this.dayNum, this.isActive = false});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Text(dateStr,
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Color(0xFF888888))),
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Container(
              height: 32.0,
              width: 32.0,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isActive ? Colors.blue : Colors.grey.shade300),
              child: Center(
                child: Text(
                  dayNum.toString(),
                  style: TextStyle(
                      color: isActive ? Colors.white : Colors.black87,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class TimeItem extends StatelessWidget {
  final String timeLabel;
  final bool isActive;
  TimeItem({@required this.timeLabel, this.isActive = false});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: isActive ? Colors.blue : Colors.transparent),
      child: Text(
        timeLabel,
        style: TextStyle(
            color: isActive ? Colors.white : Colors.black87,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}
