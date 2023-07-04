import "package:flutter/material.dart";
import "package:flutter_app/gradientcontainer.dart";

void main() {

  var colorList = [Colors.deepPurpleAccent, Colors.purpleAccent];

  runApp(
     MaterialApp(
      home: Scaffold(
        body: GradientContainer(colorList),
      ),
    ),
  );
}

