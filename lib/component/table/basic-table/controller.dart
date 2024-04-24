import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:namer_app/component/button/outline_button.dart';
import 'package:namer_app/model/employ_model.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class BasicTableController extends DataGridSource {
  BasicTableController({
    required this.header,
    required this.data,
    this.detail,
  }) {
    _data = convertToDataGridRows();
  }

  List<String> header = [];
  List<dynamic> data = [];
  final Function(int)? detail;
  RxBool showLoadingIndicator = true.obs;

  List<DataGridRow> _data = [];

  late RxMap<String, double> columnWidths;

  List<DataGridRow> convertToDataGridRows() {
    return data.map<DataGridRow>((row) {
      if (row is Map<String, dynamic>) {
        List<DataGridCell<dynamic>> cells = [];
        row.forEach((key, value) {
          cells.add(DataGridCell<dynamic>(columnName: key, value: value));
        });
        return DataGridRow(cells: cells);
      } else if (row is Employee) {
        List<DataGridCell<dynamic>> cells = [];
        Map<String, dynamic> rowData = row.toJson();
        rowData.forEach((key, value) {
          cells.add(DataGridCell<dynamic>(columnName: key, value: value));
        });
        return DataGridRow(cells: cells);
      }
      return DataGridRow(cells: []);
    }).toList();
  }

  List<GridColumn> buildColumns(Map<String, double> columnWidths) {
    return header
        .map((columnName) => buildColumn(columnName, columnName, columnWidths))
        .toList();
  }

  GridColumn buildColumn(
      String columnName, String label, Map<String, double> columnWidths) {
    return GridColumn(
      width: columnWidths[columnName]!,
      autoFitPadding: EdgeInsets.all(10),
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

  @override
  List<DataGridRow> get rows => _data;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    final rowIndex = _data.indexOf(row);
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((e) {
        if (e.columnName == "download") {
          if (e.value == 100) {
            return Container(
                alignment: Alignment.center,
                child: ButtonWidget("다운로드", () {}).green());
          } else {
            return Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(8.0),
              child: Text("${e.value.toString()}%"),
            );
          }
        } else if (e.value is bool) {
          final isChecked = ValueNotifier<bool>(e.value as bool);
          return ValueListenableBuilder<bool>(
            valueListenable: isChecked,
            builder: (context, value, child) {
              return Checkbox(
                value: value,
                onChanged: (newValue) {
                  isChecked.value = newValue!;
                  final employee = data[rowIndex];
                  employee.checked = newValue;
                },
              );
            },
          );
        } else {
          return MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(8.0),
              child: Text(e.value.toString()),
            ),
          );
        }
      }).toList(),
    );
  }
}
