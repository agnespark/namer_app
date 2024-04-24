import 'package:get/get.dart';

class PopulationDetailController extends GetxController {
  RxString pageName = "loading".obs;

  void changeDetailPage(String name) {
    pageName.value = name;
  }

  loadData() async {
    //interface data load
  }
}
