import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:namer_app/component/accordion.dart';
import 'package:namer_app/component/button.dart';
import 'package:namer_app/component/checkbox/multi_checkbox.dart';
import 'package:namer_app/component/checkbox/radio.dart';
import 'package:namer_app/component/filter/filter-frame/filter_frame.dart';
import 'package:namer_app/component/filter/filter-row/filter_row.dart';
import 'package:namer_app/component/frame.dart';
import 'package:namer_app/component/toast.dart';
import 'package:namer_app/controller/detailContainer.dart';
import 'package:namer_app/main_controller.dart';
import 'package:namer_app/pages/button/button_controller.dart';
import 'package:namer_app/pages/table/table.dart';

class PopulationPage extends StatelessWidget {
  final DetailController controller = Get.put(DetailController());
  final ButtonController btn_controller = Get.put(ButtonController());
  PopulationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FrameWidget(
        title: 'PLC/${MyController.to.currentMenu.value}',
        body: Padding(
          padding: EdgeInsets.all(8),
          child: ListView(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
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
                    ], button: [
                      ButtonWidget("text", () {
                        ToastWidget("에러가 발생했습니다.").red();
                      }).red(),
                      ButtonWidget("text", () {
                        ToastWidget("성공했습니다.").blue();
                      }).blue(),
                      ButtonWidget("text", () {
                        ToastWidget("다시 시도해주세요.").green();
                      }).green(),
                    ]),
                    TablePage(),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
