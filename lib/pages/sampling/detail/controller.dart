import 'package:get/get.dart';

class SamplingDetailController extends GetxController {
  RxString pageName = "loading".obs;

  void changeDetailPage(String? name) {
    if (name != null) {
      pageName.value = name;
    }
  }
}
