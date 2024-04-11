// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:namer_app/pages/sideSheet/detailContainer.dart';

class DetailWidget extends StatelessWidget {
  DetailWidget({super.key});

  final DetailController controller = Get.put(DetailController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Obx(() {
        if (controller.pageIndex.value == "detail_1_page") {
          return detailWidget1();
        } else {
          return detailWidget2();
        }
      }),
    );
  }

  Widget detailWidget1() {
    return Container(
        alignment: Alignment.topCenter,
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // 버튼 변경될 내용
                  Container(
                    child: Stack(children: [
                      IconButton(
                        onPressed: () {
                          Get.back(result: controller.textController.text);
                        },
                        icon: Icon(Icons.close),
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
                    child: TextButton(
                      child: Text('완료'),
                      onPressed: () {},
                    ),
                  ),
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
                        'title',
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
              child:
                  // content 영역
                  ElevatedButton(
                      onPressed: () {
                        controller.changeDetailPage('detail_2_page');
                      },
                      child: Text('NextPage')),
            )
          ],
        ));
  }

  Widget detailWidget2() {
    return Container(
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                controller.changeDetailPage("detail_1_page");
              },
              icon: Icon(Icons.close),
            ),
            Text('Body'),
            TextField(
              controller: controller.textController,
            ),
            ElevatedButton(onPressed: () {}, child: Text('입력')),
          ],
        ));
  }
}
