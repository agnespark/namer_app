import 'package:get/get.dart';

class NewDateTimeController extends GetxController {
  RxInt selectedStartHour = 0.obs;
  RxInt selectedStartMinute = 0.obs;
  Rx<DateTime?> selectedStartDateTime = Rx<DateTime?>(null);

  RxInt selectedEndHour = 0.obs;
  RxInt selectedEndMinute = 0.obs;
  Rx<DateTime?> selectedEndDateTime = Rx<DateTime?>(null);

  RxBool isStart = true.obs;

  RxString asc = "오름차순".obs;
  RxString desc = "내림차순".obs;

  @override
  void onInit() {
    super.onInit();
    DateTime now = DateTime.now();

    selectedStartHour.value = now.hour;
    selectedStartMinute.value = now.minute;
    selectedStartDateTime.value = now;

    selectedEndHour.value = now.hour;
    selectedEndMinute.value = now.minute;
    selectedEndDateTime.value = now.add(Duration(days: 7));
  }
}
