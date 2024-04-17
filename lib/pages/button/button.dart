import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:namer_app/component/accordion.dart';
import 'package:namer_app/component/button/outline_button.dart';
import 'package:namer_app/component/filter/filter-frame/filter_frame.dart';
import 'package:namer_app/component/button/plusbutton.dart';
import 'package:namer_app/component/filter/filter-button/filter_button.dart';
import 'package:namer_app/component/textfield/basic-textfield.dart';
import 'package:namer_app/component/toast.dart';
import 'package:namer_app/pages/button/button_controller.dart';
import 'package:namer_app/component/checkbox/multi_checkbox.dart';
import 'package:namer_app/component/checkbox/single_checkbox.dart';
import 'package:namer_app/component/textarea/info-textarea.dart';
import 'package:namer_app/component/checkbox/radio.dart';
import 'package:namer_app/component/filter/filter-row/filter_row.dart';
import 'package:namer_app/pages/new_datetime/newdatetime.dart';

class ButtonPage extends StatelessWidget {
  ButtonPage({Key? key}) : super(key: key);
  final ButtonController controller = Get.put(ButtonController());

  @override
  Widget build(BuildContext context) {
    return ListView(
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
          child: MultiCheckBoxPage(
            checkBoxList: controller.checkBoxList,
            selectedCheckBox: controller.selectedCheckBox,
          ),
        ),
        InfoTextAreaPage(content: controller.content),
        FilterRow(
          title: controller.title,
          child: BasicTextField(hintText: "힌트텍스트!"),
        ),
        Accordion(),
        SizedBox(
          height: 10,
        ),
        FilterFrame(children: [
          FilterRow(
            title: "DBMS Server",
            child: MultiCheckBoxPage(
                checkBoxList: controller.checkBoxList,
                selectedCheckBox: controller.selectedCheckBox),
          ),
          FilterRow(
            title: "Date Time",
            child: NewDateTimePage(),
          ),
          FilterRow(
            title: "Type",
            child: RadioPage(
              radioList: controller.radioList,
              selectedRadio: controller.selectedRadio,
            ),
          ),
          FilterRow(
            title: controller.title,
            child: MultiCheckBoxPage(
              checkBoxList: controller.checkBoxList,
              selectedCheckBox: controller.selectedCheckBox,
            ),
          ),
          Accordion(),
          FilterButton(
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
            ],
          )
        ]),
      ],
    );
  }
}
