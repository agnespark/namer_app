import 'package:get/get.dart';

class NewDateTimeController extends GetxController {
  RxInt selectedStartHour = 0.obs;
  RxInt selectedStartMinute = 0.obs;
  RxInt tempSelectedStartHour = 0.obs;
  RxInt tempSelectedStartMinute = 0.obs;
  Rx<DateTime?> selectedStartDateTime = Rx<DateTime?>(null);

  RxInt selectedEndHour = 0.obs;
  RxInt selectedEndMinute = 0.obs;
  RxInt tempSelectedEndHour = 0.obs;
  RxInt tempSelectedEndMinute = 0.obs;
  Rx<DateTime?> selectedEndDateTime = Rx<DateTime?>(null);

  RxList<DateTime?> startDefaultValue = RxList();
  RxList<DateTime?> endDefaultValue = RxList();

  RxBool isStart = true.obs;

  RxString acs = "오름차순".obs;
  RxString decs = "내림차순".obs;

  @override
  void onInit() {
    super.onInit();
    DateTime now = DateTime.now();

    selectedStartHour.value = now.hour;
    selectedStartMinute.value = now.minute;
    tempSelectedStartHour.value = now.hour;
    tempSelectedStartMinute.value = now.minute;
    selectedStartDateTime.value = now;

    selectedEndHour.value = now.hour;
    selectedEndMinute.value = now.minute;
    tempSelectedEndHour.value = now.hour;
    tempSelectedEndMinute.value = now.minute;
    selectedEndDateTime.value = now;

    startDefaultValue.add(now);
    endDefaultValue.add(now.add(Duration(days: 7)));
  }
}
