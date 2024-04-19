import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:namer_app/component/table/basic-table/basic_table_controller.dart';
import 'package:namer_app/config/color.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class BasicTable extends StatelessWidget {
  BasicTable(
      {Key? key, required this.data, required this.width, required this.header})
      : super(key: key);
  final BasicTableController controller = Get.put(BasicTableController());
  final List<String> header;
  final List<dynamic> data;
  final List<int> width;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SfDataGridTheme(
            data: SfDataGridThemeData(gridLineColor: borderColor),
            child: SfDataGrid(
              columnWidthMode: ColumnWidthMode.fill,
              headerGridLinesVisibility: GridLinesVisibility.both,
              gridLinesVisibility: GridLinesVisibility.both,
              source: controller.dataSource,
              columns: controller.buildColumns(controller.columnWidths),
            ),
          );
        },
      ),
    );
  }
}

class DataSource extends DataGridSource {
  List<DataGridRow> data = [];

  void addRows(List<DataGridRow> rows) {
    data.addAll(rows);
    notifyListeners();
  }

  @override
  List<DataGridRow> get rows => data;

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

class Employee {
  Employee(this.id, this.name, this.designation, this.salary);
  final int id;
  final String name;
  final String designation;
  final int salary;
}
