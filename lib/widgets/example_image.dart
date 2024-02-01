import 'package:flutter/material.dart';

Widget exampleImage(double width, double height, String url) {
  return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        image: DecorationImage(image: AssetImage("$url"), fit: BoxFit.cover),
      ));
}
