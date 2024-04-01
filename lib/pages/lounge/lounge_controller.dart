import 'dart:math';

import 'package:get/get.dart';
import 'package:namer_app/interfacae/lounge_interface.dart';
import 'package:namer_app/model/lounge_model.dart';

class LoungeController extends GetxController {
  static LoungeController get to => Get.find<LoungeController>();
  RxInt status = 0.obs;
  RxList<LoungePostModel> loungeList = RxList();

  bool pageload = false;

  RxInt currentPage = 1.obs;
  RxList<int> displayCount = [10, 50].obs; // display 메뉴
  RxInt selectedDisplayCount = 10.obs; // 한 페이지에 보여질 데이터 수

  RxInt totalPage = 0.obs; // 전체 페이지수

  // 페이지네이션 정보
  RxInt pageCount = 5.obs; // pagination 아래 1-5 숫자
  RxInt firstNumberPageCount = 1.obs; // pagination 첫번째 숫자
  RxInt lastNumberPageCount = 0.obs; // pagination 마지막 숫자
  RxList<int> pageCountList = RxList<int>(); // pagination 아래 1-5 업데이트 숫자

  RxInt startIndex = 0.obs; // pagination 아래 1-5 숫자
  RxInt endIndex = 0.obs;

  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  Future<void> loadData() async {
    status.value = 0;

    try {
      loungeList.clear();
      currentPage.value = 1;
      var result = await LoungeInterface.getList(currentPage.value);
      result['results'].forEach((e) {
        loungeList.add(LoungePostModel.fromJson(e));
      });
      totalPage.value = (loungeList.length / selectedDisplayCount.value).ceil();
      setFistLastNumberPageCount();
      setPageCountList();
      setDataIndexPerPage();
      status.value = 1;
    } catch (e) {
      status.value = 2;
    }
  }

  // Future<void> loadPage(int currentPage) async {
  //   this.currentPage.value = currentPage;

  //   try {
  //     firstNumberPageCount.value = 1;
  //     lastNumberPageCount.value =
  //         pageCount.value > totalPage.value ? pageCount.value : totalPage.value;
  //     var result = await LoungeInterface.getList(currentPage);
  //     result['results'].forEach((e) {
  //       loungeList.add(LoungePostModel.fromJson(e));
  //     });
  //     status.value = 1;
  //   } catch (e) {
  //     status.value = 2;
  //   }
  // }

  void prevButtonClicked() {
    if (currentPage == 1) {
      return;
    }
    currentPage.value = currentPage.value - 1;
  }

  void nextButtonClicked() {
    if (currentPage == totalPage) {
      return;
    }
    currentPage.value = currentPage.value + 1;
  }

  void setFistLastNumberPageCount() {
    var currentGroup = (currentPage.value / pageCount.value).ceil();
    var newFirstNumber = (currentGroup - 1) * pageCount.value + 1;
    var newLastNumber = min(currentGroup * pageCount.value, totalPage.value);

    firstNumberPageCount.value = newFirstNumber;
    lastNumberPageCount.value = newLastNumber;
  }

  void setPageCountList() {
    for (int i = firstNumberPageCount.value;
        i <= lastNumberPageCount.value;
        i++) {
      pageCountList.add(i);
    }
  }

  void setDataIndexPerPage() {
    startIndex.value = (currentPage.value - 1) * selectedDisplayCount.value;
    endIndex.value =
        min(currentPage.value * selectedDisplayCount.value, loungeList.length);
  }

  void pageClicked(int page) {
    currentPage.value = page;
  }
}
