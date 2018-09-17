import 'dart:ui';

import 'package:flutter/material.dart';

List<CardViewModel> cardList = [
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
];

class FlipCaroselLayout extends StatefulWidget {
  @override
  _FlipCaroselLayoutState createState() => _FlipCaroselLayoutState();
}

class _FlipCaroselLayoutState extends State<FlipCaroselLayout> {
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
            child: Padding(padding: EdgeInsets.all(16.0), child: CardFlipper()),
          ),

          //Bottom bar
          Container(
            width: double.infinity,
            height: 50.0,
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}

class CardFlipper extends StatefulWidget {
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

  AnimationController finishScrollController;

  void _onHorizontalDragStart(DragStartDetails details) {
    startDrag = details.globalPosition;
    startDragPercentScroll = scrollPercent;
  }

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    final currentDrag = details.globalPosition;
    final dragDistance = currentDrag.dx - startDrag.dx;
    final singleCardDragPercent = dragDistance / context.size.width;
    var cardNumbers = 3;
    setState(() {
      scrollPercent =
          (startDragPercentScroll + (-singleCardDragPercent / cardNumbers))
              .clamp(0.0, 1.0 - (1 / cardNumbers));
    });
  }

  void _onHorizontalDragEnd(DragEndDetails details) {
    var numCards = 3;
    finishScrollStart = scrollPercent;
    finishScrollEnd = (scrollPercent * numCards).round() / numCards;

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

    return FractionalTranslation(
      translation: new Offset(cardIndex - cardScrollPercent, 0.0),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: new Card(viewModel: viewModel),
      ),
    );
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
  Card({@required this.viewModel});
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        //Background
        ClipRRect(
            borderRadius: new BorderRadius.circular(10.0),
            child: new Image.asset(
              viewModel.backgroundAssetPath,
              fit: BoxFit.cover,
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
