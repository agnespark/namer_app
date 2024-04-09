import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ToastWidget {
  ToastWidget(this.text);
  final String text;

  Widget(Color color) {
    Get.snackbar(
      text, "",
      titleText: Text(
        text,
        textAlign: TextAlign.left,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      messageText: SizedBox.shrink(),
      icon: const Icon(Icons.info_outline_rounded),
      maxWidth: 480,
      snackPosition: SnackPosition.TOP,
      backgroundColor: color,
      borderRadius: 4, // 스낵바의 모서리 둥글기
      colorText: Colors.white, // 텍스트 색상
      duration: Duration(seconds: 3), // 스낵바가 표시되는 시간
      isDismissible: true, // 사용자가 스낵바를 스와이프하여 닫을 수 있는지 여부
      dismissDirection: DismissDirection.horizontal, // 닫는 방향
      forwardAnimationCurve: Curves.easeOut, // 애니메이션
    );
  }

  info() {
    Color color = Colors.blueAccent;
    Widget(color);
  }

  success() {
    Color color = Colors.greenAccent;
    Widget(color);
  }

  error() {
    Color color = Colors.redAccent;
    Widget(color);
  }
}
