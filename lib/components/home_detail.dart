import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('home'),
        ),
        ElevatedButton(
          onPressed: () {
            // 클릭 시 다이얼로그 띄우기
            Get.dialog(
              AlertDialog(
                title: Text('Dialog Title'),
                content: Text('This is a dialog content.'),
                actions: [
                  TextButton(
                    onPressed: () {
                      // 다이얼로그 닫기
                      Get.back();
                    },
                    child: Text('Close'),
                  ),
                ],
              ),
            );
          },
          child: Text('modal'),
        ),
      ],
    );
  }
}
