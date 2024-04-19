import 'package:flutter/material.dart';
import 'package:namer_app/component/detail_sheet.dart';
import 'package:namer_app/config/color.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class BasicTable extends StatefulWidget {
  BasicTable({
    Key? key,
    required this.header,
    required this.width,
    required this.data,
    this.detail,
  }) : super(key: key);

  final List<String> header;
  final List<double> width;
  final List<dynamic> data;
  final Function(int)? detail;

  @override
  BasicTableState createState() => BasicTableState();
}

class BasicTableState extends State<BasicTable> {
  late DataSource dataSource;

  @override
  void initState() {
    super.initState();
    dataSource = DataSource(
      header: widget.header,
      width: widget.width,
      data: widget.data,
      detail: widget.detail,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SfDataGridTheme(
      data: SfDataGridThemeData(
          rowHoverColor: grayLight,
          rowHoverTextStyle: TextStyle(
            color: blackTextColor,
            fontSize: 14,
          ),
          headerColor: primaryLight,
          headerHoverColor: Colors.transparent,
          columnResizeIndicatorColor: primaryMain,
          columnResizeIndicatorStrokeWidth: 2.0,
          gridLineColor: borderColor),
      child: SfDataGrid(
        rowsPerPage: dataSource._data.length,
        shrinkWrapRows: true,
        columnWidthMode: ColumnWidthMode.fill,
        headerGridLinesVisibility: GridLinesVisibility.both,
        gridLinesVisibility: GridLinesVisibility.both,
        headerRowHeight: 40,
        rowHeight: 40,
        source: dataSource,
        columns: dataSource.buildColumns(),
        onCellTap: (DataGridCellTapDetails details) {
          widget.detail?.call(details.rowColumnIndex.rowIndex);
        },
      ),
    );
  }
}

class DataSource extends DataGridSource {
  DataSource({
    required this.header,
    required this.width,
    required this.data,
    this.detail,
  }) {
    _data = convertToDataGridRows();
  }

  final List<String> header;
  final List<double> width;
  final List<dynamic> data;
  final Function(int)? detail;

  List<DataGridRow> _data = [];

  List<DataGridRow> convertToDataGridRows() {
    return data.map<DataGridRow>((row) {
      if (row is Map<String, dynamic>) {
        // If the row is a Map, assume it is already in the correct format
        List<DataGridCell<dynamic>> cells = [];
        row.forEach((key, value) {
          cells.add(DataGridCell<dynamic>(columnName: key, value: value));
        });
        return DataGridRow(cells: cells);
      } else if (row is Employee) {
        // If the row is an object, convert it to a Map
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

  List<GridColumn> buildColumns() {
    List<GridColumn> columns = [];
    for (int i = 0; i < header.length; i++) {
      columns.add(
        GridColumn(
          columnName: '$i',
          label: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8.0),
            child: Text(
              header[i],
              overflow: TextOverflow.ellipsis,
            ),
          ),
          width: width[i],
        ),
      );
    }

    return columns;
  }

  @override
  List<DataGridRow> get rows => _data;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    final rowIndex = _data.indexOf(row);
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((e) {
        if (e.value is bool) {
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

class Employee {
  Employee(this.id, this.name, this.designation, this.salary, this.checked);
  late int id;
  late String name;
  late String designation;
  late int salary;
  late bool checked;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'designation': designation,
      'salary': salary,
      'checked': checked,
    };
  }
}
