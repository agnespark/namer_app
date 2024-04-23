import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:namer_app/component/%08dropdown.dart';
import 'package:namer_app/component/accordion.dart';
import 'package:namer_app/component/button/outline_button.dart';
import 'package:namer_app/component/checkbox/multi_checkbox.dart';
import 'package:namer_app/component/checkbox/radio.dart';
import 'package:namer_app/component/filter/filter-button/filter_button.dart';
import 'package:namer_app/component/filter/filter-frame/filter_frame.dart';
import 'package:namer_app/component/filter/filter-row/filter_row.dart';
import 'package:namer_app/component/frame.dart';
import 'package:namer_app/component/shimmer/table_skeleton.dart';
import 'package:namer_app/component/toast.dart';
import 'package:namer_app/main_controller.dart';
import 'package:namer_app/pages/button/button_controller.dart';
import 'package:namer_app/pages/population/population_controller.dart';

class PopulationPage extends StatelessWidget {
  final ButtonController btn_controller = Get.put(ButtonController());
  final PopulationController controller = Get.put(PopulationController());
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
                  DropdownButtonWidget(list: ['10개', '30개', '50개', '100개'])
                      .Widget(),
                  ButtonWidget("초기화", () {}).blue(),
                  ButtonWidget("조회", () {}).blue(),
                  ButtonWidget("XLSX", () {
                    ToastWidget("다시 시도해주세요.").green();
                  }).green(),
                ])
              ]),
              SizedBox(height: 8),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                ButtonWidget('로그 합치기', () {
                  controller.logCombineClick();
                }).blue(),
              ]),
              // 여기에서 if문을 걸고 로딩뷰 / 로딩이 다 끝나면 table이 나오도록 해야 함
              // BasicTable(
              //   header: controller.basicTableDataHeader,
              //   data: controller.basicTableData,
              //   width: controller.basicTableDataWidth,
              //   detail: (int index) {
              //     controller.detailClick(index);
              //   },
              // ),
              TableSkeleton().Widget(),
            ],
          ),
        ));
  }
}
