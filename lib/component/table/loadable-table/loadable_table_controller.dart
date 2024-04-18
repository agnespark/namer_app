import 'dart:math';

import 'package:get/get.dart';
import 'package:namer_app/component/table/loadable-table/loadable_table.dart';

class LoadableTableController extends GetxController {
  final EmployeeDataSource employeeDataSource = EmployeeDataSource();

  final List<String> names = <String>[
    'Welli',
    'Blonp',
    'Folko',
    'Furip',
    'Folig',
  ];

  final List<String> designations = <String>[
    'Project Lead',
    'Developer',
    'Manager',
    'Designer',
    'CEO'
  ];

  @override
  void onInit() {
    super.onInit();
    loadData(20);
  }

  void loadData(int count) {
    final Random random = Random();
    final List<Employee> employees = List.generate(count, (index) {
      return Employee(
        1000 + index,
        names[random.nextInt(names.length)],
        designations[random.nextInt(designations.length)],
        10000 + random.nextInt(10000),
      );
    });
    employeeDataSource.addRows(employees);
  }

  // 새로운 데이터를 생성하여 EmployeeDataSource에 전달하고, 새로운 데이터를 그리드에 추가하는 역할
  void loadMoreData(int count) {
    final Random random = Random();
    final List<Employee> newEmployees = List.generate(count, (index) {
      return Employee(
        1000 + employeeDataSource.rows.length + index,
        names[random.nextInt(names.length)],
        designations[random.nextInt(designations.length)],
        10000 + random.nextInt(10000),
      );
    });
    employeeDataSource.addRows(newEmployees);
  }
}
