import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:namer_app/config/color.dart';

class DetailAccordion extends StatelessWidget {
  final String title;
  final Widget contentWidget;
  const DetailAccordion(
      {Key? key, required this.title, required this.contentWidget});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        border: Border.all(color: grayLight), // 왼쪽 오른쪽 border 추가
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          listTileTheme: ListTileTheme.of(context)
              .copyWith(dense: true, minVerticalPadding: 1),
        ),
        child: Column(
          children: [
            Container(
              color: grayLight,
              padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: contentWidget,
            )
          ],
        ),
      ),
    );
  }
}
