import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:namer_app/component/table/loadable-table/loadable_table.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

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

  late Map<String, double> columnWidths = {
    'ID': double.nan,
    'Name': double.nan,
    'Designation': double.nan,
    'Salary': double.nan
  };

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

  List<GridColumn> buildColumns(Map<String, double> columnWidths) {
    return [
      'ID',
      'Name',
      'Designation',
      'Salary',
    ]
        .map((columnName) => buildColumn(columnName, columnName, columnWidths))
        .toList();
  }

  GridColumn buildColumn(
      String columnName, String label, Map<String, double> columnWidths) {
    double width = columnName == 'orderID' ? 100 : columnWidths[columnName]!;
    return GridColumn(
      width: width,
      autoFitPadding: EdgeInsets.all(10.0),
      minimumWidth: 50,
      maximumWidth: Get.width / 2,
      columnName: columnName,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          label,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
