import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:english_words/english_words.dart';
import 'package:namer_app/pages/dashboard/dashboard_detail/dashboard_detail.dart';
import 'package:namer_app/pages/sampling/sampling.dart';
import 'package:namer_app/pages/sampling/sampling_detail/sampling_detail.dart';

import 'nav_model.dart';
import 'pages/dashboard/dashboard.dart';

class MyController extends GetxController {
  static MyController get to => Get.find<MyController>();

  MyController(this.currentWidget);

  RxInt selectedIndex = 0.obs;

  Rx<WordPair> current = WordPair.random().obs;
  RxList<WordPair> favorites = <WordPair>[].obs;

  Rx<Widget> currentWidget;

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
        page: DashboardPage(),
        detail: DashboardDetail(),
        depth: 0,
        subMenu: [
          Menu(name: "Sampling", depth: 1, subMenu: [
            Menu(
                name: "구매단가",
                page: SamplingPage(),
                detail: SamplingDetail(),
                depth: 2),
            Menu(
                name: "BOM",
                page: SamplingPage(),
                detail: SamplingDetail(),
                depth: 2),
            Menu(
                name: "거래처",
                page: SamplingPage(),
                detail: SamplingDetail(),
                depth: 2),
          ]),
        ],
      ),
    ].obs;
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

  void changeWidget(widget) {
    currentWidget.value = Container(child: widget);
  }

  void setDetailPage() {
    print(currentWidget.value);
    print(currentWidget.value);
  }
}
