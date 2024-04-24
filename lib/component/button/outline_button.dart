import 'package:flutter/material.dart';
import 'package:namer_app/config/color.dart';

class ButtonWidget {
  ButtonWidget(this.text, this.onPressed);
  final String text;
  final VoidCallback onPressed;

  body(Color buttonColor) {
    return OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        side: MaterialStateProperty.all<BorderSide>(
          BorderSide(color: buttonColor),
        ),
        overlayColor: MaterialStateProperty.resolveWith<Color>(
          (states) => Colors.transparent,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(color: buttonColor),
      ),
    );
  }

  red() {
    Color buttonColor = redMain;
    return body(buttonColor);
  }

  blue() {
    Color buttonColor = primaryMain;
    return body(buttonColor);
  }

  green() {
    Color buttonColor = greenMain;
    return body(buttonColor);
  }
}
