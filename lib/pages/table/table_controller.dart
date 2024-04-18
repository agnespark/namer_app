import 'package:get/get.dart';
import 'package:namer_app/pages/table/table.dart';

class TableController extends GetxController {
  late RxList<dynamic> data;
  late DataSource dataSource;

  final int rowsPerPage = 5;
  final double dataPagerHeight = 60.0;

  @override
  void onInit() {
    super.onInit();
    data = getOrders();
    dataSource = DataSource(orders: data);
  }

  RxList<dynamic> getOrders() {
    return [
      OrderInfo(10001, 'James', DateTime.now(), 200.0),
      OrderInfo(10002, 'Kathryn', DateTime.now(), 300.0),
      OrderInfo(10003, 'Lara', DateTime.now(), 150.0),
      OrderInfo(10004, 'Michael', DateTime.now(), 150.0),
      OrderInfo(10005, 'Martin', DateTime.now(), 150.0),
      OrderInfo(10006, 'Newberry', DateTime.now(), 150.0),
      OrderInfo(10007, 'Balnc', DateTime.now(), 150.0),
      OrderInfo(10008, 'Perry', DateTime.now(), 150.0),
      OrderInfo(10009, 'Gable', DateTime.now(), 150.0),
      OrderInfo(10010, 'Grimes', DateTime.now(), 150.0),
      OrderInfo(10001, 'a', DateTime.now(), 200.0),
      OrderInfo(10002, 'b', DateTime.now(), 300.0),
      OrderInfo(10003, 'c', DateTime.now(), 150.0),
      OrderInfo(10004, 'd', DateTime.now(), 150.0),
      OrderInfo(10005, 'e', DateTime.now(), 150.0),
      OrderInfo(10006, 'f', DateTime.now(), 150.0),
      OrderInfo(10007, 'g', DateTime.now(), 150.0),
      OrderInfo(10008, 'h', DateTime.now(), 150.0),
      OrderInfo(10009, 'i', DateTime.now(), 150.0),
      OrderInfo(10010, 'j', DateTime.now(), 150.0),
      OrderInfo(10001, 'a', DateTime.now(), 200.0),
      OrderInfo(10002, 'b', DateTime.now(), 300.0),
      OrderInfo(10003, 'c', DateTime.now(), 150.0),
      OrderInfo(10004, 'd', DateTime.now(), 150.0),
      OrderInfo(10005, 'e', DateTime.now(), 150.0),
      OrderInfo(10006, 'f', DateTime.now(), 150.0),
      OrderInfo(10007, 'g', DateTime.now(), 150.0),
      OrderInfo(10008, 'h', DateTime.now(), 150.0),
      OrderInfo(10009, 'i', DateTime.now(), 150.0),
      OrderInfo(10010, 'j', DateTime.now(), 150.0)
    ].obs;
  }
}

// 모델 예시
// class OrderInfo {
//   final int orderID;
//   final String customerID;
//   final DateTime orderDate;
//   final double freight;

//   OrderInfo(this.orderID, this.customerID, this.orderDate, this.freight);
// }
