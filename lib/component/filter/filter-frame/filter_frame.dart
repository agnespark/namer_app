import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:namer_app/config/color.dart';

class FilterFrame extends StatelessWidget {
  final List<Widget> children;
  FilterFrame({Key? key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 1,
                  color: borderColor,
                ),
              ),
            ),
            child: Column(
              children: [
                ListView.separated(
                  shrinkWrap: true,
                  itemCount: children.length,
                  separatorBuilder: (context, index) => SizedBox(height: 8),
                  itemBuilder: (context, index) => children[index],
                ),
              ],
            ),
          ),
        ),
        const Spacer(
          flex: 2,
        )
      ],
    );
  }
}
