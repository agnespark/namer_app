import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:namer_app/component/table/basic-table/basic_table_controller.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class BasicTable extends StatelessWidget {
  const BasicTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BasicTableController>(
      init: BasicTableController(),
      builder: (controller) {
        return Container(
          child: SfDataGrid(
            source: controller.employeeDataSource,
            columnWidthMode: ColumnWidthMode.auto,
            columns: <GridColumn>[
              GridColumn(
                columnName: 'id',
                label: Container(
                  padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: const Text('ID'),
                ),
              ),
              GridColumn(
                columnName: 'name',
                label: Container(
                  padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: const Text('Name'),
                ),
              ),
              GridColumn(
                columnName: 'designation',
                label: Container(
                  padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: const Text(
                    'Designation',
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              GridColumn(
                columnName: 'salary',
                label: Container(
                  padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: const Text('Salary'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class EmployeeDataSource extends DataGridSource {
  List<DataGridRow> _employeeData = [];

  void addRows(List<DataGridRow> rows) {
    _employeeData.addAll(rows);
    notifyListeners();
  }

  @override
  List<DataGridRow> get rows => _employeeData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((e) {
        return Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: Text(e.value.toString()),
        );
      }).toList(),
    );
  }
}
