import 'package:get/get.dart';

class SapController extends GetxController {
  RxList<String> beforeTableList = RxList();
  RxList<String> afterTableList = RxList();

  RxInt selectedBeforeTableIndex = RxInt(-1);
  RxInt selectedAfterTableIndex = RxInt(-1);

  @override
  void onInit() {
    super.onInit();
  }

  void RightButtonClicked() {
    if (selectedBeforeTableIndex.value != -1) {
      String selectedItem = beforeTableList[selectedBeforeTableIndex.value];
      if (!afterTableList.contains(selectedItem)) {
        afterTableList.add(selectedItem);
      }
    }

    selectedBeforeTableIndex.value = -1;
  }

  void LeftButtonClicked() {
    if (selectedAfterTableIndex.value != -1) {
      afterTableList.removeAt(selectedAfterTableIndex.value);
    }

    selectedAfterTableIndex.value = -1;
  }

  void DoubleRightButtonClicked() {
    for (String item in beforeTableList) {
      if (!afterTableList.contains(item)) {
        afterTableList.add(item);
      }
    }
  }

  void DoubleLeftButtonClicked() {
    afterTableList.clear();
  }

  void CallTableList() {
    beforeTableList.assignAll(["table1", "table2", "table3"]);
  }
}
