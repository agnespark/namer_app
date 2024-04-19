import 'package:get/get.dart';
import 'package:namer_app/component/table/basic-table/basic_table.dart';

class PopulationController extends GetxController {
  late RxList<Employee> basicTableData = RxList();
  final List<String> basicTableDataHeader = [
    "orderID",
    "customerID",
    "orderDate",
    "freight",
    "check"
  ];
  final List<double> basicTableDataWidth = [
    100,
    double.nan,
    double.nan,
    double.nan,
    double.nan
  ];

  RxInt rowIndex = 0.obs;

  void rowClick(int index) {
    print('rowclick');
    rowIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  void loadData() {
    basicTableData.addAll([
      Employee(10001, 'Jack', 'Manager', 120000, true),
      Employee(10002, 'Perry', 'Project Lead', 80000, true),
      Employee(10003, 'Lara', 'Developer', 45000, false),
      Employee(10004, 'Ellis', 'Developer', 43000, true),
      Employee(10005, 'Adams', 'Developer', 41000, true),
      Employee(10006, 'Owens', 'QA Testing', 40000, true),
      Employee(10007, 'Balnc', 'UX Designer', 39000, true),
      Employee(10008, 'Steve', 'Support', 37000, true),
      Employee(10009, 'Linda', 'Administrator', 36000, true),
      Employee(10010, 'Michael', 'Sales Associate', 35000, true),
    ]);
  }
}
