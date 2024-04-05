import 'package:get/get.dart';

class NewDateTimeController extends GetxController {
  RxInt selectedHour = 0.obs;
  RxInt selectedMinute = 0.obs;
  RxInt tempSelectedHour = 0.obs;
  RxInt tempSelectedMinute = 0.obs;
  Rx<DateTime?> selectedDateTime = DateTime.now().obs;

  RxList<DateTime?> singleDatePickerValueWithDefaultValue = [
    DateTime.now(),
  ].obs;

  @override
  void onInit() {
    super.onInit();
    DateTime now = DateTime.now();
    selectedHour.value = now.hour;
    selectedMinute.value = now.minute;
    tempSelectedHour.value = now.hour;
    tempSelectedMinute.value = now.minute;
  }
}
