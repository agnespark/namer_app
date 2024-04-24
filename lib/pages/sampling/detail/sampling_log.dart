import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:namer_app/component/button/outline_button.dart';
import 'package:namer_app/component/detail_accordion.dart';
import 'package:namer_app/component/filter/filter-row/filter_row.dart';
import 'package:namer_app/component/textfield/basic-textfield.dart';
import 'package:namer_app/component/toast.dart';
import 'package:namer_app/pages/sampling/detail/controller.dart';
import 'package:namer_app/pages/table/table.dart';

class SamplingLogDetail extends StatelessWidget {
  final bool isBtn;
  final SamplingDetailController controller =
      Get.put(SamplingDetailController());

  SamplingLogDetail({this.isBtn = true});
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          padding: EdgeInsets.all(8),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: isBtn
                  ? [
                      // 버튼 변경될 내용
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                              onPressed: () {
                                Get.back();
                              },
                              icon: Icon(Icons.arrow_circle_up_rounded),
                              iconSize: 24,
                              constraints:
                                  BoxConstraints(minHeight: 24, minWidth: 24),
                              padding: EdgeInsets.zero,
                            ),
                            IconButton(
                              onPressed: () {
                                Get.back();
                              },
                              icon: Icon(Icons.arrow_circle_down_rounded),
                              iconSize: 24,
                              constraints:
                                  BoxConstraints(minHeight: 24, minWidth: 24),
                              padding: EdgeInsets.zero,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 1.50, color: Color(0xFF148FEF)),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: ButtonWidget("완료", () {
                          ToastWidget("성공했습니다.").blue();
                        }).blue(),
                      )
                    ]
                  : []),
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
                    'Detail',
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
              Column(
                children: [
                  SizedBox(height: 8),
                  FilterRow(
                    title: 'DateTime',
                    child: BasicTextField(hintText: "-"),
                  ),
                  SizedBox(height: 8),
                  FilterRow(
                    title: 'Server',
                    child: BasicTextField(hintText: "-"),
                  ),
                  SizedBox(height: 8),
                  FilterRow(
                    title: 'Type',
                    child: BasicTextField(hintText: "-"),
                  ),
                  SizedBox(height: 8),
                  FilterRow(
                    title: 'DB User',
                    child: BasicTextField(hintText: "-"),
                  ),
                  SizedBox(height: 8),
                  FilterRow(
                    title: 'IP',
                    child: BasicTextField(hintText: "-"),
                  ),
                  SizedBox(height: 8),
                  FilterRow(
                    title: 'Program',
                    child: BasicTextField(hintText: "-"),
                  ),
                  SizedBox(height: 8),
                  FilterRow(
                    title: 'Command',
                    child: BasicTextField(hintText: "-"),
                  ),
                  SizedBox(height: 8),
                  FilterRow(
                    title: 'Table',
                    child: BasicTextField(hintText: "-"),
                  ),
                  SizedBox(height: 8),
                  FilterRow(
                    title: 'Log Count',
                    child: BasicTextField(hintText: "-"),
                  ),
                  SizedBox(height: 8),
                ],
              ),
              SizedBox(height: 16),
              Divider(
                height: 1,
                color: Colors.black12,
              ),
              SizedBox(height: 16),
              FilterRow(
                title: 'Content',
                child: BasicTextField(hintText: "-"),
              ),
              SizedBox(height: 16),
              Divider(
                height: 1,
                color: Colors.black12,
              ),
              SizedBox(height: 16),
              // table이 들어감
              DetailAccordion(
                title: "결재문서",
                contentWidget: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total: 2'),
                        Row(
                            children: isBtn
                                ? [
                                    ButtonWidget('결재문서 수정', () {}).blue(),
                                  ]
                                : [])
                      ],
                    ),
                    TablePage(),
                  ],
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
          // content 영역
        )
      ],
    );
  }
}

// Get.snackbar("안녕", "ㅇㅇㅇㅇ");
// 클릭 시 다이얼로그 띄우기
