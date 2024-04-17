import 'package:flutter/material.dart';
import 'package:namer_app/config/color.dart';
import 'package:namer_app/config/themes.dart';

class SearchTextField extends StatelessWidget {
  final String? hintText;
  final VoidCallback? onPressed;
  final VoidCallback? onSubmitted;

  const SearchTextField({
    Key? key,
    this.hintText,
    this.onPressed,
    this.onSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        style: Themes.light.textTheme.titleMedium,
        decoration: InputDecoration(
          isCollapsed: true,
          isDense: true,
          hintText: hintText,
          fillColor: Colors.white,
          filled: true,
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          border: OutlineInputBorder(),
          suffixIcon: IconButton(
            icon: Icon(
              Icons.search,
              color: borderColor,
              size: 24,
            ),
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            onPressed: onPressed,
          ),
        ),
        onSubmitted: (_) => onSubmitted?.call(),
      ),
    );
  }
}
