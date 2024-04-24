import 'dart:math';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:namer_app/model/employ_model.dart';

class LoadableTableDataGridController extends DataGridSource {
  LoadableTableDataGridController({required this.header}) {}

  List<String> header = [];
  late Function(int) onPageClicked;

  final List<Employee> data = [];
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
    'CEO',
  ];

  late Map<String, double> columnWidths = {
    'ID': double.nan,
    'Name': double.nan,
    'Designation': double.nan,
    'Salary': double.nan,
  };

  void loadData(int count) {
    final Random random = Random();
    final List<Employee> employees = List.generate(count, (index) {
      return Employee(
        1000 + index,
        names[random.nextInt(names.length)],
        designations[random.nextInt(designations.length)],
        10000 + random.nextInt(10000),
        true,
        100,
      );
    });
    addRows(employees);
  }

  void loadMoreData(int count) {
    final Random random = Random();
    final List<Employee> newEmployees = List.generate(count, (index) {
      return Employee(
        1000 + data.length + index,
        names[random.nextInt(names.length)],
        designations[random.nextInt(designations.length)],
        10000 + random.nextInt(10000),
        true,
        100,
      );
    });
    addRows(newEmployees);
  }

  // 행 추가 및 데이터 그리드에 변경사항을 알림
  void addRows(List<Employee> newData) {
    data.addAll(newData);
    notifyListeners();
  }

  @override
  List<DataGridRow> get rows => data.map<DataGridRow>((e) {
        List<DataGridCell> cells = [];
        var dataMap = e.toJson();
        for (var columnName in header) {
          var value = dataMap[columnName.toLowerCase()];
          cells.add(DataGridCell(columnName: columnName, value: value));
        }
        return DataGridRow(cells: cells);
      }).toList();

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
      return MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.center,
            child: Text(
              dataGridCell.value.toString(),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      );
    }).toList());
  }

  Future<void> handleLoadMoreRows() async {
    await Future.delayed(Duration(seconds: 1));
    loadMoreData(10);
  }
}
