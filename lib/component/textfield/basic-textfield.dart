import 'package:flutter/material.dart';
import 'package:namer_app/config/themes.dart';

class BasicTextField extends StatelessWidget {
  final String? hintText;
  const BasicTextField({super.key, this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 306,
      height: 38,
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          border: OutlineInputBorder(),
          hintText: hintText,
        ),
        style: Themes.light.textTheme.titleMedium,
      ),
    );
  }
}
