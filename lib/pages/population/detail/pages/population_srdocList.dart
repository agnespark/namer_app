import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:namer_app/component/button/outline_button.dart';
import 'package:namer_app/component/filter/filter-button/filter_button.dart';
import 'package:namer_app/component/filter/filter-frame/filter_frame.dart';
import 'package:namer_app/component/filter/filter-row/filter_row.dart';
import 'package:namer_app/component/textfield/basic_textfield.dart';
import 'package:namer_app/pages/population/detail/controller.dart';
import 'package:namer_app/pages/button/button_controller.dart';
import 'package:namer_app/pages/new_datetime/newdatetime.dart';

class PopulationSrdocList extends StatelessWidget {
  final bool isLog;

  PopulationSrdocList({this.isLog = true});
  final PopulationDetailController controller =
      Get.put(PopulationDetailController());
  final ButtonController btn_controller = Get.put(ButtonController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 버튼 변경될 내용
              Container(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  IconButton(
                    onPressed: () {
                      controller.pageName.value = "multi_create";
                    },
                    icon: Icon(Icons.arrow_back_ios),
                    iconSize: 24,
                    constraints: BoxConstraints(minHeight: 24, minWidth: 24),
                    padding: EdgeInsets.zero,
                  ),
                ]),
              ),
              Container(
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1.50, color: Color(0xFF148FEF)),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: ButtonWidget('완료', () {
                    isLog
                        ? controller.pageName.value = "multi_create"
                        : controller.pageName.value = "";
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
                    '결재문서 선택',
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
          child: FilterFrame(
            children: [
              FilterRow(
                title: "DateTime",
                child: NewDateTimePage(),
              ),
              FilterRow(
                title: 'Search',
                child: BasicTextField(),
              ),
              FilterButton(children: [
                ButtonWidget("초기화", () {}).blue(),
                ButtonWidget("조회", () {}).blue(),
              ])
            ],
          ),
          // content 영역
        ),
      ],
    );
  }
}

// Get.snackbar("안녕", "ㅇㅇㅇㅇ");
// 클릭 시 다이얼로그 띄우기
