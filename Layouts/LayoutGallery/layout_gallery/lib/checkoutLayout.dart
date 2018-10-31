import 'package:flutter/material.dart';

class CheckoutLayout extends StatefulWidget {
  @override
  _CheckoutLayoutState createState() => _CheckoutLayoutState();
}

class _CheckoutLayoutState extends State<CheckoutLayout> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      home: Scaffold(
        backgroundColor: Color(0xFFCDCDDA),
        appBar: AppBar(
          elevation: 0.0,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.grey,
            ),
          ),
          title: Text(
            "Checkout",
            style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.0),
          ),
          backgroundColor: Colors.transparent,
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              CheckoutAmount(),
              Expanded(child: PaymentMethods()),
            ],
          ),
        ),
      ),
    );
  }
}

class CheckoutAmount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.0),
      child: Column(
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(
                "Total Payment",
                style: TextStyle(
                    color: Colors.black38,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "\$120",
                  textScaleFactor: 2.4,
                  style: TextStyle(
                      letterSpacing: 2.0,
                      color: Colors.lightBlue,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          SizedBox(
            height: 16.0,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      "Date",
                      textScaleFactor: 1.3,
                      style: TextStyle(color: Colors.grey),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        "12 Sep 2018",
                        style: TextStyle(
                            color: Colors.black45,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w700),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      "Time",
                      textScaleFactor: 1.3,
                      style: TextStyle(color: Colors.grey),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        "Monday, 18:21",
                        style: TextStyle(
                            color: Colors.black45,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w700),
                      ),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class PaymentMethods extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withAlpha(50),
              blurRadius: 6.0,
              offset: Offset(0.0, 0.0),
              spreadRadius: 3.0)
        ],
        color: Color(0xFFEEF6FE),
      ),
      child: Container(
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(32.0),
              child: Text(
                "Payment Method",
                style: TextStyle(
                    color: Colors.black45,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    Expanded(
                        child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                        child: Column(
                          children: <Widget>[
                            PaymentMethodItem("assets/icons/paypal-logo.png",
                                "PayPal", "me@flutter.com"),
                            PaymentMethodItem(
                                "assets/icons/mastercard-logo.png",
                                "MasterCard",
                                "5412 **** **** 2345"),
                            PaymentMethodItem("assets/icons/visa-logo.png",
                                "Visa Card", "4222 **** **** 8888"),
                          ],
                        ),
                      ),
                    )),
                    Container(
                      padding: EdgeInsets.only(
                          left: 24.0, right: 24.0, bottom: 16.0),
                      width: double.infinity,
                      child: FlatButton(
                        padding: EdgeInsets.all(16.0),
                        onPressed: () {},
                        color: Colors.lightBlue,
                        child: Text(
                          "Confirm Payment",
                          textScaleFactor: 1.3,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PaymentMethodItem extends StatelessWidget {
  final String logoPath;
  final String providerName;
  final String subTitle;

  PaymentMethodItem(this.logoPath, this.providerName, this.subTitle);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: Colors.grey.withAlpha(10),
            spreadRadius: 6.0,
            offset: Offset(0.0, 1.0),
            blurRadius: 5.0)
      ]),
      margin: EdgeInsets.only(top: 18.0),
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
            child: Image.asset(logoPath, fit: BoxFit.fill, width: 64.0),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: Text(
                    providerName,
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  subTitle,
                  style: TextStyle(
                      color: Colors.black38, fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Icon(
              Icons.arrow_forward,
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}
