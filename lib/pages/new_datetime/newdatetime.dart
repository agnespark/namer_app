import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';

final today = DateUtils.dateOnly(DateTime.now());

class NewDateTimePage extends StatefulWidget {
  const NewDateTimePage({Key? key}) : super(key: key);

  @override
  State<NewDateTimePage> createState() => _NewDateTimePageState();
}

class _NewDateTimePageState extends State<NewDateTimePage> {
  int selectedHour = 0;
  int selectedMinute = 0;

  List<DateTime?> _dialogCalendarPickerValue = [
    DateTime(2021, 8, 10),
    DateTime(2021, 8, 13),
  ];
  List<DateTime?> _singleDatePickerValueWithDefaultValue = [
    DateTime.now(),
  ];
  List<DateTime?> _multiDatePickerValueWithDefaultValue = [
    DateTime(today.year, today.month, 1),
    DateTime(today.year, today.month, 5),
    DateTime(today.year, today.month, 14),
    DateTime(today.year, today.month, 17),
    DateTime(today.year, today.month, 25),
  ];
  List<DateTime?> _rangeDatePickerValueWithDefaultValue = [
    DateTime(1999, 5, 6),
    DateTime(1999, 5, 21),
  ];

  List<DateTime?> _rangeDatePickerWithActionButtonsWithValue = [
    DateTime.now(),
    DateTime.now().add(const Duration(days: 5)),
  ];

  @override
  void initState() {
    super.initState();
    // 현재 시간을 가져와서 selectedHour와 selectedMinute을 설정
    DateTime now = DateTime.now();
    selectedHour = now.hour;
    selectedMinute = now.minute;
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
                      border: Border.all(color: Colors.black), // 사방으로 보더 적용
                      borderRadius: BorderRadius.all(
                          Radius.circular(12)), // 보더의 모서리를 둥글게 함
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        _getValueText(
                          CalendarDatePicker2Type.single,
                          _singleDatePickerValueWithDefaultValue,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black), // 테두리 선 설정
                ),
                width: 453,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 300, // 첫 번째 자식 위젯의 폭을 200으로 설정
                      child:
                          _buildDefaultSingleDatePickerWithValue(), // 예시로 사용된 함수
                    ),
                    // SizedBox(height: 16), // 위젯 사이 간격 조정을 위한 SizedBox
                    Container(
                      width: 1, // Divider의 너비를 1로 설정
                      height: 350,
                      color: Colors.black, // Divider의 색상 설정
                    ),
                    Container(
                      width: 150,
                      child: _setTimeNumberValue(),
                    ),
                  ],
                ),
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
    valueText += ' ${selectedHour.toString().padLeft(2, '0')}:'
        '${selectedMinute.toString().padLeft(2, '0')}';

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
      selectableDayPredicate: (day) => !day
          .difference(DateTime.now().subtract(const Duration(days: 3)))
          .isNegative,
    );
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CalendarDatePicker2(
          config: config,
          value: _singleDatePickerValueWithDefaultValue,
          onValueChanged: (dates) =>
              setState(() => _singleDatePickerValueWithDefaultValue = dates),
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
                padding: EdgeInsets.symmetric(vertical: 8), // 위아래 패딩 설정
                child: Text(
                  'HOUR',
                ),
              ),
              Container(
                height: 1, // Divider의 높이
                width: double.infinity, // Divider의 가로폭을 가득 채우도록 설정
                color: Colors.black, // Divider의 색상
              ),
              Container(
                height: 310,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: List.generate(
                      24,
                      (index) {
                        final hour = index;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedHour = hour;
                            });
                          },
                          child: Container(
                            height: 30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: selectedHour == hour ? Colors.blue : null,
                            ),
                            child: Center(
                              child: Text(
                                '$hour',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: selectedHour == hour
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
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 8), // 위아래 패딩 설정
                child: Text(
                  'MINUTE',
                ),
              ),
              Container(
                height: 1, // Divider의 높이
                width: double.infinity, // Divider의 가로폭을 가득 채우도록 설정
                color: Colors.black, // Divider의 색상
              ),
              Container(
                height: 310,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: List.generate(
                      60,
                      (index) {
                        final minute = index;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedMinute = minute;
                            });
                          },
                          child: Container(
                            height: 30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color:
                                  selectedMinute == minute ? Colors.blue : null,
                            ),
                            child: Center(
                              child: Text(
                                '$minute',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: selectedMinute == minute
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
            ],
          ),
        ),
      ],
    );
  }
}
