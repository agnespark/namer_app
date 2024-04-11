import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:namer_app/component/button.dart';
import 'package:namer_app/component/plusbutton.dart';
import 'package:namer_app/component/toast.dart';
import 'package:namer_app/pages/button/button_controller.dart';
import 'package:namer_app/component/checkbox/multi_checkbox.dart';
import 'package:namer_app/component/checkbox/single_checkbox.dart';
import 'package:namer_app/component/textarea/info-textarea.dart';
import 'package:namer_app/component/checkbox/radio.dart';
import 'package:namer_app/component/filter-row/filter_row.dart';

class ButtonPage extends StatelessWidget {
  ButtonPage({Key? key}) : super(key: key);
  final ButtonController controller = Get.put(ButtonController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ButtonWidget("text", () {
              ToastWidget("에러가 발생했습니다.").red();
            }).red(),
            ButtonWidget("text", () {
              ToastWidget("성공했습니다.").blue();
            }).blue(),
            ButtonWidget("text", () {
              ToastWidget("다시 시도해주세요.").green();
            }).green(),
            PlusButtonWidget(
              onPressed: () {},
            ),
            SingleCheckBoxPage(
                singleCheckBoxList: controller.singleCheckBoxList,
                selectedSingleCheckBox: controller.selectedSingleCheckBox),
            MultiCheckBoxPage(
                checkBoxList: controller.checkBoxList,
                selectedCheckBox: controller.selectedCheckBox),
            RadioPage(
              radioList: controller.radioList,
              selectedRadio: controller.selectedRadio,
            ),
            FilterRow(
              title: controller.title,
              body: MultiCheckBoxPage(
                checkBoxList: controller.checkBoxList,
                selectedCheckBox: controller.selectedCheckBox,
              ),
            ),
            InfoTextAreaPage(content: controller.content),
          ],
        ),
      ),
    );
  }
}
