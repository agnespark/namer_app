import 'dart:math';

import 'package:get/get.dart';
import 'package:namer_app/interfacae/lounge_interface.dart';
import 'package:namer_app/model/lounge_model.dart';

class LoungeController extends GetxController {
  static LoungeController get to => Get.find<LoungeController>();
  RxInt status = 0.obs;
  RxList<LoungePostModel> loungeList = RxList();

  Rx<bool> pageload = false.obs;

  // 현재, 전체 페이지 정보
  RxInt currentPage = 1.obs;
  RxInt totalPage = 0.obs; // 전체 페이지수
  RxInt startIndex = 0.obs; // 페이지내 데이터 시작 index
  RxInt endIndex = 0.obs; // 페이지내 데이터 끝 index
  RxInt dataCount = 0.obs; // 백엔드에서 잘라서 보내주는 데이터 갯수

  // displayCount 정보
  RxList<int> displayCount = [10, 50].obs; // display 메뉴 리스트
  RxInt selectedDisplayCount = 10.obs; // 한 페이지에 보여질 데이터 수

  // Pagination 정보
  int pageCount = 5; // pagination 아래 1-5 숫자
  RxList<int> pageCountList = RxList<int>(); // pagination 아래 1-5 업데이트 숫자
  RxInt nextPageParameter = 1.obs;

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
      if (selectedDisplayCount.value == 50) {
        for (int i = 1; i <= 4; i++) {
          nextPageParameter.value = i + 1;
          await loadMoreData(currentPage.value + i);
        }
      }
      totalPage.value = (loungeList.length / selectedDisplayCount.value).ceil();
      dataCount.value = loungeList.length;
      setPageCountList();
      setDataIndexPerPage();
      status.value = 1;
    } catch (e) {
      status.value = 2;
    }
  }

  Future<void> loadMoreData(int nextPage) async {
    if (currentPage.value == 1) {
      status.value = 0;
    }
    try {
      var result = await LoungeInterface.getList(nextPage);
      result['results'].forEach((e) {
        loungeList.add(LoungePostModel.fromJson(e));
      });
      totalPage.value = (loungeList.length / selectedDisplayCount.value).ceil();
      status.value = 1;
    } catch (e) {
      status.value = 2;
    }
  }

  void prevButtonClicked() {
    if (currentPage.value == 1) {
      return;
    }
    currentPage.value = currentPage.value - 1;
    setPageCountList();
    setDataIndexPerPage();
  }

  void nextButtonClicked() {
    if (currentPage.value == totalPage.value) {
      return;
    }

    currentPage.value = currentPage.value + 1;

    setPageCountList();
    setDataIndexPerPage();
  }

  void setPageCountList() {
    var currentGroup = (currentPage.value / pageCount).ceil();
    var newFirstNumber = (currentGroup - 1) * pageCount + 1;
    var newLastNumber = min(currentGroup * pageCount, totalPage.value);

    pageCountList.clear();
    for (int i = newFirstNumber; i <= newLastNumber; i++) {
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
    setPageCountList();
    setDataIndexPerPage();
  }

  Future<void> addData() async {
    pageload.value = true;
    if (selectedDisplayCount.value == 10) {
      nextPageParameter.value = nextPageParameter.value + 1;
      await loadMoreData(nextPageParameter.value);
      pageload.value = false;
    } else if (selectedDisplayCount.value == 50) {
      List<Future> futures = [];
      for (int i = 1; i <= 5; i++) {
        futures.add(loadMoreData(nextPageParameter.value + i));
        if (i == 5) {
          nextPageParameter.value = nextPageParameter.value + i;
        }
      }
      Future.wait(futures).then((_) {
        pageload.value = false;
      });
    }
  }
}
