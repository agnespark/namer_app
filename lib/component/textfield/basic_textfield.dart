import 'package:flutter/material.dart';
import 'package:namer_app/config/themes.dart';

class BasicTextField extends StatelessWidget {
  final String? hintText;
  const BasicTextField({super.key, this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 350,

      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 12.5, horizontal: 16),
          isDense: true,
          isCollapsed: true,
          border: OutlineInputBorder(),
          hintText: hintText,
        ),
        style: Themes.light.textTheme.titleMedium,
      ),
    );
  }
}
