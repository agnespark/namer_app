import 'package:flutter/material.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';
import 'package:intl/intl.dart';

class DateTimePage extends StatefulWidget {
  DateTimePage({Key? key}) : super(key: key);

  @override
  _DateTimePageState createState() => _DateTimePageState();
}

class _DateTimePageState extends State<DateTimePage> {
  DateTime? _startDateTime;
  DateTime? _endDateTime;
  TextEditingController _startTextEditingController = TextEditingController();
  TextEditingController _endTextEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _startTextEditingController.text = _startDateTime != null
        ? DateFormat('yyyy-MM-dd HH:mm:ss').format(_startDateTime!)
        : DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

    _endDateTime = DateTime.now().add(Duration(days: 7));
    _endTextEditingController.text =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(_endDateTime!);
  }

  Future<void> _showDateTimeRangePicker() async {
    List<DateTime>? dateTimeList = await showOmniDateTimeRangePicker(
      context: context,
      startInitialDate: _startDateTime ?? DateTime.now(),
      startFirstDate: DateTime(1600).subtract(const Duration(days: 3652)),
      startLastDate: DateTime.now().add(const Duration(days: 3652)),
      endInitialDate: _endDateTime ?? DateTime.now().add(Duration(days: 7)),
      endFirstDate: DateTime(1600).subtract(const Duration(days: 3652)),
      endLastDate: DateTime.now().add(const Duration(days: 3652)),
      is24HourMode: false,
      isShowSeconds: false,
      minutesInterval: 1,
      secondsInterval: 1,
      isForce2Digits: true,
      // borderRadius: const BorderRadius.all(Radius.circular(16)),
      constraints: const BoxConstraints(
        maxWidth: 350,
        maxHeight: 650,
      ),
      transitionBuilder: (context, anim1, anim2, child) {
        return FadeTransition(
          opacity: anim1.drive(
            Tween(
              begin: 0,
              end: 1,
            ),
          ),
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 200),
      barrierDismissible: true,
      // selectableDayPredicate: (dateTime) {
      //   // Disable 25th Feb 2023
      //   if (dateTime == DateTime(2023, 2, 25)) {
      //     return false;
      //   } else {
      //     return true;
      //   }
      // },
    );

    if (dateTimeList != null && dateTimeList.length == 2) {
      setState(() {
        _startDateTime = dateTimeList[0];
        _startTextEditingController.text =
            DateFormat('yyyy-MM-dd HH:mm:ss').format(_startDateTime!);
        _endDateTime = dateTimeList[1];
        _endTextEditingController.text =
            DateFormat('yyyy-MM-dd HH:mm:ss').format(_endDateTime!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    controller: _startTextEditingController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue.shade100,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue.shade100,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide:
                            BorderSide(width: 2, color: Colors.red.shade200),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      hintText: 'YYYY-MM-DD hh:mm:ss',
                      // suffixIcon: IconButton(
                      //   icon: Icon(Icons.calendar_today),
                      //   onPressed: () => _showDateTimeRangePicker(true),
                      // ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    controller: _endTextEditingController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue.shade100,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue.shade100,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide:
                            BorderSide(width: 2, color: Colors.red.shade200),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      hintText: 'YYYY-MM-DD hh:mm:ss',
                      // suffixIcon: IconButton(
                      //   icon: Icon(Icons.calendar_today),
                      //   onPressed: () => _showDateTimeRangePicker(false),
                      // ),
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.calendar_today),
                onPressed: () => _showDateTimeRangePicker(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
