import 'package:flutter/material.dart';
import 'package:namer_app/config/color.dart';
import 'package:namer_app/config/themes.dart';

class SearchTextField extends StatelessWidget {
  final String? hintText;
  final ValueChanged<String>? onChanged;
  const SearchTextField({super.key, this.hintText, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        style: Themes.light.textTheme.titleMedium,
        decoration: InputDecoration(
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
            onPressed: () {},
          ),
        ),
        onChanged: onChanged, // onChanged 콜백 등록
      ),
    );
  }
}
