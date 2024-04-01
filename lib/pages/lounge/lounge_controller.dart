import 'package:get/get.dart';
import 'package:namer_app/interfacae/lounge_interface.dart';
import 'package:namer_app/model/lounge_model.dart';

class LoungeController extends GetxController {
  static LoungeController get to => Get.find<LoungeController>();
  RxInt status = 0.obs;
  RxList<LoungePostModel> loungeList = RxList();

  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  Future<void> loadData() async {
    status.value = 0;
    update();
    try {
      loungeList.clear();
      var result = await LoungeInterface.getList();
      result['results'].forEach((e) {
        loungeList.add(LoungePostModel.fromJson(e));
      });
      status.value = 1;
      update();
    } catch (e) {
      status.value = 2;
    }
  }
}
