import 'package:get/get.dart';
import 'package:namer_app/component/table/basic-table/basic_table.dart';
import 'package:namer_app/model/order_model.dart';

class TableController extends GetxController {
  late RxList<Employee> basicTableData = RxList();
  late RxList<OrderInfo> paginatedTableData = RxList();
  final int rowsPerPage = 5;
  final int totalPage = 3;

  final List<String> basicTableDataHeader = [
    "orderID",
    "customerID",
    "orderDate",
    "freight",
    "check",
    "download",
  ];
  final List<double> basicTableDataWidth = [
    100,
    double.nan,
    double.nan,
    double.nan,
    double.nan,
    double.nan,
  ];

  final List<double> paginatedTableDataWidth = [
    100,
    double.nan,
    double.nan,
    double.nan,
  ];

  final List<String> paginatedTableHeader = [
    "orderID",
    "customerID",
    "orderDate",
    "freight",
  ];

  Future<List<OrderInfo>> onPageClicked(int page) async {
    // 비동기 작업 (예: 데이터베이스, API 요청)
    return [
      OrderInfo(10001, 'Perry1', DateTime.now(), 100),
      OrderInfo(10001, 'Perry2', DateTime.now(), 100),
      OrderInfo(10001, 'Perry3', DateTime.now(), 100),
      OrderInfo(10001, 'Perry4', DateTime.now(), 100),
      OrderInfo(10001, 'Perry5', DateTime.now(), 100),
    ];
  }

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  void loadData() {
    basicTableData.addAll([
      Employee(10001, 'Jack', 'Manager', 120000, true, 100),
      Employee(10002, 'Perry', 'Project Lead', 80000, true, 90),
      Employee(10003, 'Lara', 'Developer', 45000, false, 80),
      Employee(10004, 'Ellis', 'Developer', 43000, true, 100),
      Employee(10005, 'Adams', 'Developer', 41000, true, 100),
      Employee(10006, 'Owens', 'QA Testing', 40000, true, 100),
      Employee(10007, 'Balnc', 'UX Designer', 39000, true, 100),
      Employee(10008, 'Steve', 'Support', 37000, true, 100),
      Employee(10009, 'Linda', 'Administrator', 36000, true, 100),
      Employee(10010, 'Michael', 'Sales Associate', 35000, true, 100),
    ]);
    paginatedTableData.addAll([
      OrderInfo(10001, 'Jack1', DateTime.now(), 100),
      OrderInfo(10001, 'Jack2', DateTime.now(), 100),
      OrderInfo(10001, 'Jack3', DateTime.now(), 100),
      OrderInfo(10001, 'Jack4', DateTime.now(), 100),
      OrderInfo(10001, 'Jack5', DateTime.now(), 100),
    ]);
  }
}
