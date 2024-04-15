import 'package:get/get.dart';

class SapController extends GetxController {
  RxList beforeTableList = ["table1", "table2", "table3"].obs;
  RxList afterTableList = [].obs;

  RxInt selectedBeforeTableIndex = RxInt(-1);
  RxInt selectedAfterTotalTableIndex = RxInt(-1);
}
