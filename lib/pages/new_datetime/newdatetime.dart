import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(width: 10),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Obx(
                            () => Text(
                              _getValueText(
                                CalendarDatePicker2Type.single,
                                controller
                                    .singleDatePickerValueWithDefaultValue,
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.calendar_today),
                          onPressed: () => {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(''),
                                  content: Container(
                                    width: 500,
                                    height: 350,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Expanded(
                                          flex: 2,
                                          child:
                                              _buildDefaultSingleDatePickerWithValue(),
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
                                        controller.selectedHour.value =
                                            controller.tempSelectedHour.value;
                                        controller.selectedMinute.value =
                                            controller.tempSelectedMinute.value;
                                        controller
                                            .singleDatePickerValueWithDefaultValue
                                            .value = [
                                          controller.selectedDateTime.value
                                        ].map((dateTime) => dateTime!).toList();
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('확인'),
                                    ),
                                  ],
                                );
                              },
                            )
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getValueText(
    CalendarDatePicker2Type datePickerType,
    List<DateTime?> values,
  ) {
    values =
        values.map((e) => e != null ? DateUtils.dateOnly(e) : null).toList();
    var valueText = (values.isNotEmpty ? values[0] : null)
        .toString()
        .replaceAll('00:00:00.000', '');

    // Add selected time to the displayed text
    valueText += ' ${controller.selectedHour.value.toString().padLeft(2, '0')}:'
        '${controller.selectedMinute.value.toString().padLeft(2, '0')}';

    if (datePickerType == CalendarDatePicker2Type.multi) {
      valueText = values.isNotEmpty
          ? values
              .map((v) => v.toString().replaceAll('00:00:00.000', ''))
              .join(', ')
          : 'null';
    } else if (datePickerType == CalendarDatePicker2Type.range) {
      if (values.isNotEmpty) {
        final startDate = values[0].toString().replaceAll('00:00:00.000', '');
        final endDate = values.length > 1
            ? values[1].toString().replaceAll('00:00:00.000', '')
            : 'null';
        valueText = '$startDate to $endDate';
      } else {
        return 'null';
      }
    }
    print(valueText);

    return valueText;
  }

  Widget _buildDefaultSingleDatePickerWithValue() {
    final config = CalendarDatePicker2Config(
      selectedDayHighlightColor: Colors.blue,
      weekdayLabels: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
      weekdayLabelTextStyle: const TextStyle(
        color: Colors.black87,
        fontWeight: FontWeight.bold,
      ),
      firstDayOfWeek: 1,
      controlsHeight: 50,
      controlsTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
      dayTextStyle: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      disabledDayTextStyle: const TextStyle(
        color: Colors.grey,
      ),
      selectableDayPredicate: (day) => true,
    );
    return Obx(
      () => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CalendarDatePicker2(
              config: config,
              value: controller.singleDatePickerValueWithDefaultValue
                  .map((dateTime) => dateTime!)
                  .toList(),
              onValueChanged: (dates) => controller.selectedDateTime.value =
                  dates.first ?? DateTime.now()),
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
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  'HOUR',
                ),
              ),
              Container(
                height: 1,
                width: double.infinity,
                color: Colors.black,
              ),
              Container(
                height: 310,
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
                            child: TextButton(
                              onPressed: () {
                                controller.tempSelectedHour.value = hour;
                              },
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<CircleBorder>(
                                  CircleBorder(),
                                ),
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                                    if (controller.tempSelectedHour.value ==
                                        hour) {
                                      return Colors.blue;
                                    }
                                    return Colors.transparent;
                                  },
                                ),
                              ),
                              child: Text(
                                '$hour',
                                style: TextStyle(
                                  fontSize: 14,
                                  color:
                                      controller.tempSelectedHour.value == hour
                                          ? Colors.white
                                          : null,
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
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  'MINUTE',
                ),
              ),
              Container(
                height: 1,
                width: double.infinity,
                color: Colors.black,
              ),
              Container(
                height: 310,
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
                            child: TextButton(
                              onPressed: () {
                                controller.tempSelectedMinute.value = minute;
                              },
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<CircleBorder>(
                                  CircleBorder(),
                                ),
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                                    if (controller.tempSelectedMinute.value ==
                                        minute) {
                                      return Colors.blue;
                                    }
                                    return Colors.transparent;
                                  },
                                ),
                              ),
                              child: Text(
                                '$minute',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: controller.tempSelectedMinute.value ==
                                          minute
                                      ? Colors.white
                                      : null,
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
