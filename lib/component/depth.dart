import 'package:flutter/material.dart';

class DepthWidget {
  DepthWidget(this.title);
  final String title;

  Widget buildWidget() {
    List<String> depths = title.split('/');
    List<Widget> widgets = []; // 위젯을 담을 리스트를 선언합니다.

    for (var title in depths) {
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
