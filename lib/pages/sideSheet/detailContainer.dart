import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailController extends GetxController {
  RxString pageName = "population_post".obs;
  Rx<Widget>? currentDetail;
  RxString text = "".obs;

  TextEditingController textController = TextEditingController();

  changeDetailPage(String name) {
    pageName.value = name;
  }
}
