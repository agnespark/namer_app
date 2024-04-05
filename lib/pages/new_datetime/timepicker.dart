import 'package:flutter/material.dart';

class NumberPage extends StatefulWidget {
  @override
  _NumberPageState createState() => _NumberPageState();
}

class _NumberPageState extends State<NumberPage> {
  int selectedHour = 0;
  int selectedMinute = 0;

  @override
  void initState() {
    super.initState();
    // 현재 시간을 가져와서 selectedHour와 selectedMinute을 설정
    DateTime now = DateTime.now();
    selectedHour = now.hour;
    selectedMinute = now.minute;

    // 해당 시간에 맞게 스크롤 위치를 조정
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 300,
            child: ListView(
              children: List.generate(
                24,
                (index) {
                  final hour = index;
                  return ListTile(
                    title: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: selectedHour == hour ? Colors.blue : null,
                      ),
                      // padding: EdgeInsets.all(8),
                      child: Center(
                        child: Text(
                          '$hour',
                          style: TextStyle(
                            fontSize: 14,
                            color: selectedHour == hour ? Colors.white : null,
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        selectedHour = hour;
                      });
                    },
                  );
                },
              ),
            ),
          ),
        ),
        Divider(color: Colors.black),
        Expanded(
          child: SizedBox(
            height: 300,
            child: ListView(
              children: List.generate(
                60,
                (index) {
                  final minute = index;
                  return ListTile(
                    title: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: selectedMinute == minute ? Colors.blue : null,
                      ),
                      // padding: EdgeInsets.all(8),
                      child: Center(
                        child: Text(
                          '$minute',
                          style: TextStyle(
                            fontSize: 14,
                            color:
                                selectedMinute == minute ? Colors.white : null,
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        selectedMinute = minute;
                      });
                    },
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
