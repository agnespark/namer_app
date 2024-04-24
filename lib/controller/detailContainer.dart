import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailController extends GetxController {
  RxString pageName = "loading".obs;
  //???? 이걸 나눠야할지? 하나로 가야할지 하나로가면 좀 길어지고 가독성 문제가.
  Rx<Widget>? currentDetail;
  RxString text = "".obs;

  TextEditingController textController = TextEditingController();

  void changeDetailPage(String name) {
    pageName.value = name;
  }

  loadData() async {
    //interface data load
  }
}
