import 'package:flutter/material.dart';
import 'package:namer_app/global_scaffold_key.dart';
import 'package:namer_app/main_controller.dart';
import "package:get/get.dart";
import 'package:namer_app/pages/sampling/sampling_detail/sampling_detail.dart';

class DesignPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: TextField(
            decoration: InputDecoration(
              labelText: 'Enter something', // Label text
              hintText: 'Type here', // Hint text
              prefixIcon: Icon(Icons.search), // Prefix icon
              suffixIcon: Icon(Icons.clear), // Suffix icon
              border: OutlineInputBorder(), // Border
            ),
          ),
        ),
        CheckboxListTile(
          title: Text('Checkbox 1'),
          value: false,
          onChanged: (newValue) {},
        ),
        CheckboxListTile(
          title: Text('Checkbox 2'),
          value: false,
          onChanged: (newValue) {},
        ),
        CheckboxListTile(
          title: Text('Checkbox 3'),
          value: false,
          onChanged: (newValue) {},
        ),
        ElevatedButton(
          onPressed: () {
            Get.dialog(
              AlertDialog(
                title: Text('Dialog Title'),
                content: Text('Dialog Content'),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      Get.back(); // Close dialog
                    },
                    child: Text('Close'),
                  ),
                ],
              ),
            );
          },
          child: Text('Next'),
        ),
      ],
    );
  }
}
