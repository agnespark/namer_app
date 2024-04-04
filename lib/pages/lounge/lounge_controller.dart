import 'dart:math';

import 'package:get/get.dart';
import 'package:namer_app/interfacae/lounge_interface.dart';
import 'package:namer_app/model/lounge_model.dart';
import 'package:flutter/material.dart';

class LoungeController extends GetxController {
  static LoungeController get to => Get.find<LoungeController>();
  RxInt status = 0.obs;
  RxList<LoungePostModel> loungeList = RxList();

  bool pageload = false;

  // 현재, 전체 페이지 정보
  RxInt currentPage = 1.obs;
  RxInt totalPage = 0.obs;
  RxInt startIndex = 0.obs;
  RxInt endIndex = 0.obs;
  int dataCount = 0;

  // displayCount 정보
  RxList<int> displayCount = [10, 50].obs;
  RxInt selectedDisplayCount = 10.obs;

  // Pagination 정보
  int pageCount = 5;
  RxList<int> pageCountList = RxList<int>();

  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  Future<void> loadData() async {
    status.value = 0;
    try {
      currentPage.value = 1;
      var result = await LoungeInterface.getList(currentPage.value);
      List<LoungePostModel> newDataList = [];
      result['results'].forEach((e) {
        newDataList.add(LoungePostModel.fromJson(e));
      });
      loungeList.addAll(newDataList);
      dataCount = loungeList.length; // 데이터 갯수 업데이트
      if (selectedDisplayCount.value == 50) {
        await loadMoreData(currentPage.value + 2);
        result['results'].forEach((e) {
          newDataList.add(LoungePostModel.fromJson(e)); // 추가 데이터 추가
        });
        loungeList.addAll(newDataList); // 추가 데이터를 기존 리스트에 추가
      }
      totalPage.value = (loungeList.length / selectedDisplayCount.value).ceil();
      setPageCountList();
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
      print(nextPage);
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
    setPageCountList();
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
    } else if (currentPage.value % 10 == 1 && !pageload) {
      // pageload가 false이고 현재 페이지가 전체 페이지의 10배수 + 1인 경우에만 실행
      pageload = true;
      await loadMoreData(nextPageParams);
    }
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
    setDataIndexPerPage();
  }
}
