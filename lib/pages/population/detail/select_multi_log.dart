import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:namer_app/component/button/outline_button.dart';
import 'package:namer_app/component/textfield/basic-textfield.dart';
import 'package:namer_app/controller/detailContainer.dart';

class SelectMultiLog extends StatelessWidget {
  final DetailController controller = Get.put(DetailController());

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          padding: EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 버튼 변경될 내용
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        // 처음 들어갔을때 , 수정으로 들어갔을 때 경로가 다름
                        // Get.back();
                        controller.pageName.value = "multi_create";
                      },
                      icon: Icon(Icons.arrow_back_ios),
                      iconSize: 24,
                      constraints: BoxConstraints(minHeight: 24, minWidth: 24),
                      padding: EdgeInsets.zero,
                    ),
                  ],
                ),
              ),
              Container(
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1.50, color: Color(0xFF148FEF)),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: ButtonWidget('완료', () {
                    controller.pageName.value = "multi_create";
                  }).blue()),
            ],
          ),
        ),
        SizedBox(height: 16),
        Container(
            width: Get.width,
            padding: const EdgeInsets.only(
              top: 48,
              left: 56,
              right: 56,
              bottom: 8,
            ),
            child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    //title 변경
                    '선택 범위 입력',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontFamily: 'Noto Sans KR',
                    ),
                  ),
                ])),
        SizedBox(height: 16),
        Container(
          width: Get.width,
          padding: const EdgeInsets.only(
            left: 56,
            right: 56,
          ),
          child: Column(
            children: [
              BasicTextField(hintText: "2, 4, 6, 8-12, 14-23"),
            ],
          ),
          // content 영역
        )
      ],
    );
  }
}
