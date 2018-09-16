import 'package:flutter/material.dart';

class ItemCard extends StatefulWidget {
  String Title;
  String AssetPath;
  double UnitPrice;
  int UnitNumber;
  Function(double result) OnPriceChange;

  ItemCard(
      {@required this.Title,
      @required this.AssetPath,
      this.UnitNumber = 1,
      @required this.UnitPrice,
      @required this.OnPriceChange});

  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  int UnitNumber;

  _buildItemNumberControl() {
    return Container(
      width: 120.0,
      decoration: BoxDecoration(
          border: Border.all(
              width: 0.5, color: Colors.grey, style: BorderStyle.solid)),
      child: Row(mainAxisSize: MainAxisSize.max, children: <Widget>[
        Container(
            decoration: ShapeDecoration(
                shape:
                    Border(right: BorderSide(color: Colors.grey, width: 0.5))),
            child: InkWell(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Icon(Icons.remove),
              ),
              onTap: () {},
            )),
        Expanded(
            child: Center(
                child: Text(
          "${widget.UnitNumber}",
          style: TextStyle(color: Colors.blue),
        ))),
        Container(
          decoration: ShapeDecoration(
              shape: Border(left: BorderSide(color: Colors.grey, width: 0.5))),
          child: InkWell(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Icon(
                Icons.add,
                color: Colors.blue,
              ),
            ),
            onTap: () {},
          ),
        )
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      child: Stack(
        children: <Widget>[
          Container(
            decoration:
                BoxDecoration(color: Color(0xFFF1F1F1), boxShadow: <BoxShadow>[
              new BoxShadow(
                  color: const Color(0x88AAAAAA),
                  offset: new Offset(1.0, 4.0),
                  blurRadius: 4.0)
            ]),
            padding: EdgeInsets.all(20.0),
            height: 130.0,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                AspectRatio(
                    aspectRatio: 1.0,
                    child: new Image.asset(
                      widget.AssetPath,
                      fit: BoxFit.cover,
                    )),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 0.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(widget.Title, style: TextStyle(fontSize: 24.0)),
                        _buildItemNumberControl(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "${widget.UnitPrice * widget.UnitNumber}",
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              " USD",
                              style: TextStyle(color: Colors.blue),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              right: 0.0,
              top: 0.0,
              child: Transform(
                  transform: Matrix4.translationValues(15.0, 20.0, 0.0),
                  child: Container(
                    color: Colors.blue,
                    height: 30.0,
                    width: 30.0,
                    child: InkWell(
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 24.0,
                      ),
                    ),
                  ))),
        ],
      ),
    );
  }
}
