import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:namer_app/component/checkbox/radio.dart';
import 'package:namer_app/config/color.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:namer_app/pages/new_datetime/newdatetime_controller.dart';

class NewDateTimePage extends StatelessWidget {
  final NewDateTimeController controller = Get.put(NewDateTimeController());
  final TextEditingController startDateTimeTextController =
      TextEditingController();
  final TextEditingController endDateTimeTextController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildDateTimeContainer(
            controller.selectedStartDateTime,
            controller.selectedStartHour,
            controller.selectedStartMinute,
            controller.selectedStartHour,
            controller.selectedStartMinute,
            true,
            context,
          ),
        ),
        const SizedBox(width: 10),
        Text("-"),
        const SizedBox(width: 10),
        Expanded(
          child: _buildDateTimeContainer(
            controller.selectedEndDateTime,
            controller.selectedEndHour,
            controller.selectedEndMinute,
            controller.selectedEndHour,
            controller.selectedEndMinute,
            false,
            context,
          ),
        ),
        Obx(
          () => RadioPage(
            radioList: [controller.asc.value, controller.desc.value],
            selectedRadio: controller.asc,
          ),
        ),
      ],
    );
  }

  Widget _buildDateTimeContainer(
      Rx<DateTime?> selectedDateTime,
      RxInt selectedHour,
      RxInt selectedMinute,
      RxInt tempSelectedHour,
      RxInt tempSelectedMinute,
      bool isStartTime,
      BuildContext context) {
    if (isStartTime) {
      startDateTimeTextController.text = _getValueText(selectedDateTime);
    } else {
      endDateTimeTextController.text = _getValueText(selectedDateTime);
    }

    return Container(
      width: 300,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: isStartTime
                    ? startDateTimeTextController
                    : endDateTimeTextController,
                onTap: () {},
                decoration: InputDecoration(
                  hintText: 'YYYY-MM-DD hh:mm:ss',
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.calendar_today_outlined,
                      color: borderColor,
                    ),
                    onPressed: () {
                      controller.isStart.value = isStartTime;
                      _showTimeDialog(context, isStartTime);
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getValueText(
    Rx<DateTime?> selectedDateTime,
  ) {
    final selectedDate = selectedDateTime.value ?? DateTime.now();
    final formattedDateTime =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(selectedDate);

    return formattedDateTime;
  }

  void _showTimeDialog(BuildContext context, bool isStartTime) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(16),
          content: Container(
            width: 500,
            height: 350,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: _buildDefaultSingleDatePickerWithValue(isStartTime),
                ),
                const SizedBox(width: 16),
                Expanded(
                  flex: 1,
                  child: _setTimeNumberValue(isStartTime),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('취소'),
            ),
            TextButton(
              onPressed: () {
                _updateSelectedTime(isStartTime);
                Navigator.of(context).pop();
              },
              child: Text('확인'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildDefaultSingleDatePickerWithValue(bool isStartTime) {
    final config = CalendarDatePicker2Config(
      selectedDayHighlightColor: primaryMain,
      weekdayLabels: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
      weekdayLabelTextStyle: TextStyle(
        fontSize: 14,
        color: blackTextColor,
      ),
      firstDayOfWeek: 1,
      controlsHeight: 50,
      controlsTextStyle: TextStyle(
        fontSize: 14,
        color: blackTextColor,
      ),
      dayTextStyle: TextStyle(
        fontSize: 14,
        color: blackTextColor,
      ),
      disabledDayTextStyle: TextStyle(
        color: grayTextColor,
      ),
      selectableDayPredicate: (day) => true,
    );
    return Obx(
      () => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CalendarDatePicker2(
            config: config,
            value: isStartTime
                ? [controller.selectedStartDateTime.value]
                : [controller.selectedEndDateTime.value],
            onValueChanged: (dates) => isStartTime
                ? controller.selectedStartDateTime.value = dates.first
                : controller.selectedEndDateTime.value = dates.first,
          ),
        ],
      ),
    );
  }

  Widget _setTimeNumberValue(bool isStartTime) {
    final tempSelectedHour =
        isStartTime ? controller.selectedStartHour : controller.selectedEndHour;
    final tempSelectedMinute = isStartTime
        ? controller.selectedStartMinute
        : controller.selectedEndMinute;

    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 16, bottom: 8),
                child: Text(
                  'HOUR',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
              Divider(),
              Container(
                height: 270,
                child: Obx(
                  () => SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: List.generate(
                        24,
                        (index) {
                          final hour = index;
                          return SizedBox(
                            height: 38,
                            width: double.infinity,
                            child: TextButton(
                              onPressed: () {
                                tempSelectedHour.value = hour;
                              },
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<CircleBorder>(
                                  CircleBorder(),
                                ),
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                                    return tempSelectedHour.value == hour
                                        ? primaryMain
                                        : Colors.transparent;
                                  },
                                ),
                              ),
                              child: Text(
                                '$hour',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: tempSelectedHour.value == hour
                                      ? Colors.white
                                      : blackTextColor,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 16, bottom: 8),
                child: Text(
                  'MINUTE',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
              Divider(),
              Container(
                height: 270,
                child: Obx(
                  () => SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: List.generate(
                        60,
                        (index) {
                          final minute = index;
                          return SizedBox(
                            height: 38,
                            width: double.infinity,
                            child: TextButton(
                              onPressed: () {
                                tempSelectedMinute.value = minute;
                              },
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<CircleBorder>(
                                  CircleBorder(),
                                ),
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                                    return tempSelectedMinute.value == minute
                                        ? primaryMain
                                        : Colors.transparent;
                                  },
                                ),
                              ),
                              child: Text(
                                '$minute',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: tempSelectedMinute.value == minute
                                      ? Colors.white
                                      : blackTextColor,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _updateSelectedTime(bool isStartTime) {
    if (isStartTime) {
      controller.selectedStartDateTime.value = DateTime(
        controller.selectedStartDateTime.value!.year,
        controller.selectedStartDateTime.value!.month,
        controller.selectedStartDateTime.value!.day,
        controller.selectedStartHour.value,
        controller.selectedStartMinute.value,
      );
      startDateTimeTextController.text = _getValueText(
        controller.selectedStartDateTime,
      );
    } else {
      controller.selectedEndDateTime.value = DateTime(
        controller.selectedEndDateTime.value!.year,
        controller.selectedEndDateTime.value!.month,
        controller.selectedEndDateTime.value!.day,
        controller.selectedEndHour.value,
        controller.selectedEndMinute.value,
      );
      endDateTimeTextController.text = _getValueText(
        controller.selectedEndDateTime,
      );
    }
  }
}
