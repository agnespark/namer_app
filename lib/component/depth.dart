import 'package:flutter/material.dart';

class DepthWidget {
  DepthWidget(this.title);
  final String title;

  Widget buildWidget() {
    List<String> depths = title.split('/');
    List<Widget> widgets = []; // 위젯을 담을 리스트를 선언합니다.

    for (var title in depths) {
      // 마지막 요소에만 특별한 스타일을 적용합니다.
      // TextStyle? textStyle = (i == depths.length - 1)
      //     ? TextStyle(color: Colors.lightBlueAccent)
      //     : null;

      // 각 요소를 위젯 리스트에 추가합니다.
      widgets.add(
        Text(
          depths.last == title ? title : '$title / ',
          style: TextStyle(
              color: depths.last == title ? Colors.lightBlueAccent : null),
        ),
      );
    }

    return Row(children: widgets);
  }
}
