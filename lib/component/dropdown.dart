import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:namer_app/config/color.dart';

const List<String> numberList = <String>['10개', '30개', '50개', '100개'];
final DropdownController controller = DropdownController();

class DropdownButtonWidget {
  final List<String> list;
  // DropdownButtonWidget({List<String>? list = numberList}) : this.list = list;
  DropdownButtonWidget({List<String>? list}) : this.list = list ?? numberList;

  Widget() {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(color: primaryMain, width: 1),
            borderRadius: BorderRadius.circular(4)),
        height: 28,
        width: 100,
        child: Obx(
          () => DropdownButtonHideUnderline(
            child: DropdownButton(
                style: TextStyle(
                  color: primaryMain,
                ),
                isExpanded: true,
                focusColor: Colors.transparent,
                iconEnabledColor: primaryMain,
                value: controller.dropdownValue.value,
                // underline: Container(height: 0),
                items: list
                    .map((el) => DropdownMenuItem(
                          value: el,
                          child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text(el,
                                  style: TextStyle(
                                      color: Colors.black,
                                      backgroundColor: Colors.transparent))),
                        ))
                    .toList(),
                onChanged: (value) {
                  controller.changeValue(value);
                },
                borderRadius: BorderRadius.circular(4)
                // iconSize: 1
                ),
          ),
        ));
  }
}

class DropdownController extends GetxController {
  static DropdownController get to => Get.find<DropdownController>();

  Rx<String> dropdownValue = "10개".obs;

  void changeValue(String? value) {
    if (value != null) {
      dropdownValue.value = value;
    }
  }
}
