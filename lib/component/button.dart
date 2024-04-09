import 'package:flutter/material.dart';
import 'package:namer_app/config/color.dart';

class ButtonWidget {
  ButtonWidget(this.text, this.onPressed);
  final String text;
  final VoidCallback onPressed;

  Widget build(Color buttonColor) {
    return OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        side: MaterialStateProperty.all<BorderSide>(
          BorderSide(color: buttonColor),
        ),
        overlayColor: MaterialStateProperty.resolveWith<Color>(
          (states) => Colors.transparent,
        ), // Splash 효과 제거
      ),
      child: Text(
        text,
        style: TextStyle(color: buttonColor),
      ),
    );
  }

  red() {
    Color buttonColor = redMain;
    return build(buttonColor);
  }

  blue() {
    Color buttonColor = primaryMain;
    return build(buttonColor);
  }

  green() {
    Color buttonColor = greenMain;
    return build(buttonColor);
  }
}
