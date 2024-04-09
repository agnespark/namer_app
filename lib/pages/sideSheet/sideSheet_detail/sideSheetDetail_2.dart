import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:namer_app/pages/sideSheet/detailContainer.dart';
import 'package:namer_app/pages/sideSheet/sideSheet_detail/sideSheetDetail_1.dart';

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
                  controller
                      .changeDetailPage(Container(child: SideSheetDetail1()));
                },
                child: Text('NextPage'))
          ],
        ));
  }
}
