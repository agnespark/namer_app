import 'package:flutter/material.dart';
import 'package:namer_app/config/color.dart';

Widget PlusButtonWidget({
  required VoidCallback onPressed,
}) {
  return IconButton(
    icon: Icon(
      Icons.add_circle_rounded,
      color: primaryMain,
    ),
    onPressed: onPressed,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    hoverColor: Colors.transparent,
  );
}
