// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:side_sheet/side_sheet.dart';

void DetailSheet({required Widget child}) {
  SideSheet.right(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: child,
      ),
      context: Get.context!,
      width: Get.width * 0.6);
}
