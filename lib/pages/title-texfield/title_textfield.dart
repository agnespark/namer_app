import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:namer_app/config/themes.dart';

class TitleTextField extends StatelessWidget {
  final RxString title;
  final Widget body;
  TitleTextField({super.key, required this.title, required this.body});

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
                    title.value,
                    style: Themes.light.textTheme.headlineLarge,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: body,
          )
        ],
      ),
    );
  }
}
