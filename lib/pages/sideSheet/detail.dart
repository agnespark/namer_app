// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:namer_app/pages/sideSheet/detailContainer.dart';

class DetailWidget extends StatelessWidget {
  DetailWidget({super.key});

  final DetailController controller = Get.put(DetailController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.pageIndex.value == "detail_2_page") {
        return detailWidget1();
      } else {
        return detailWidget2();
      }
    });
  }

  Widget detailWidget1() {
    return Container(
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                Get.back(result: controller.textController.text);
              },
              icon: Icon(Icons.close),
            ),
            Text('Body'),
            Text(''),
            ElevatedButton(
                onPressed: () {
                  controller.changeDetailPage('detail_2_page');
                },
                child: Text('NextPage'))
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
