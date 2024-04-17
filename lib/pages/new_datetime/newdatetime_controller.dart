import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class NewDateTimeController extends GetxController {
  final TextEditingController startDateTimeTextController =
      TextEditingController();
  final TextEditingController endDateTimeTextController =
      TextEditingController();

  RxInt selectedStartHour = 0.obs;
  RxInt selectedStartMinute = 0.obs;
  Rx<DateTime?> selectedStartDateTime = Rx<DateTime?>(null);

  RxInt selectedEndHour = 0.obs;
  RxInt selectedEndMinute = 0.obs;
  Rx<DateTime?> selectedEndDateTime = Rx<DateTime?>(null);

  RxBool isStart = true.obs;

  RxList<String> radioList = RxList<String>([
    "오름차순",
    "내림차순",
  ]);
  RxString selectedRadio = RxString("");

  @override
  void onInit() {
    super.onInit();
    selectedRadio.value = radioList[0];

    DateTime now = DateTime.now();

    selectedStartHour.value = now.hour;
    selectedStartMinute.value = now.minute;
    selectedStartDateTime.value = now;

    selectedEndHour.value = now.hour;
    selectedEndMinute.value = now.minute;
    selectedEndDateTime.value = now.add(Duration(days: 7));
  }

  void updateSelectedDateTime(bool isStartTime) {
    if (isStartTime) {
      selectedStartDateTime.value = DateTime(
        selectedStartDateTime.value!.year,
        selectedStartDateTime.value!.month,
        selectedStartDateTime.value!.day,
        selectedStartHour.value,
        selectedStartMinute.value,
      );
      startDateTimeTextController.text = getFormattedDateTime(
        selectedStartDateTime,
      );
    } else {
      selectedEndDateTime.value = DateTime(
        selectedEndDateTime.value!.year,
        selectedEndDateTime.value!.month,
        selectedEndDateTime.value!.day,
        selectedEndHour.value,
        selectedEndMinute.value,
      );
      endDateTimeTextController.text = getFormattedDateTime(
        selectedEndDateTime,
      );
    }
  }

  String getFormattedDateTime(
    Rx<DateTime?> selectedDateTime,
  ) {
    final selectedDate = selectedDateTime.value ?? DateTime.now();
    final formattedDateTime =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(selectedDate);

    return formattedDateTime;
  }
}
