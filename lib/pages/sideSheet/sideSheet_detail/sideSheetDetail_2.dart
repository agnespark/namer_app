import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:namer_app/controller/detailContainer.dart';

class SideSheetDetail2 extends StatelessWidget {
  final DetailController controller = Get.put(DetailController());

  @override
  Widget build(BuildContext context) {
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
                  controller.changeDetailPage("");
                },
                child: Text('NextPage'))
          ],
        ));
  }
}
