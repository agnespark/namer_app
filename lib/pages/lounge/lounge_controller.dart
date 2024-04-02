import 'dart:math';

import 'package:get/get.dart';
import 'package:namer_app/interfacae/lounge_interface.dart';
import 'package:namer_app/model/lounge_model.dart';

class LoungeController extends GetxController {
  static LoungeController get to => Get.find<LoungeController>();
  RxInt status = 0.obs;
  RxList<LoungePostModel> loungeList = RxList();

  bool pageload = false;

  // 현재, 전체 페이지 정보
  RxInt currentPage = 1.obs;
  RxInt totalPage = 0.obs; // 전체 페이지수
  RxInt startIndex = 0.obs; // 페이지내 데이터 시작 index
  RxInt endIndex = 0.obs; // 페이지내 데이터 끝 index
  int dataCount = 0; // 백에서 잘라서 보내주는 데이터 갯수

  // display 정보
  RxList<int> displayCount = [10, 50].obs; // display 메뉴 리스트
  RxInt selectedDisplayCount = 10.obs; // 한 페이지에 보여질 데이터 수

  // 페이지네이션 정보
  RxInt pageCount = 5.obs; // pagination 아래 1-5 숫자
  RxInt firstNumberPageCount = 1.obs; // pagination 첫번째 숫자
  RxInt lastNumberPageCount = 0.obs; // pagination 마지막 숫자
  RxList<int> pageCountList = RxList<int>(); // pagination 아래 1-5 업데이트 숫자

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
        await loadMoreData(currentPage.value + 1);
        result['results'].forEach((e) {
          loungeList.add(LoungePostModel.fromJson(e));
        });
      }
      totalPage.value = (loungeList.length / selectedDisplayCount.value).ceil();
      dataCount = loungeList.length;
      setFistLastNumberPageCount();
      setDataIndexPerPage();
      status.value = 1;
    } catch (e) {
      status.value = 2;
    }
  }

  Future<void> loadMoreData(int nextPage) async {
    status.value = 0;
    try {
      var result = await LoungeInterface.getList(nextPage);
      result['results'].forEach((e) {
        loungeList.add(LoungePostModel.fromJson(e));
      });
      totalPage.value = (loungeList.length / selectedDisplayCount.value).ceil();
      pageload = false;
      status.value = 1;
    } catch (e) {
      status.value = 2;
    }
  }

  void prevButtonClicked() {
    if (currentPage == 1) {
      return;
    }
    currentPage.value = currentPage.value - 1;
    setFistLastNumberPageCount();
    setDataIndexPerPage();
  }

  Future<void> nextButtonClicked() async {
    // 현재 불러온 페이지의 다음 페이지를 불러오기 (현재 length의 기본데이터 150 나누기)
    var nextPageParams = (loungeList.length / dataCount).ceil() + 1;

    if (currentPage == totalPage.value) {
      return;
    }
    currentPage.value = currentPage.value + 1;

    if (selectedDisplayCount.value == 50 &&
        currentPage.value % 5 == 1 &&
        !pageload) {
      pageload = true;
      await loadMoreData(nextPageParams + 2);
      await loadMoreData(nextPageParams + 3);
    } else {
      // pageload가 false이고 현재 페이지가 전체 페이지의 10배수 + 1인 경우에만 실행
      if (currentPage.value % 10 == 1 && !pageload) {
        pageload = true;
        await loadMoreData(nextPageParams);
      }
    }
    setFistLastNumberPageCount();
    setDataIndexPerPage();
  }

  void setFistLastNumberPageCount() {
    var currentGroup = (currentPage.value / pageCount.value).ceil();
    var newFirstNumber = (currentGroup - 1) * pageCount.value + 1;
    var newLastNumber = min(currentGroup * pageCount.value, totalPage.value);

    firstNumberPageCount.value = newFirstNumber;
    lastNumberPageCount.value = newLastNumber;
    setPageCountList();
  }

  void setPageCountList() {
    pageCountList.clear();
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
    setDataIndexPerPage();
  }
}
