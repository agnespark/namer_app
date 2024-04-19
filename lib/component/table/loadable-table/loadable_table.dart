import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:namer_app/component/table/loadable-table/loadable_table_controller.dart';
import 'package:namer_app/config/color.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class LoadableTable extends StatefulWidget {
  LoadableTable({Key? key}) : super(key: key);

  @override
  _LoadableTableState createState() => _LoadableTableState();
}

class _LoadableTableState extends State<LoadableTable> {
  final LoadableTableController controller = Get.put(LoadableTableController());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SfDataGridTheme(
        data: SfDataGridThemeData(gridLineColor: borderColor),
        child: SfDataGrid(
          columnWidthMode: ColumnWidthMode.fill,
          headerGridLinesVisibility: GridLinesVisibility.both,
          gridLinesVisibility: GridLinesVisibility.both,
          source: controller.employeeDataSource,
          loadMoreViewBuilder:
              (BuildContext context, LoadMoreRows loadMoreRows) {
            Future<String> loadRows() async {
              await loadMoreRows();
              return 'Completed';
            }

            return FutureBuilder<String>(
              initialData: 'loading',
              future: loadRows(),
              builder: (context, snapshot) {
                if (snapshot.data == 'loading') {
                  return Container(
                    height: 60.0,
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return SizedBox.fromSize(size: Size.zero);
                }
              },
            );
          },
          columns: controller.buildColumns(controller.columnWidths),
        ),
      ),
    );
  }
}

class EmployeeDataSource extends DataGridSource {
  final List<Employee> employeeData = [];

  @override
  List<DataGridRow> get rows => employeeData.map<DataGridRow>((e) {
        return DataGridRow(cells: [
          DataGridCell<int>(columnName: 'id', value: e.id),
          DataGridCell<String>(columnName: 'name', value: e.name),
          DataGridCell<String>(columnName: 'designation', value: e.designation),
          DataGridCell<int>(columnName: 'salary', value: e.salary),
        ]);
      }).toList();

  // datagrid에 표시되는 행을 추가하는 역할. 그리드의 데이터를 변경하고, 변경사항을 리스너에 알림
  void addRows(List<Employee> newData) {
    employeeData.addAll(newData);
    notifyListeners();
  }

  Future<void> handleLoadMoreRows() async {
    await Future.delayed(Duration(seconds: 1));
    Get.find<LoadableTableController>().loadMoreData(10);
  }

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((e) {
        return Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(e.value.toString()),
        );
      }).toList(),
    );
  }
}

class Employee {
  Employee(this.id, this.name, this.designation, this.salary);

  final int id;
  final String name;
  final String designation;
  final int salary;
}
