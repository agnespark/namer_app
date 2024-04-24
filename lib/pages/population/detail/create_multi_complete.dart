import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:namer_app/component/detail_accordion.dart';
import 'package:namer_app/pages/population/detail/detail_controller.dart';
import 'package:namer_app/pages/table/table.dart';

class CreateMultiComplelet extends StatelessWidget {
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
            children: [],
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
                      children: [Text('Total: 2'), Row(children: [])],
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
                      children: [Text('Total: 2'), Row(children: [])],
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
