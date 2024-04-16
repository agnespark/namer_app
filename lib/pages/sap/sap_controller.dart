import 'package:get/get.dart';

class SapController extends GetxController {
  RxList<String> beforeTableList = RxList();
  RxList<String> afterTableList = RxList();

  RxInt selectedBeforeTableIndex = RxInt(-1);
  RxInt selectedAfterTableIndex = RxInt(-1);

  RxList<String> filteredTableList = RxList();

  @override
  void onInit() {
    super.onInit();
    beforeTableList.assignAll(["table1", "table2", "table3"]);
    filteredTableList.assignAll(beforeTableList);
  }

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
    if (beforeTableList.length == 0) {
      filteredTableList.assignAll([]);
    } else {
      // 검색어가 있으면 일치하는 테이블만 필터링하여 보여주기
      filteredTableList.assignAll(beforeTableList
          .where((table) => table.contains(searchKeyword))
          .toList());
    }
  }
}
