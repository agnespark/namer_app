import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:namer_app/config/color.dart';

class InfoTextAreaPage extends StatelessWidget {
  final RxString? title;
  final RxString content;
  InfoTextAreaPage({super.key, this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: ShapeDecoration(
        color: yellowLight,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.info_outline, color: yellowMain),
          SizedBox(
            width: 19,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(content.value),
          ),
        ],
      ),
    );
  }
}
