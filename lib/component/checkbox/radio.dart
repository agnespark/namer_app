import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RadioPage extends StatelessWidget {
  final Rx<String?> selectedRadio;
  final List<String> radioList;

  RadioPage({Key? key, required this.radioList, required this.selectedRadio})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        child: Row(
          // Change Wrap to Row
          children: radioList.map((item) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Radio(
                  value: item,
                  groupValue: selectedRadio.value,
                  onChanged: (value) {
                    selectedRadio.value = value;
                  },
                ),
                Text(item),
              ],
            );
          }).toList(),
        ),
      );
    });
  }
}
