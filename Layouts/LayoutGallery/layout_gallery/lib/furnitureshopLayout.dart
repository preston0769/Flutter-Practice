import 'package:flutter/material.dart';

List<FurnitureModel> furnitureList = [
  FurnitureModel(
      imagePath: "assets/furniture/chair5.png",
      title: "Swing Dinner Chair",
      description:
          "Fram finished lacaured nd a seat finsh in adf lout oak. Great a long seat.",
      price: 99.0),
  FurnitureModel(
      imagePath: "assets/furniture/chair1.png",
      title: "Slik Dinning Chair",
      description:
          "Frame finish lacqurered oak and a seat finish in lacqured leather.",
      price: 319.0),
  FurnitureModel(
      imagePath: "assets/furniture/chair3.png",
      title: "Lauren Chair",
      description:
          "Simple and elegant design with solid feeling. Not just a piece of funirture.",
      price: 199.0),
  FurnitureModel(
      imagePath: "assets/furniture/chair4.png",
      title: "Dark Chair",
      description:
          "Industrilized style and firm engineering to make it robust and confortable.",
      price: 129.0)
];

class FurnitureShopLayout extends StatefulWidget {
  @override
  _FurnitureShopLayoutState createState() => _FurnitureShopLayoutState();
}

class _FurnitureShopLayoutState extends State<FurnitureShopLayout> {
  Widget _buildHeadIcons() {
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.class_,
            size: 24.0,
            color: Colors.white.withAlpha(180),
          ),
          SizedBox(
            width: 10.0,
          ),
          Icon(
            Icons.arrow_forward,
            size: 24.0,
            color: Colors.white.withAlpha(180),
          ),
          Expanded(
            child: Container(),
          ),
          InkWell(
            onTap: (){
              Navigator.pop(context);
            },
                      child: Icon(
              Icons.clear,
              size: 24.0,
              color: Colors.white.withAlpha(180),
            ),
          ),
        ],
      ),
    );
  }

  BoxDecoration _generateBackgroundGradient() {
    return BoxDecoration(
        gradient:
            LinearGradient(colors: [Color(0xFF1F1F1F), Color(0xFF212121)]),
        color: Colors.black);
  }

  Widget _buildFeatureBanner() {
    return Padding(
        padding: EdgeInsets.only(left: 40.0),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.0),
            topLeft: Radius.circular(20.0),
          ),
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.grey.withAlpha(180), Colors.grey])),
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
              child: Row(
                children: <Widget>[
                  Image.asset(
                    "assets/furniture/chair2.png",
                    height: 150.0,
                    width: 150.0,
                    fit: BoxFit.fill,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Grey Rest Chair",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "most accurat match",
                        style: TextStyle(
                            color: Colors.white.withAlpha(100), height: 1.5),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Row(
                          children: <Widget>[
                            Text("from",
                                style: TextStyle(
                                    fontFamily: 'Petit Formal Script',
                                    color: Colors.white)),
                            Text(
                              " \$320",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.4),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }

  Widget _buildAlterAndAction() {
    return Padding(
      padding:
          EdgeInsets.only(top: 32.0, left: 40.0, right: 16.0, bottom: 32.0),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Container(
              height: 30.0,
              width: 30.0,
              color: Colors.white,
              child: Center(
                child: Text(
                  "14",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Alternatives",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Joana and 10 others added",
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0,
                      height: 1.4),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Container(
              height: 40.0,
              width: 40.0,
              color: Colors.white.withAlpha(180),
              child: Center(
                  child: Icon(Icons.add,
                      size: 32.0, color: Colors.black.withAlpha(150))),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItemList() {
    return Expanded(
      child: ListView(
          children: furnitureList.map((furniture) {
        return FurnitureItem(
          model: furniture,
        );
      }).toList()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.transparent,
      body: Container(
        decoration: _generateBackgroundGradient(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              _buildHeadIcons(),
              _buildFeatureBanner(),
              _buildAlterAndAction(),
              _buildItemList(),
            ],
          ),
        ),
      ),
    );
  }
}

class FurnitureItem extends StatelessWidget {
  final FurnitureModel model;

  FurnitureItem({@required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 50.0, bottom: 20.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey, width: 1.0))),
        child: Container(
          child: Row(
            children: <Widget>[
              Image.asset(
                model.imagePath,
                height: 120.0,
                width: 120.0,
                fit: BoxFit.fill,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    model.title,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.w700),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: SizedBox(
                      height: 40.0,
                      width: 180.0,
                      child: OverflowBox(
                        child: Text(
                          model.description,
                          style: TextStyle(
                              color: Colors.white.withAlpha(100), height: 1.2),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Row(
                      children: <Widget>[
                        Text("from",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Petit Formal Script',
                                color: Colors.white)),
                        Text(
                          " \$${model.price}",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.4),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FurnitureModel {
  final String imagePath;
  final String title;
  final String description;
  final double price;
  FurnitureModel(
      {@required this.title,
      @required this.description,
      @required this.price,
      @required this.imagePath});
}
