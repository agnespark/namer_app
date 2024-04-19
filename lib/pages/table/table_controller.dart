import 'package:get/get.dart';
import 'package:namer_app/component/table/basic-table/basic_table.dart';

class TableController extends GetxController {
  late dynamic basicTableData = [];
  final List<String> basicTableDataHeader = [
    "orderID",
    "customerID",
    "orderDate",
    "freight"
  ];
  final List<int> basicTableDataWidth = [100, 200, 300, 400];

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  void loadData() {
    basicTableData.addAll([
      Employee(10001, 'Jack', 'Manager', 120000),
      Employee(10002, 'Perry', 'Project Lead', 80000),
      Employee(10003, 'Lara', 'Developer', 45000),
      Employee(10004, 'Ellis', 'Developer', 43000),
      Employee(10005, 'Adams', 'Developer', 41000),
      Employee(10006, 'Owens', 'QA Testing', 40000),
      Employee(10007, 'Balnc', 'UX Designer', 39000),
      Employee(10008, 'Steve', 'Support', 37000),
      Employee(10009, 'Linda', 'Administrator', 36000),
      Employee(10010, 'Michael', 'Sales Associate', 35000),
    ]);
  }
}
