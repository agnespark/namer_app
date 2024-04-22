import 'package:flutter/material.dart';
import 'package:namer_app/component/button/outline_button.dart';
import 'package:namer_app/component/dialog.dart';
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
    this.isCheckable = false,
    this.isDeletable = false,
  }) : super(key: key);

  final List<String> header;
  final List<double> width;
  final List<dynamic> data;
  final Function(int)? detail;
  final bool isCheckable;
  final bool isDeletable;

  @override
  BasicTableState createState() => BasicTableState();
}

class BasicTableState extends State<BasicTable> {
  late DataSource dataSource;
  final DataGridController dataGridController = DataGridController();

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
        controller: dataGridController,
        rowsPerPage: dataSource._data.length,
        shrinkWrapRows: true,
        columnWidthMode: ColumnWidthMode.fill,
        headerGridLinesVisibility: GridLinesVisibility.both,
        gridLinesVisibility: GridLinesVisibility.both,
        headerRowHeight: 40,
        rowHeight: 40,
        showCheckboxColumn:
            widget.isCheckable | widget.isDeletable ? true : false,
        checkboxColumnSettings: widget.isDeletable
            ? DataGridCheckboxColumnSettings(
                label: Text("삭제"), showCheckboxOnHeader: false)
            : DataGridCheckboxColumnSettings(),
        selectionMode: widget.isCheckable
            ? SelectionMode.multiple
            : widget.isDeletable
                ? SelectionMode.single
                : SelectionMode.none,
        onSelectionChanged:
            (List<DataGridRow> addedRows, List<DataGridRow> removedRows) {
          final index = dataSource._data.indexOf(addedRows.last);
          print(widget.data[index]);
          var selectedIndex = dataGridController.selectedIndex;
          var selectedRow = dataGridController.currentCell;
          var selectedRows = dataGridController.selectedRows;
          // print(selectedIndex);
          // print(selectedRow);
          DialogWidget("삭제하시겠습니까?", () {
            dataGridController.selectedIndex = -1;
          }).delete();
        },
        checkboxShape: CircleBorder(),
        source: dataSource,
        columns: dataSource.buildColumns(),
        onCellTap: (DataGridCellTapDetails details) {
          if (widget.isCheckable) {
            return;
          } else if (widget.isDeletable) {
          } else {
            widget.detail?.call(details.rowColumnIndex.rowIndex);
          }
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
        if (e.columnName == "download") {
          if (e.value == 100) {
            return Container(
                alignment: Alignment.center,
                child: ButtonWidget("다운로드", () {
                  print(e.value);
                }).green());
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

class Employee {
  Employee(this.id, this.name, this.designation, this.salary, this.checked,
      this.download);
  late int id;
  late String name;
  late String designation;
  late int salary;
  late bool checked;
  late int download;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'designation': designation,
      'salary': salary,
      'checked': checked,
      'download': download,
    };
  }
}
