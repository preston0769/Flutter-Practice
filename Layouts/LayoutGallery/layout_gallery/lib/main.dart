import 'package:flutter/material.dart';
import 'package:layout_gallery/shoppingcartLayout.dart';

main() => runApp(
  new MyApp()
  );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
         brightness: Brightness.light
      ),
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
