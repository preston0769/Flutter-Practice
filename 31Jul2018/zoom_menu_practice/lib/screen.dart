
import 'package:flutter/material.dart';


final restaurantScreen = new Screen();
final otherScreen = new Screen();


class Screen{
  final String title;
  final DecorationImage background;
  WidgetBuilder contentBuilder;

  Screen({
    this.title,
    this.background,
    this.contentBuilder
  });
}