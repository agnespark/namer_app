import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:namer_app/component/button.dart';
import 'package:namer_app/component/plusbutton.dart';
import 'package:namer_app/component/toast.dart';
import 'package:namer_app/pages/button/button_controller.dart';
import 'package:namer_app/pages/checkbox/multi_checkbox.dart';
import 'package:namer_app/pages/radio/radio.dart';

class ButtonPage extends StatelessWidget {
  ButtonPage({Key? key}) : super(key: key);
  final ButtonController controller = Get.put(ButtonController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
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
          Expanded(
            child: MultiCheckBoxPage(
                checkBoxList: controller.checkBoxList,
                selectedCheckBox: controller.selectedCheckBox),
          ),
          Expanded(
            child: RadioPage(
              radioList: controller.radioList,
              selectedRadio: controller.selectedRadio,
            ),
          ),
        ],
      ),
    );
  }
}
