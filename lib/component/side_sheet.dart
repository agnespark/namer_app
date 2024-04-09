// 가변 : 제목 , contents, button 여부, 버튼 text, 버튼 갯수,
// 비가변 : 구성, width, height, padding,

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:side_sheet/side_sheet.dart';

class SideSheetWidget {
  SideSheetWidget(this.context);
  final BuildContext context;

  Widget(List<Color> buttonColor, List<String> buttonText) {
    SideSheet.right(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              width: Get.width,
              height: 48,
              padding: const EdgeInsets.all(8),
              child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.arrow_back),
                    Row(
                        children: buttonText
                            .map((text) => Row(
                                  children: [
                                    SizedBox(width: 8),
                                    OutlinedButton(
                                        onPressed: () {}, child: Text(text))
                                  ],
                                ))
                            .toList())
                  ]),
            ),
            const SizedBox(height: 16),
            Container(
              width: Get.width,
              height: 88,
              padding: const EdgeInsets.only(
                top: 48,
                left: 56,
                right: 56,
                bottom: 8,
              ),
              child: Text(
                '선택 범위 입력',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontFamily: 'Noto Sans KR',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              width: Get.width,
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 56),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '2, 4, 6, 8-12, 14-23',
                    style: TextStyle(
                      color: Color(0xFF838E9E),
                      fontSize: 16,
                      fontFamily: 'Noto Sans KR',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      context: context,
      width: Get.width * 0.6,
    );
  }

  //no button
  none() {
    Widget([], []);
  }

  // 완료버튼
  success() {
    List<Color> buttonColor = [Colors.primaries.first];
    List<String> buttonText = ['완료'];
    Widget(buttonColor, buttonText);
  }

  // 저장버튼
  save() {
    List<Color> buttonColor = [Colors.primaries.first];
    List<String> buttonText = ['저장'];
    Widget(buttonColor, buttonText);
  }

  // 버튼 2개 저장/삭제
  double_save_delete() {
    List<Color> buttonColor = [Colors.red, Colors.primaries.first];
    List<String> buttonText = ['저장', '삭제'];
    Widget(buttonColor, buttonText);
  }
}
