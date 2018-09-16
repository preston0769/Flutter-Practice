import 'package:flutter/material.dart';
import 'package:layout_gallery/ItemCart.dart';

main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ShoppingCartLayout(),
    );
  }
}

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
      body: Container(
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
                children: <Widget>[
                  ItemCard(
                    Title: "Black Tea",
                    AssetPath: "assets/shoppingcart/blacktea.jpg",
                    OnPriceChange: (double result) {},
                    UnitNumber: 1,
                    UnitPrice: 60.0,
                  ),
                  ItemCard(
                    Title: "Fruit Tea",
                    AssetPath: "assets/shoppingcart/fruittea.jpg",
                    OnPriceChange: (double result) {},
                    UnitNumber: 3,
                    UnitPrice: 60.0,
                  ),
                  ItemCard(
                    Title: "Bubble Tea",
                    AssetPath: "assets/shoppingcart/bubbletea.jpg",
                    OnPriceChange: (double result) {},
                    UnitNumber: 3,
                    UnitPrice: 60.0,
                  ),
                ],
              ),
            ),
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
                          "Subtotal(3 item)",
                          style: TextStyle(fontSize: 16.0, letterSpacing: 1.0),
                        ),
                        Text("380 USD",
                            style:
                                TextStyle(fontSize: 16.0, letterSpacing: 1.0))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Shipping(Domestic)",
                            style:
                                TextStyle(fontSize: 16.0, letterSpacing: 1.0)),
                        Text("30 USD",
                            style:
                                TextStyle(fontSize: 16.0, letterSpacing: 1.0))
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
                        Text("410 USD",
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
      ),
    );
  }
}
