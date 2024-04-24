import 'package:get/get.dart';

class DropdownController extends GetxController {
  static DropdownController get to => Get.find<DropdownController>();

  Rx<String> dropdownValue = "10개".obs;

  void changeValue(String? value) {
    if (value != null) {
      dropdownValue.value = value;
    }
  }
}
