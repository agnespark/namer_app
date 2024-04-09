import 'package:flutter/material.dart';

class DepthWidget {
  DepthWidget(
      this.firstDepth, this.secondDepth, this.thirdDepth, this.fourthDepth);
  final String firstDepth;
  final String? secondDepth;
  final String? thirdDepth;
  final String? fourthDepth;

  Widget(int depth) {
    if (depth == 1) {
      return Row(
        children: [
          Text(
            firstDepth,
            style: TextStyle(color: Colors.lightBlueAccent),
          ),
        ],
      );
    } else if (depth == 2) {
      return Row(
        children: [
          Text(firstDepth),
          Text('/'),
          Text(secondDepth!, style: TextStyle(color: Colors.lightBlueAccent)),
        ],
      );
    } else if (depth == 3) {
      return Row(
        children: [
          Text(firstDepth),
          Text('/'),
          Text(secondDepth!),
          Text('/'),
          Text(thirdDepth!, style: TextStyle(color: Colors.lightBlueAccent)),
        ],
      );
    } else {
      return Row(
        children: [
          Text(firstDepth),
          Text('/'),
          Text(secondDepth!),
          Text('/'),
          Text(thirdDepth!),
          Text('/'),
          Text(fourthDepth!, style: TextStyle(color: Colors.lightBlueAccent)),
        ],
      );
    }
  }

  oneDepth() {
    int depth = 1;
    Widget(depth);
  }

  twoDepth() {
    int depth = 2;
    Widget(depth);
  }

  threeDepth() {
    int depth = 3;
    Widget(depth);
  }

  fourDepth() {
    int depth = 4;
    Widget(depth);
  }
}
