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

  void filterTableList(String searchKeyword) {
    // 입력한 문자열과 일치하는 테이블만 보여주도록 beforeTableList 필터링
    if (searchKeyword.isEmpty) {
      // 검색어가 비어 있으면 모든 테이블 보여주기
      beforeTableList.assignAll(["table1", "table2", "table3"]);
    } else {
      // 검색어가 있으면 일치하는 테이블만 필터링하여 보여주기
      beforeTableList.assignAll(beforeTableList
          .where((table) => table.contains(searchKeyword))
          .toList());
    }
  }
}
