import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:namer_app/component/table/basic-table/basic_table.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class BasicTableController extends GetxController {
  final DataSource dataSource = DataSource();

  // head title 이랑 flex 받아와서 세팅
  late Map<String, double> columnWidths = {
    'orderID': double.nan,
    'customerID': double.nan,
    'orderDate': double.nan,
    'freight': double.nan
  };

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  void loadData() {
    final List<Employee> employees = [
      Employee(10001, 'Jack', 'Manager', 120000),
      Employee(10002, 'Perry', 'Project Lead', 80000),
      Employee(10003, 'Lara', 'Developer', 45000),
      Employee(10004, 'Ellis', 'Developer', 43000),
      Employee(10005, 'Adams', 'Developer', 41000),
      Employee(10006, 'Owens', 'QA Testing', 40000),
      Employee(10007, 'Balnc', 'UX Designer', 39000),
      Employee(10008, 'Steve', 'Support', 37000),
      Employee(10009, 'Linda', 'Administrator', 36000),
      Employee(10010, 'Michael', 'Sales Associate', 35000)
    ];
    dataSource.addRows(convertToDataGridRows(employees));
  }

  List<DataGridRow> convertToDataGridRows(List<Employee> employees) {
    return employees.map<DataGridRow>((e) {
      return DataGridRow(cells: [
        DataGridCell<int>(columnName: 'id', value: e.id),
        DataGridCell<String>(columnName: 'name', value: e.name),
        DataGridCell<String>(columnName: 'designation', value: e.designation),
        DataGridCell<int>(columnName: 'salary', value: e.salary),
      ]);
    }).toList();
  }

  // header setting
  List<GridColumn> buildColumns(Map<String, double> columnWidths) {
    return [
      'orderID',
      'customerID',
      'orderDate',
      'freight',
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
