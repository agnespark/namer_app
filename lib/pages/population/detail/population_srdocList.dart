import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:namer_app/component/button.dart';
import 'package:namer_app/component/detail_sheet.dart';
import 'package:namer_app/component/filter/filter-frame/filter_frame.dart';
import 'package:namer_app/component/filter/filter-row/filter_row.dart';
import 'package:namer_app/component/textfield/basic-textfield.dart';
import 'package:namer_app/component/toast.dart';
import 'package:namer_app/pages/button/button_controller.dart';
import 'package:namer_app/pages/new_datetime/newdatetime.dart';
import 'package:namer_app/pages/sampling/detail/sampling_log.dart';
import 'package:namer_app/pages/sampling/detail/sampling_sr.dart';

class PopulationSrdocList extends StatelessWidget {
  final bool isLog;

  PopulationSrdocList({this.isLog = true});
  final ButtonController btn_controller = Get.put(ButtonController());

  @override
  Widget build(BuildContext context) {
    return Row(
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
                      // controller.goBack()
                      isLog
                          ? DetailSheet(child: SamplingLogDetail())
                          : DetailSheet(child: SamplingSrDetail());
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
                        ? DetailSheet(child: SamplingLogDetail())
                        : DetailSheet(child: SamplingSrDetail());
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
          child: Column(
            children: [
              FilterFrame(body: [
                FilterRow(
                  title: "DateTime",
                  body: NewDateTimePage(),
                ),
                FilterRow(
                  title: 'Search',
                  body: BasicTextField(),
                ),
              ], button: [
                ButtonWidget("text", () {
                  ToastWidget("에러가 발생했습니다.").red();
                }).red(),
                ButtonWidget("text", () {
                  ToastWidget("성공했습니다.").blue();
                }).blue(),
                ButtonWidget("text", () {
                  ToastWidget("다시 시도해주세요.").green();
                }).green(),
              ]),
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
