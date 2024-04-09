import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:namer_app/config/color.dart';
import 'package:namer_app/config/themes.dart';

class ToastWidget {
  ToastWidget(this.text);
  final String text;

  Widget(Color color) {
    Get.snackbar(
      text, "",
      titleText: Text(
        text,
        textAlign: TextAlign.left,
        style:
            Themes.light.textTheme.titleMedium!.copyWith(color: Colors.white),
      ),
      messageText: SizedBox.shrink(),
      icon: Icon(
        Icons.info_outline_rounded,
        color: Colors.white,
      ),
      maxWidth: 480,
      snackPosition: SnackPosition.TOP,
      backgroundColor: color,
      // colorText: Colors.white, // 텍스트 색상
      duration: Duration(seconds: 3), // 스낵바가 표시되는 시간
      isDismissible: true, // 사용자가 스낵바를 스와이프하여 닫을 수 있는지 여부
      // dismissDirection: DismissDirection.horizontal, // 닫는 방향
      forwardAnimationCurve: Curves.easeOut, // 애니메이션
    );
  }

  blue() {
    Color color = primaryMain;
    Widget(color);
  }

  green() {
    Color color = greenMain;
    Widget(color);
  }

  red() {
    Color color = redMain;
    Widget(color);
  }
}
