import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('custom'),
        ),
      ],
    );
  }
}
