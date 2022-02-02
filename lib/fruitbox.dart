// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class FruitBox extends StatelessWidget {
  final String boxIcon;

  FruitBox(this.boxIcon);
  @override
  Widget build(BuildContext context) {
    return Draggable(
      data: boxIcon,
      child: Center(
        child: Text(
          boxIcon,
          style: TextStyle(
              fontSize: 50.0,
              decoration: TextDecoration.none,
              color: Colors.green),
        ),
      ),
      feedback: Container(
        height: 100.0,
        width: 100.0,
        color: Colors.transparent,
        child: Center(
          child: Text(
            boxIcon,
            style: TextStyle(fontSize: 50.0, decoration: TextDecoration.none),
          ),
        ),
      ),
      // childWhenDragging: Container(
      //   height: 120.0,
      //   width: 120.0,
      //   color: Colors.transparent,
      // ),
    );
  }
}
