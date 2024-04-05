import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:namer_app/pages/sideSheet/detailPageModel.dart';

class DetailController extends GetxController {
  RxInt pageIndex = 1.obs;
  // RxList detailList = RxList();
  // Rx<Widget> currentDetail = Container(child: detailWidget1()).obs;
  RxList<DetailPage> detailList =
      RxList<DetailPage>(); // RxList 타입을 명시적으로 선언합니다.
  Rx<Widget>? currentDetail;
  RxString text = "".obs;

  TextEditingController textController = TextEditingController();

  changeDetailPage(name) {
    pageIndex.value = name;
  }

  // changeDetailPage(widget) {
  //   currentDetail!.value = widget;
  // }
}
