import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:namer_app/component/dialog.dart';
import 'package:namer_app/component/table/basic-table/basic_table_controller.dart';
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
    this.isDeletable = true,
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
  late BasicTableController dataSource;
  late RxMap<String, double> columnWidths;
  final DataGridController dataGridController = DataGridController();

  @override
  void initState() {
    super.initState();
    dataSource = BasicTableController(
      header: widget.header,
      data: widget.data,
      detail: widget.detail,
    );
    columnWidths = <String, double>{}.obs;
    for (int i = 0; i < widget.header.length; i++) {
      columnWidths[widget.header[i]] = widget.width[i];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Expanded(
        child: SfDataGridTheme(
          data: SfDataGridThemeData(
              rowHoverColor: grayLight,
              rowHoverTextStyle: TextStyle(
                color: blackTextColor,
                fontSize: 14,
              ),
              headerColor: primaryLight,
              headerHoverColor: Colors.transparent,
              columnResizeIndicatorColor: primaryMain,
              columnResizeIndicatorStrokeWidth: 2,
              gridLineColor: borderColor),
          child: Builder(builder: (context) {
            return SfDataGrid(
              allowColumnsResizing: true,
              onColumnResizeStart: (ColumnResizeStartDetails details) {
                return true;
              },
              onColumnResizeUpdate: (ColumnResizeUpdateDetails details) {
                columnWidths[details.column.columnName] = details.width;
                return true;
              },
              controller: dataGridController,
              source: dataSource,
              rowsPerPage: dataSource.data.length,
              shrinkWrapRows: true,
              columnWidthMode: ColumnWidthMode.fill,
              headerGridLinesVisibility: GridLinesVisibility.both,
              gridLinesVisibility: GridLinesVisibility.both,
              headerRowHeight: 40,
              rowHeight: 40,
              columns: buildColumns(columnWidths),
              showCheckboxColumn: widget.isCheckable ? true : false,
              selectionMode: widget.isCheckable
                  ? SelectionMode.multiple
                  : SelectionMode.none,
              onCellTap: (DataGridCellTapDetails details) {
                if (widget.isCheckable) {
                  return;
                } else if (widget.isDeletable) {
                } else {
                  widget.detail?.call(details.rowColumnIndex.rowIndex);
                }
              },
            );
          }),
        ),
      ),
      if (widget.isDeletable)
        SizedBox(
          width: 40,
          child: ListView.builder(
              itemCount: widget.data.length + 1,
              itemBuilder: (context, index) {
                if (index == 0)
                  return IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.delete,
                        color: Colors.transparent,
                      ));
                return IconButton(
                  onPressed: () {
                    DialogWidget("삭제하시겠습니까?", () {
                      dataGridController.selectedIndex = -1;
                    }).delete();
                  },
                  icon: Icon(Icons.do_disturb_on_outlined),
                  color: redMain,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                );
              }),
        ),
    ]);
  }

  List<GridColumn> buildColumns(Map<String, double> columnWidths) {
    return widget.header
        .map((columnName) => buildColumn(columnName, columnName, columnWidths))
        .toList();
  }

  GridColumn buildColumn(
      String columnName, String label, Map<String, double> columnWidths) {
    double width = columnWidths[columnName]!;
    return GridColumn(
      width: width,
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
}
