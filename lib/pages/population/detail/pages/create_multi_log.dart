import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:namer_app/component/button/outline_button.dart';
import 'package:namer_app/component/detail_accordion.dart';
import 'package:namer_app/component/button/plusbutton.dart';
import 'package:namer_app/component/toast.dart';
import 'package:namer_app/pages/population/detail/controller.dart';
import 'package:namer_app/pages/table/table.dart';

class CreateMultiLog extends StatelessWidget {
  final PopulationDetailController controller =
      Get.put(PopulationDetailController());

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
              Container(),
              Container(
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1.50, color: Color(0xFF148FEF)),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: ButtonWidget('완료', () {
                    ToastWidget('결재문서 매핑이 완료되었습니다.').green();
                    controller.pageName.value = "multi_complete";
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
                    '로그 합치기',
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
              DetailAccordion(
                title: "Log",
                contentWidget: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total: 2'),
                        Row(children: [
                          PlusButtonWidget(onPressed: () {
                            controller.pageName.value = "select";
                          }),
                        ])
                      ],
                    ),
                    TablePage(),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              DetailAccordion(
                title: "결재문서",
                contentWidget: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total: 2'),
                        Row(children: [
                          ButtonWidget('결재문서 수정', () {
                            controller.pageName.value = "srdocList";
                          }).blue(),
                        ])
                      ],
                    ),
                    TablePage(),
                  ],
                ),
              ),
            ],
          ),
          // content 영역
        )
      ],
    );
  }
}
