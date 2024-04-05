import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final today = DateUtils.dateOnly(DateTime.now());

class NewDateTimePage extends StatefulWidget {
  const NewDateTimePage({Key? key}) : super(key: key);

  @override
  State<NewDateTimePage> createState() => _NewDateTimePageState();
}

class _NewDateTimePageState extends State<NewDateTimePage> {
  final selectedHour = RxInt(0);
  final selectedMinute = RxInt(0);

  List<DateTime?> _singleDatePickerValueWithDefaultValue = [
    DateTime.now(),
  ];
  DateTime? _selectedDateTime;
  final _tempSelectedHour = RxInt(0);
  final _tempSelectedMinute = RxInt(0);

  @override
  void initState() {
    super.initState();
    DateTime now = DateTime.now();
    selectedHour.value = now.hour;
    selectedMinute.value = now.minute;
    _tempSelectedHour.value = now.hour;
    _tempSelectedMinute.value = now.minute;
  }

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
                          child: Text(
                            _getValueText(
                              CalendarDatePicker2Type.single,
                              _singleDatePickerValueWithDefaultValue,
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
                                    height: 400,
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
                                        setState(() {
                                          selectedHour.value =
                                              _tempSelectedHour.value;
                                          selectedMinute.value =
                                              _tempSelectedMinute.value;
                                          _singleDatePickerValueWithDefaultValue =
                                              [_selectedDateTime];
                                        });
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
    valueText += ' ${selectedHour.value.toString().padLeft(2, '0')}:'
        '${selectedMinute.value.toString().padLeft(2, '0')}';

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
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CalendarDatePicker2(
          config: config,
          value: _singleDatePickerValueWithDefaultValue,
          onValueChanged: (dates) =>
              setState(() => _selectedDateTime = dates.first),
        ),
      ],
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
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _tempSelectedHour.value = hour;
                              });
                            },
                            child: Container(
                              height: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _tempSelectedHour == hour
                                    ? Colors.blue
                                    : null,
                              ),
                              child: Center(
                                child: Text(
                                  '$hour',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: _tempSelectedHour.value == hour
                                        ? Colors.white
                                        : null,
                                  ),
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
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _tempSelectedMinute.value = minute;
                              });
                            },
                            child: Container(
                              height: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _tempSelectedMinute.value == minute
                                    ? Colors.blue
                                    : null,
                              ),
                              child: Center(
                                child: Text(
                                  '$minute',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: _tempSelectedMinute.value == minute
                                        ? Colors.white
                                        : null,
                                  ),
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
