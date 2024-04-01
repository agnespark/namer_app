import 'package:get/get.dart';
import 'package:namer_app/interfacae/lounge_interface.dart';
import 'package:namer_app/model/lounge_model.dart';

class LoungeController extends GetxController {
  static LoungeController get to => Get.find<LoungeController>();
  RxInt status = 0.obs;
  RxList<LoungePostModel> loungeList = RxList();
  bool pageload = false;
  RxInt pageCount = 1.obs;
  RxInt currentPage = 1.obs;

  RxList<int> displayCount = [10, 50].obs; // menu
  RxInt selectedDisplayCount = 10.obs; // 한 페이지에 보여질 항목 수 // 기본값은 10으로 설정
  RxInt totalPages = 0.obs; // 기본값은 10으로 설정

  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  Future<void> loadData() async {
    status.value = 0;
    currentPage.value = 1;
    try {
      loungeList.clear();
      var result = await LoungeInterface.getList(currentPage.value);
      totalPages.value = (LoungeController.to.loungeList.length /
              LoungeController.to.selectedDisplayCount.value)
          .ceil(); //
      result['results'].forEach((e) {
        loungeList.add(LoungePostModel.fromJson(e));
      });

      status.value = 1;
    } catch (e) {
      status.value = 2;
    }
  }

  Future<void> loadPage(int currentPage) async {
    this.currentPage.value = currentPage;
    var result = await LoungeInterface.getList(currentPage);
    result['results'].forEach((e) {
      loungeList.add(LoungePostModel.fromJson(e));
    });
    status.value = 1;
    try {
      pageCount.value++;
    } catch (e) {
      status.value = 2;
    }
  }
}
