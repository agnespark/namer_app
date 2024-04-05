import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:english_words/english_words.dart';
import 'package:namer_app/pages/sideSheet/SideSheet.dart';
import 'package:namer_app/pages/Dropdown/DropdownPage.dart';
import 'package:namer_app/pages/dashboard/dashboard_detail/dashboard_detail.dart';
import 'package:namer_app/pages/lounge/lounge.dart';
import 'package:namer_app/pages/multiSelect/multiSelectPage.dart';
import 'package:namer_app/pages/sampling/sampling.dart';
import 'package:namer_app/pages/table/table.dart';
import 'package:namer_app/pages/TextFiled/TextFiled.dart';

import 'nav_model.dart';
import 'pages/dashboard/dashboard.dart';

class MyController extends GetxController {
  static MyController get to => Get.find<MyController>();

  Rx<WordPair> current = WordPair.random().obs;
  RxList<WordPair> favorites = <WordPair>[].obs;

  Rx<Widget> currentWidget = Container(child: DashboardPage()).obs;
  Rx<Widget> currentDetail = Container(child: DashboardDetail()).obs;
  late Rx<Widget> currentPost;
  Rx<String> currentMenu = "".obs;

  RxList navList = RxList();

  @override
  void onInit() {
    setNav();
    super.onInit();
  }

  void setNav() {
    navList = [
      Menu(name: "Dashboard", page: DashboardPage(), depth: 0),
      Menu(
        name: "PLC",
        depth: 0,
        subMenu: [
          Menu(name: "Sampling", depth: 1, subMenu: [
            Menu(name: "구매단가", page: SamplingPage(), depth: 2),
            Menu(name: "BOM", page: SamplingPage(), depth: 2),
            Menu(name: "거래처", page: SamplingPage(), depth: 2),
          ]),
        ],
      ),
      Menu(name: "Lounge", page: LoungePage(), depth: 0),
      Menu(name: "Table", page: TablePage(), depth: 0),
      Menu(name: "TextFiled", page: TextFiledPage(), depth: 0),
      Menu(name: "DropdownMenu", page: DropdownMenuPage(), depth: 0),
      Menu(name: "SideSheet", page: SideSheetPage(), depth: 0),
      Menu(name: "MutiSelect", page: MutiSelectPage(), depth: 0),
    ].obs;
  }

  void changePage(Widget? widget, String name) {
    currentWidget.value = Container(child: widget);
    currentMenu.value = name;
  }

  void changeDetail(widget) {
    currentDetail.value = widget;
  }

  void getNext() {
    current.value = WordPair.random();
  }

  void toggleFavorite() {
    if (favorites.contains(current.value)) {
      favorites.remove(current.value);
    } else {
      favorites.add(current.value);
    }
  }
}
