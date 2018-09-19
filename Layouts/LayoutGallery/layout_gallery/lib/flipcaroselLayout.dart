import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

List<CardViewModel> cardList = [
  CardViewModel(
      address: 'PRESTON STREET',
      maxHeightInFeet: 8,
      minHeightInFeet: 7,
      tempInDegreee: 44.6,
      backgroundAssetPath: 'assets/flip_carosel/object4.jpg',
      cardinalDirection: "ENS",
      weatherType: "Rainy",
      windSpeedInMph: 30.2),
  CardViewModel(
      address: 'FANNING ROAD',
      maxHeightInFeet: 2,
      minHeightInFeet: 0,
      tempInDegreee: 34.6,
      backgroundAssetPath: 'assets/flip_carosel/object6.jpg',
      cardinalDirection: "ENS",
      weatherType: "Sunny",
      windSpeedInMph: 55.2),
  CardViewModel(
      address: 'FRAND ROAD',
      maxHeightInFeet: 8,
      minHeightInFeet: 7,
      tempInDegreee: 44.6,
      backgroundAssetPath: 'assets/flip_carosel/object5.jpg',
      cardinalDirection: "ENS",
      weatherType: "Rainy",
      windSpeedInMph: 30.2),
  CardViewModel(
      address: '10TH STREET',
      maxHeightInFeet: 3,
      minHeightInFeet: 2,
      tempInDegreee: 65.1,
      backgroundAssetPath: 'assets/flip_carosel/object1.jpg',
      cardinalDirection: "ENE",
      weatherType: "Mostly Cloudy",
      windSpeedInMph: 11.2),
  CardViewModel(
      address: '10TH NORTH STREET\nTO 14TH STREET NO...',
      maxHeightInFeet: 6,
      minHeightInFeet: 4,
      tempInDegreee: 75.1,
      backgroundAssetPath: 'assets/flip_carosel/object2.jpg',
      cardinalDirection: "E",
      weatherType: "Rain",
      windSpeedInMph: 20.2),
  CardViewModel(
      address: 'SWANSTON STREET',
      maxHeightInFeet: 9,
      minHeightInFeet: 2,
      tempInDegreee: 54.6,
      backgroundAssetPath: 'assets/flip_carosel/object3.jpg',
      cardinalDirection: "E",
      weatherType: "Sunny",
      windSpeedInMph: 30.2),
  CardViewModel(
      address: 'PRESTON STREET',
      maxHeightInFeet: 8,
      minHeightInFeet: 7,
      tempInDegreee: 44.6,
      backgroundAssetPath: 'assets/flip_carosel/object1.jpg',
      cardinalDirection: "ENS",
      weatherType: "Rainy",
      windSpeedInMph: 30.2),
];

class FlipCaroselLayout extends StatefulWidget {
  @override
  _FlipCaroselLayoutState createState() => _FlipCaroselLayoutState();
}

class _FlipCaroselLayoutState extends State<FlipCaroselLayout> {
  double scrollPercent = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: new Column(
        children: <Widget>[
          // room for status bar
          Container(
            height: 36.0,
            width: double.infinity,
          ),

          //Cards
          Expanded(
            child: Padding(
                padding: EdgeInsets.all(16.0),
                child: CardFlipper(onScroll: (double scrollPercent) {
                  setState(() {
                    this.scrollPercent = scrollPercent;
                  });
                })),
          ),

          //Bottom bar
          BottomBar(
              cardCount: cardList.length, scrollPercent: this.scrollPercent),

          Container(
            width: double.infinity,
            height: 20.0,
          )
        ],
      ),
    );
  }
}

class CardFlipper extends StatefulWidget {
  Function(double scrollPercent) onScroll;
  CardFlipper({this.onScroll});
  @override
  _CardFlipperState createState() => _CardFlipperState();
}

class _CardFlipperState extends State<CardFlipper>
    with TickerProviderStateMixin {
  double scrollPercent = 0.0;
  Offset startDrag;
  double startDragPercentScroll;
  double finishScrollStart;
  double finishScrollEnd;
  Stopwatch stopWatch = new Stopwatch();
  Duration duration;

  AnimationController finishScrollController;

  void _onHorizontalDragStart(DragStartDetails details) {
    startDrag = details.globalPosition;
    startDragPercentScroll = scrollPercent;

  }

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    final currentDrag = details.globalPosition;
    final dragDistance = currentDrag.dx - startDrag.dx;
    final singleCardDragPercent = dragDistance / context.size.width;
    var cardNumbers = cardList.length;
    setState(() {
      scrollPercent =
          (startDragPercentScroll + (-singleCardDragPercent / cardNumbers))
              .clamp(0.0, 1.0 - (1 / cardNumbers));
      if (widget.onScroll != null) {
        widget.onScroll(scrollPercent);
      }
    });
  }

  void _onHorizontalDragEnd(DragEndDetails details) {
    var numCards = cardList.length;

   var speed = details.primaryVelocity; 

    finishScrollStart = scrollPercent;
    if(speed.abs()>500){

      finishScrollEnd = (speed>0?(scrollPercent * numCards).floor():(scrollPercent * numCards).ceil()) / numCards;
    }
    else{
      finishScrollEnd = (scrollPercent * numCards).round() / numCards;
    }
    finishScrollController.forward(from: 0.0);

    //Do some snapping
    setState(() {
      startDrag = null;
      startDragPercentScroll = null;
    });
  }

  Widget _buildCard(CardViewModel viewModel, int cardIndex, int cardCount,
      double scrollPercent) {
    final cardScrollPercent = scrollPercent / (1 / cardCount);
    final prallax = scrollPercent - (cardIndex / cardCount);

    return FractionalTranslation(
      translation: new Offset(cardIndex - cardScrollPercent, 0.0),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Transform(
            transform: _buildCardProjection(cardScrollPercent - cardIndex),
            child: new Card(viewModel: viewModel, parralaxPercent: prallax)),
      ),
    );
  }

  Matrix4 _buildCardProjection(double scrollPercent) {
    final perspective = 0.002;
    final radius = 1.0;
    final angle = scrollPercent * pi / 8;
    final horizontalTranslation = 0.0;

    Matrix4 projection = Matrix4.identity()
      ..setEntry(0, 0, 1 / radius)
      ..setEntry(1, 1, 1 / radius)
      ..setEntry(3, 2, -perspective)
      ..setEntry(2, 3, -radius)
      ..setEntry(3, 3, perspective * radius + 1.0);

    projection *= Matrix4.translationValues(
            horizontalTranslation , 0.0, radius) *
        Matrix4.rotationY(angle);

    return projection;

  }

  List<Widget> _buildCards() {
    return cardList.map((card) {
      return _buildCard(
          card, cardList.indexOf(card), cardList.length, scrollPercent);
    }).toList();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    finishScrollController = new AnimationController(
      duration: Duration(milliseconds: 150),
      vsync: this,
    )..addListener(() {
        setState(() {
          scrollPercent = lerpDouble(
              finishScrollStart, finishScrollEnd, finishScrollController.value);
          if (widget.onScroll != null) {
            widget.onScroll(scrollPercent);
          }
        });
      });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    finishScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onHorizontalDragStart: _onHorizontalDragStart,
        onHorizontalDragUpdate: _onHorizontalDragUpdate,
        onHorizontalDragEnd: _onHorizontalDragEnd,
        behavior: HitTestBehavior.translucent,
        child: Stack(children: _buildCards()));
  }
}

class Card extends StatelessWidget {
  final CardViewModel viewModel;
  final double parralaxPercent;
  Card({@required this.viewModel, this.parralaxPercent});
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        //Background
        ClipRRect(
            borderRadius: new BorderRadius.circular(10.0),
            child: FractionalTranslation(
              translation: new Offset(parralaxPercent * 2.0, 0.0),
              child: OverflowBox(
                maxWidth: double.infinity,
                child: new Image.asset(
                  viewModel.backgroundAssetPath,
                  fit: BoxFit.cover,
                ),
              ),
            )),

        //Content
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
              child: new Text(
                viewModel.address.toUpperCase(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontFamily: 'petita',
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0),
              ),
            ),
            Expanded(
              child: Container(),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                    '${viewModel.minHeightInFeet} - ${viewModel.maxHeightInFeet}',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 120.0,
                        letterSpacing: -5.0)),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 30.0),
                  child: new Text('FT',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Icon(
                  Icons.wb_sunny,
                  color: Colors.white,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text('${viewModel.tempInDegreee}°',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold)),
                )
              ],
            ),
            Expanded(
              child: Container(),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  border: Border.all(color: Colors.white, width: 1.5),
                  color: Colors.black.withOpacity(0.2),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 8.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(viewModel.weatherType,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold)),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: new Icon(Icons.wb_cloudy, color: Colors.white),
                      ),
                      Text(
                        '${viewModel.windSpeedInMph} ${viewModel.cardinalDirection}',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}

class BottomBar extends StatelessWidget {
  final int cardCount;
  final double scrollPercent;
  BottomBar({this.cardCount, this.scrollPercent});
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
        child: Row(
          children: <Widget>[
            Expanded(
                child: new Center(
              child: InkWell(
                 onTap: (){
                   Navigator.pop(context);
                 },
                child: new Icon(Icons.arrow_back, color: Colors.white)),
            )),
            Expanded(
                child: Container(
                    width: double.infinity,
                    height: 5.0,
                    child: new ScrollIndicator(
                        cardCount: cardCount, scrollPercent: scrollPercent))),
            Expanded(
                child: new Center(
              child: new Icon(Icons.settings, color: Colors.white),
            ))
          ],
        ));
  }
}

class ScrollIndicator extends StatelessWidget {
  final int cardCount;
  final double scrollPercent;

  ScrollIndicator({this.cardCount, this.scrollPercent});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ScrollIndicatorPainter(
          cardCount: cardCount, scrollPercent: scrollPercent),
      child: new Container(),
    );
  }
}

class ScrollIndicatorPainter extends CustomPainter {
  final int cardCount;
  final double scrollPercent;

  final Paint trackPaint;
  final Paint thumbPaint;

  ScrollIndicatorPainter({this.cardCount, this.scrollPercent})
      : trackPaint = new Paint()
          ..color = const Color(0xFF444444)
          ..style = PaintingStyle.fill,
        thumbPaint = new Paint()
          ..color = Colors.white
          ..style = PaintingStyle.fill;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRRect(
        RRect.fromRectAndCorners(
          new Rect.fromLTWH(0.0, 0.0, size.width, size.height),
          topLeft: Radius.circular(3.0),
          bottomLeft: Radius.circular(3.0),
          topRight: Radius.circular(3.0),
          bottomRight: Radius.circular(3.0),
        ),
        trackPaint);
    final thumbWidth = size.width / cardCount;
    final thumbLeft = scrollPercent * size.width;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
          new Rect.fromLTWH(thumbLeft, 0.0, thumbWidth, size.height),
          topLeft: Radius.circular(3.0),
          bottomLeft: Radius.circular(3.0),
          topRight: Radius.circular(3.0),
          bottomRight: Radius.circular(3.0),
        ),
        thumbPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class CardViewModel {
  String backgroundAssetPath;
  String address;
  int minHeightInFeet;
  int maxHeightInFeet;
  double tempInDegreee;
  String weatherType;
  double windSpeedInMph;
  String cardinalDirection;

  CardViewModel(
      {this.address,
      this.backgroundAssetPath,
      this.cardinalDirection,
      this.maxHeightInFeet,
      this.minHeightInFeet,
      this.tempInDegreee,
      this.weatherType,
      this.windSpeedInMph});
}
