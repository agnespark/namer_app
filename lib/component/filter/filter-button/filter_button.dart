import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FilterButton extends StatelessWidget {
  final List<Widget> children;
  FilterButton({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 28,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(
          children.length,
          (index) {
            return index == children.length - 1
                ? children[index]
                : Row(
                    children: [
                      children[index],
                      SizedBox(width: 8),
                    ],
                  );
          },
        ),
      ),
    );
  }
}
