import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:namer_app/config/themes.dart';

class FilterRow extends StatelessWidget {
  final String title;
  final Widget body;
  FilterRow({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        // mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 160,
            child: Row(
              // mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  child: Text(
                    title,
                    style: Themes.light.textTheme.headlineLarge,
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: body,
          )
        ],
      ),
    );
  }
}
