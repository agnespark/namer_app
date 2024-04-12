import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:namer_app/config/color.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:namer_app/pages/new_datetime/newdatetime_controller.dart';

class NewDateTimePage extends StatefulWidget {
  NewDateTimePage({Key? key}) : super(key: key);

  @override
  State<NewDateTimePage> createState() => _NewDateTimePageState();
}

class _NewDateTimePageState extends State<NewDateTimePage> {
  final NewDateTimeController controller = Get.put(NewDateTimeController());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          // StartTime Container
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: borderColor),
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Obx(
                        () => Text(
                          _getStartValueText(
                            CalendarDatePicker2Type.single,
                            controller.startDefaultValue,
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.calendar_today_outlined,
                        color: borderColor,
                      ),
                      onPressed: () {
                        controller.isStart.value = true;
                        _showStartTimeDialog(context);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(width: 10),
          Text("-"),
          const SizedBox(width: 10),
          // EndTime Container
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: borderColor),
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Obx(
                        () => Text(
                          _getEndValueText(
                            CalendarDatePicker2Type.single,
                            controller.endDefaultValue,
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.calendar_today_outlined,
                        color: borderColor,
                      ),
                      onPressed: () {
                        controller.isStart.value = false;
                        _showEndTimeDialog(context);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _getStartValueText(
    CalendarDatePicker2Type datePickerType,
    List<DateTime?> values,
  ) {
    values =
        values.map((e) => e != null ? DateUtils.dateOnly(e) : null).toList();
    var valueText = (values.isNotEmpty ? values[0] : null)
        .toString()
        .replaceAll('00:00:00.000', '');

    // Add selected time to the displayed text
    valueText +=
        ' ${controller.selectedStartHour.value.toString().padLeft(2, '0')}:'
        '${controller.selectedStartMinute.value.toString().padLeft(2, '0')}';

    return valueText;
  }

  String _getEndValueText(
    CalendarDatePicker2Type datePickerType,
    List<DateTime?> values,
  ) {
    values =
        values.map((e) => e != null ? DateUtils.dateOnly(e) : null).toList();
    var valueText = (values.isNotEmpty ? values[0] : null)
        .toString()
        .replaceAll('00:00:00.000', '');

    // Add selected time to the displayed text
    valueText +=
        ' ${controller.selectedEndHour.value.toString().padLeft(2, '0')}:'
        '${controller.selectedEndMinute.value.toString().padLeft(2, '0')}';

    return valueText;
  }

  void _showStartTimeDialog(BuildContext context) {
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
                  child: _buildDefaultSingleDatePickerWithValue(),
                ),
                const SizedBox(width: 16),
                Expanded(
                  flex: 1,
                  child: _setTimeNumberValue(),
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
                controller.selectedStartHour.value =
                    controller.tempSelectedStartHour.value;
                controller.selectedStartMinute.value =
                    controller.tempSelectedStartMinute.value;
                controller.startDefaultValue.value = [
                  controller.selectedStartDateTime.value
                ].map((dateTime) => dateTime!).toList();
                Navigator.of(context).pop();
              },
              child: Text('확인'),
            ),
          ],
        );
      },
    );
  }

  void _showEndTimeDialog(BuildContext context) {
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
                  child: _buildDefaultSingleDatePickerWithValue(),
                ),
                const SizedBox(width: 16),
                Expanded(
                  flex: 1,
                  child: _setTimeNumberValue(),
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
                controller.selectedEndHour.value =
                    controller.tempSelectedEndHour.value;
                controller.selectedEndMinute.value =
                    controller.tempSelectedEndMinute.value;
                controller.endDefaultValue.value = [
                  controller.selectedEndDateTime.value
                ].map((dateTime) => dateTime!).toList();
                Navigator.of(context).pop();
              },
              child: Text('확인'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildDefaultSingleDatePickerWithValue() {
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
            value: controller.isStart.value
                ? controller.startDefaultValue
                    .map((dateTime) => dateTime!)
                    .toList()
                : controller.endDefaultValue
                    .map((dateTime) => dateTime!)
                    .toList(),
            onValueChanged: (dates) => controller.isStart.value
                ? controller.selectedStartDateTime.value =
                    dates.first ?? DateTime.now()
                : controller.selectedEndDateTime.value =
                    dates.first ?? DateTime.now(),
          ),
        ],
      ),
    );
  }

  Widget _setTimeNumberValue() {
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
                                if (controller.isStart.value) {
                                  controller.tempSelectedStartHour.value = hour;
                                } else {
                                  controller.tempSelectedEndHour.value = hour;
                                }
                              },
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<CircleBorder>(
                                  CircleBorder(),
                                ),
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                                    if (controller.isStart.value &&
                                        controller
                                                .tempSelectedStartHour.value ==
                                            hour) {
                                      return primaryMain;
                                    } else if (!controller.isStart.value &&
                                        controller.tempSelectedEndHour.value ==
                                            hour) {
                                      return primaryMain;
                                    }
                                    return Colors.transparent;
                                  },
                                ),
                              ),
                              child: Text(
                                '$hour',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: controller.isStart.value
                                      ? (controller.tempSelectedStartHour
                                                  .value ==
                                              hour
                                          ? Colors.white
                                          : blackTextColor)
                                      : (controller.tempSelectedEndHour.value ==
                                              hour
                                          ? Colors.white
                                          : blackTextColor),
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
                                if (controller.isStart.value) {
                                  controller.tempSelectedStartMinute.value =
                                      minute;
                                } else {
                                  controller.tempSelectedEndMinute.value =
                                      minute;
                                }
                              },
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<CircleBorder>(
                                  CircleBorder(),
                                ),
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                                    if (controller.isStart.value &&
                                        controller.tempSelectedStartMinute
                                                .value ==
                                            minute) {
                                      return primaryMain;
                                    } else if (!controller.isStart.value &&
                                        controller
                                                .tempSelectedEndMinute.value ==
                                            minute) {
                                      return primaryMain;
                                    }
                                    return Colors.transparent;
                                  },
                                ),
                              ),
                              child: Text(
                                '$minute',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: controller.isStart.value
                                      ? (controller.tempSelectedStartMinute
                                                  .value ==
                                              minute
                                          ? Colors.white
                                          : blackTextColor)
                                      : (controller.tempSelectedEndMinute
                                                  .value ==
                                              minute
                                          ? Colors.white
                                          : blackTextColor),
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
}
