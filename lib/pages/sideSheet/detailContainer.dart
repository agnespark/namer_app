import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailController extends GetxController {
  RxString pageIndex = "detail_1_page".obs;
  Rx<Widget>? currentDetail;
  RxString text = "".obs;

  TextEditingController textController = TextEditingController();

  changeDetailPage(name) {
    pageIndex.value = name;
  }
}
