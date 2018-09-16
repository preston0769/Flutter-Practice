import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ShoppingItemModel {
  String title;
  String assetPath;
  double unitPrice;
  int unitNumber;
  ShoppingItemModel(
      {this.title, this.assetPath, this.unitPrice, this.unitNumber});
}

final two_digits_formatter = new NumberFormat("0.00");

final List<ShoppingItemModel> shoppingItems = [
  ShoppingItemModel(
    title: "Black Tea",
    assetPath: "assets/shoppingcart/blacktea.jpg",
    unitNumber: 1,
    unitPrice: 60.0,
  ),
  ShoppingItemModel(
    title: "Fruit Tea",
    assetPath: "assets/shoppingcart/fruittea.jpg",
    unitNumber: 2,
    unitPrice: 56.2,
  ),
  ShoppingItemModel(
    title: "Bubble Tea",
    assetPath: "assets/shoppingcart/bubbletea.jpg",
    unitNumber: 3,
    unitPrice: 43.2,
  ),
];

class ShoppingCartLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.keyboard_backspace),
          onPressed: () {},
          color: Colors.grey,
        ),
        title: new Text(
          "Card",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        elevation: 0.0,
      ),
      body: ShoppingMainPage(),
    );
  }
}

class ShoppingMainPage extends StatefulWidget {
  @override
  _ShoppingMainPageState createState() => _ShoppingMainPageState();
}

class _ShoppingMainPageState extends State<ShoppingMainPage> {

  _updateState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var subTotal = 0.00;
    shoppingItems.map((item) {
      subTotal += item.unitNumber * item.unitPrice;
    }).toList();
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFE7EAF2), Color(0xFFD2D9EB)])),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 20.0,
          ),
          Expanded(
              child: Column(
                  children: shoppingItems.map((item) {
            return ItemCard(
              model: item,
              onItemChanged: _updateState,
            );
          }).toList())),
          Container(
            color: Color(0x99F5F7FD),
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Subtotal(${shoppingItems.length} item)",
                        style: TextStyle(fontSize: 16.0, letterSpacing: 1.0),
                      ),
                      Text("${two_digits_formatter.format(subTotal)} USD",
                          style: TextStyle(fontSize: 16.0, letterSpacing: 1.0))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Shipping(Domestic)",
                          style: TextStyle(fontSize: 16.0, letterSpacing: 1.0)),
                      Text("30 USD",
                          style: TextStyle(fontSize: 16.0, letterSpacing: 1.0))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0, bottom: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Cart Subtotal",
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.0)),
                      Text("${two_digits_formatter.format(subTotal+30.0)} USD",
                          style: TextStyle(
                              color: Colors.orange,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.0))
                    ],
                  ),
                ),
                Container(
                    width: double.infinity,
                    child: RaisedButton(
                      padding: EdgeInsets.all(10.0),
                      elevation: 3.0,
                      color: Colors.blueAccent,
                      child: Text("Proceed to Checkout",
                          style:
                              TextStyle(fontSize: 20.0, color: Colors.white)),
                      onPressed: () {},
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ItemCard extends StatefulWidget {
  final ShoppingItemModel model;
  final VoidCallback onItemChanged ;

  ItemCard({@required this.model,@required this.onItemChanged});

  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
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
              onTap: () {
                widget.model.unitNumber = widget.model.unitNumber > 1
                    ? widget.model.unitNumber - 1
                    : widget.model.unitNumber;
                setState(() {});
                widget.onItemChanged();
              },
            )),
        Expanded(
            child: Center(
                child: Text(
          "${widget.model.unitNumber}",
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
            onTap: () {
              widget.model.unitNumber = widget.model.unitNumber + 1;
              setState(() {});
              widget.onItemChanged();
            },
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
                      widget.model.assetPath,
                      fit: BoxFit.cover,
                    )),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 0.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(widget.model.title,
                            style: TextStyle(fontSize: 24.0)),
                        _buildItemNumberControl(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "${two_digits_formatter.format(widget.model.unitPrice * widget.model.unitNumber)}",
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

  @override
  dispose() {
    // TODO: implement dispose
    return super.dispose();
  }
}
