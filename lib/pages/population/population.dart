import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:namer_app/component/accordion.dart';
import 'package:namer_app/component/button/outline_button.dart';
import 'package:namer_app/component/checkbox/multi_checkbox.dart';
import 'package:namer_app/component/checkbox/radio.dart';
import 'package:namer_app/component/detail_sheet.dart';
import 'package:namer_app/component/filter/filter-button/filter_button.dart';
import 'package:namer_app/component/filter/filter-frame/filter_frame.dart';
import 'package:namer_app/component/filter/filter-row/filter_row.dart';
import 'package:namer_app/component/frame.dart';
import 'package:namer_app/component/toast.dart';
import 'package:namer_app/controller/detailContainer.dart';
import 'package:namer_app/main_controller.dart';
import 'package:namer_app/pages/button/button_controller.dart';
import 'package:namer_app/pages/population/detail/main.dart';
import 'package:namer_app/pages/table/table.dart';

class PopulationPage extends StatelessWidget {
  final ButtonController btn_controller = Get.put(ButtonController());
  final DetailController controller = Get.find<DetailController>();
  PopulationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FrameWidget(
        title: 'PLC/${MyController.to.currentMenu.value}',
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(0, 24, 0, 16),
                width: Get.width,
                child: Text(
                  'Population',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              FilterFrame(children: [
                FilterRow(
                  title: "DBMS Server",
                  child: MultiCheckBoxPage(
                      checkBoxList: btn_controller.checkBoxList,
                      selectedCheckBox: btn_controller.selectedCheckBox),
                ),
                FilterRow(
                  title: "Type",
                  child: RadioPage(
                    radioList: btn_controller.radioList,
                    selectedRadio: btn_controller.selectedRadio,
                  ),
                ),
                FilterRow(
                  title: btn_controller.title,
                  child: MultiCheckBoxPage(
                    checkBoxList: btn_controller.checkBoxList,
                    selectedCheckBox: btn_controller.selectedCheckBox,
                  ),
                ),
                Accordion(),
                FilterButton(children: [
                  ButtonWidget("text", () {
                    ToastWidget("에러가 발생했습니다.").red();
                  }).red(),
                  ButtonWidget("text", () {
                    ToastWidget("성공했습니다.").blue();
                  }).blue(),
                  ButtonWidget("text", () {
                    ToastWidget("다시 시도해주세요.").green();
                  }).green(),
                ])
              ]),
              SizedBox(height: 8),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                ButtonWidget('로그 합치기', () {
                  controller.pageName.value = 'select';
                  DetailSheet(
                    child: PopulationDetailWidget(),
                  );
                }).blue(),
              ]),
              TablePage(),
            ],
          ),
        ));
  }
}
