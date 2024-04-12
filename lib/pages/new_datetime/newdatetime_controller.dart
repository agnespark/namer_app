import 'package:get/get.dart';

class NewDateTimeController extends GetxController {
  RxInt selectedStartHour = 0.obs;
  RxInt selectedStartMinute = 0.obs;
  RxInt tempSelectedStartHour = 0.obs;
  RxInt tempSelectedStartMinute = 0.obs;
  Rx<DateTime?> selectedStartDateTime = DateTime.now().obs;

  RxInt selectedEndHour = 0.obs;
  RxInt selectedEndMinute = 0.obs;
  RxInt tempSelectedEndHour = 0.obs;
  RxInt tempSelectedEndMinute = 0.obs;
  Rx<DateTime?> selectedEndDateTime = DateTime.now().obs;

  RxList<DateTime?> startDefaultValue = [
    DateTime.now(),
  ].obs;
  RxList<DateTime?> endDefaultValue = [
    DateTime.now().add(Duration(days: 7)),
  ].obs;

  @override
  void onInit() {
    super.onInit();
    DateTime now = DateTime.now();
    selectedStartHour.value = now.hour;
    selectedStartMinute.value = now.minute;
    tempSelectedStartHour.value = now.hour;
    tempSelectedStartMinute.value = now.minute;

    selectedEndHour.value = now.hour;
    selectedEndMinute.value = now.minute;
    tempSelectedEndHour.value = now.hour;
    tempSelectedEndMinute.value = now.minute;
  }
}
