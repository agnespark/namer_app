import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:namer_app/component/checkbox/radio.dart';
import 'package:namer_app/config/color.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:namer_app/pages/new_datetime/newdatetime_controller.dart';

class NewDateTimePage extends StatelessWidget {
  final NewDateTimeController controller = Get.put(NewDateTimeController());

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildDateTimeContainer(
            controller.selectedStartDateTime,
            controller.startDateTimeTextController,
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
            controller.endDateTimeTextController,
            false,
            context,
          ),
        ),
        RadioPage(
          radioList: controller.radioList,
          selectedRadio: controller.selectedRadio,
        ),
        const Spacer(),
      ],
    );
  }

  Widget _buildDateTimeContainer(
      Rx<DateTime?> selectedDateTime,
      TextEditingController textEditingController,
      bool isStartTime,
      BuildContext context) {
    textEditingController.text =
        controller.getFormattedDateTime(selectedDateTime);

    return Container(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: textEditingController,
        decoration: InputDecoration(
          fillColor: Colors.red,
          filled: true,
          isDense: true,
          hintText: 'YYYY-MM-DD hh:mm:ss',
          suffixIcon: IconButton(
            icon: Icon(
              Icons.calendar_today_outlined,
              color: borderColor,
            ),
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            onPressed: () {
              controller.isStart.value = isStartTime;
              _showDateTimeDialog(context, isStartTime);
            },
          ),
        ),
      ),
    );
  }

  void _showDateTimeDialog(BuildContext context, bool isStartTime) {
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
                  child: _setDatePickerValue(isStartTime),
                ),
                const SizedBox(width: 16),
                Expanded(
                  flex: 1,
                  child: _setTimePickerValue(isStartTime),
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
                controller.updateSelectedDateTime(isStartTime);
                Navigator.of(context).pop();
              },
              child: Text('확인'),
            ),
          ],
        );
      },
    );
  }

  Widget _setDatePickerValue(bool isStartTime) {
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

  Widget _setTimePickerValue(bool isStartTime) {
    final selectedHour =
        isStartTime ? controller.selectedStartHour : controller.selectedEndHour;
    final selectedMinute = isStartTime
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
                                selectedHour.value = hour;
                              },
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<CircleBorder>(
                                  CircleBorder(),
                                ),
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                                    return selectedHour.value == hour
                                        ? primaryMain
                                        : Colors.transparent;
                                  },
                                ),
                              ),
                              child: Text(
                                '$hour',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: selectedHour.value == hour
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
                                selectedMinute.value = minute;
                              },
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<CircleBorder>(
                                  CircleBorder(),
                                ),
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                                    return selectedMinute.value == minute
                                        ? primaryMain
                                        : Colors.transparent;
                                  },
                                ),
                              ),
                              child: Text(
                                '$minute',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: selectedMinute.value == minute
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
}
