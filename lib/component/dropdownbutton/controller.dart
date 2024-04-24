import 'package:get/get.dart';

class DropdownController extends GetxController {
  static DropdownController get to => Get.find<DropdownController>();

  Rx<String> dropdownValue = "".obs;

  void changeValue(String? value) {
    if (value != null) {
      dropdownValue.value = value;
    }
  }
}
