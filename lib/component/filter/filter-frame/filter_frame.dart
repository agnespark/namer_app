import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:namer_app/config/color.dart';

class FilterFrame extends StatelessWidget {
  final List<Widget> body;
  final List<Widget>? button;
  FilterFrame({Key? key, required this.body, this.button});

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
                  itemCount: body.length,
                  separatorBuilder: (context, index) => SizedBox(height: 8),
                  itemBuilder: (context, index) => body[index],
                ),
                if (button != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: List.generate(
                        button!.length,
                        (index) {
                          return index == button!.length - 1
                              ? button![index]
                              : Row(
                                  children: [
                                    button![index],
                                    SizedBox(width: 8),
                                  ],
                                );
                        },
                      ),
                    ),
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
