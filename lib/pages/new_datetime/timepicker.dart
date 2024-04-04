import 'package:flutter/material.dart';

class NumberPage extends StatefulWidget {
  @override
  _NumberPageState createState() => _NumberPageState();
}

class _NumberPageState extends State<NumberPage> {
  int selectedHour = 0;
  int selectedMinute = 0;
  final ScrollController _hourController = ScrollController();
  final ScrollController _minuteController = ScrollController();

  @override
  void initState() {
    super.initState();
    // 현재 시간을 가져와서 selectedHour와 selectedMinute을 설정
    DateTime now = DateTime.now();
    selectedHour = now.hour;
    selectedMinute = now.minute;

    // 해당 시간에 맞게 스크롤 위치를 조정
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _hourController.jumpTo(selectedHour * 50.0);
      _minuteController.jumpTo(selectedMinute * 50.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 500, // height를 500으로 설정
            child: ListView.builder(
              controller: _hourController,
              itemCount: 24,
              itemBuilder: (context, index) {
                final hour = index;
                return ListTile(
                  title: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: selectedHour == hour ? Colors.blue : null,
                    ),
                    padding: EdgeInsets.all(8),
                    child: Center(
                      child: Text(
                        '$hour',
                        style: TextStyle(
                          fontSize: 16,
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
        Expanded(
          child: SizedBox(
            height: 500, // height를 500으로 설정
            child: ListView.builder(
              controller: _minuteController,
              itemCount: 60,
              itemBuilder: (context, index) {
                final minute = index;
                return ListTile(
                  title: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: selectedMinute == minute ? Colors.blue : null,
                    ),
                    padding: EdgeInsets.all(8),
                    child: Center(
                      child: Text(
                        '$minute',
                        style: TextStyle(
                          fontSize: 16,
                          color: selectedMinute == minute ? Colors.white : null,
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
      ],
    );
  }
}
