import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:english_words/english_words.dart';
import 'package:namer_app/pages/favorite/favorite.dart';

import 'nav_model.dart';
import 'pages/home/home.dart';

class MyController extends GetxController {
  static MyController get to => Get.find<MyController>();

  MyController(this.scaffoldKey, this.currentWidget);

  RxInt selectedIndex = 0.obs;

  Rx<WordPair> current = WordPair.random().obs;
  RxList<WordPair> favorites = <WordPair>[].obs;

  GlobalKey<ScaffoldState> scaffoldKey;

  Rx<Widget> currentWidget;

  RxList navList = RxList();

  @override
  void onInit() {
    setNave();
    super.onInit();
  }

  void setNave() {
    // Menu Object Create
    navList = [
      Menu(
        name: "Dashboard",
        page: HomePage(scaffoldKey),
      ),
      Menu(
        name: "Favorite",
        page: FavoritePage(scaffoldKey),
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
    update();
  }
}
