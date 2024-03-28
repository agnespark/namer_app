import 'package:get/get.dart';
import 'package:english_words/english_words.dart';

class MyController extends GetxController {
  static MyController get to => Get.find<MyController>();

  RxInt selectedIndex = 0.obs;

  Rx<WordPair> current = WordPair.random().obs;
  RxList<WordPair> favorites = <WordPair>[].obs;

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

  void changePage(int index) {
    selectedIndex.value = index;
  }
}
