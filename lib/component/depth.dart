import 'package:flutter/material.dart';

class DepthWidget {
  DepthWidget(this.title);
  final String title;

  Widget buildWidget() {
    List<String> depths = title.split('/');
    List<Widget> widgets = []; // 위젯을 담을 리스트를 선언합니다.

    for (int i = 0; i < depths.length; i++) {
      // 마지막 요소에만 특별한 스타일을 적용합니다.
      TextStyle? textStyle = (i == depths.length - 1)
          ? TextStyle(color: Colors.lightBlueAccent)
          : null;

      // 각 요소를 위젯 리스트에 추가합니다.
      widgets.add(
        Padding(
          padding: EdgeInsets.only(right: 8.0),
          child: Text(
            depths[i],
            style: textStyle,
          ),
        ),
      );

      // 마지막 요소가 아니면, '/'를 추가합니다.
      if (i < depths.length - 1) {
        widgets.add(Text(' /  '));
      }
    }

    return Row(children: widgets);
  }
}
