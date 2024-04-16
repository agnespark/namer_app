import 'package:get/get.dart';

class SapController extends GetxController {
  RxList<String> beforeTableList = ["table1", "table2", "table3"].obs;
  RxList<String> afterTableList = RxList();

  RxInt selectedBeforeTableIndex = RxInt(-1);
  RxInt selectedAfterTableIndex = RxInt(-1);

  void RightButtonClicked() {
    if (selectedBeforeTableIndex.value != -1) {
      String selectedItem = beforeTableList[selectedBeforeTableIndex.value];

      afterTableList.add(selectedItem);
      beforeTableList.removeAt(selectedBeforeTableIndex.value);
    }

    selectedBeforeTableIndex.value = -1;
  }

  void LeftButtonClicked() {
    if (selectedAfterTableIndex.value != -1) {
      String selectedItem = afterTableList[selectedAfterTableIndex.value];

      beforeTableList.add(selectedItem);
      afterTableList.removeAt(selectedAfterTableIndex.value);
    }

    selectedAfterTableIndex.value = -1;
  }

  void DoubleRightButtonClicked() {
    afterTableList.addAll(beforeTableList.toList());
    beforeTableList.clear();
  }

  void DoubleLeftButtonClicked() {
    beforeTableList.addAll(afterTableList.toList());
    afterTableList.clear();
  }
}
