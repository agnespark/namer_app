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
    'Picco',
    'Frans',
    'Warth',
    'Linod',
    'Simop',
    'Merep',
    'Riscu',
    'Seves',
    'Vaffe',
    'Alfki'
  ];

  final List<String> designations = <String>[
    'Project Lead',
    'Developer',
    'Manager',
    'Designer',
    'System Analyst',
    'CEO'
  ];

  @override
  void onInit() {
    super.onInit();
    _populateEmployeeData(20);
  }

  void _populateEmployeeData(int count) {
    final Random random = Random();
    final List<Employee> employees = List.generate(count, (index) {
      return Employee(
        1000 + index,
        names[random.nextInt(names.length)],
        designations[random.nextInt(designations.length)],
        10000 + random.nextInt(10000),
      );
    });
    employeeDataSource.addMoreRows(employees);
  }

  void addMoreRows(int count) {
    final Random random = Random();
    final List<Employee> newEmployees = List.generate(count, (index) {
      return Employee(
        1000 + employeeDataSource.rows.length + index,
        names[random.nextInt(names.length)],
        designations[random.nextInt(designations.length)],
        10000 + random.nextInt(10000),
      );
    });
    employeeDataSource.addMoreRows(newEmployees);
  }
}
