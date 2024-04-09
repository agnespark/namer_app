import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:namer_app/pages/sideSheet/detailContainer.dart';
import 'package:namer_app/pages/sideSheet/sideSheet_detail/sideSheetDetail_2.dart';

class SideSheetDetail1 extends StatelessWidget {
  final DetailController controller = Get.put(DetailController());

  @override
  Widget build(BuildContext context) {
    // Get.put(DetailController());
    return Container(
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.close),
            ),
            Text('Body'),
            Text(''),
            ElevatedButton(
                onPressed: () {
                  print(1);
                  controller
                      .changeDetailPage(Container(child: SideSheetDetail2()));
                },
                child: Text('NextPage'))
          ],
        ));
  }
}
