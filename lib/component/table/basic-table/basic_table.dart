import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:namer_app/component/dialog.dart';
import 'package:namer_app/component/table/basic-table/controller.dart';
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
  late BasicTableController dataSource;
  final DataGridController dataGridController = DataGridController();

  @override
  void initState() {
    super.initState();
    dataSource = BasicTableController(
      header: widget.header,
      data: widget.data,
      detail: widget.detail,
    );
    dataSource.columnWidths = <String, double>{}.obs;
    for (int i = 0; i < widget.header.length; i++) {
      dataSource.columnWidths[widget.header[i]] = widget.width[i];
    }
  }

  @override
  Widget build(BuildContext context) {
    return buildDataGrid();
  }

  Widget buildDataGrid() {
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
          child: Obx(() {
            return SfDataGrid(
              allowColumnsResizing: true,
              onColumnResizeStart: (ColumnResizeStartDetails details) {
                print(details.columnIndex);
                if (details.columnIndex == 0 ||
                    details.columnIndex == widget.header.length - 1) {
                  return false;
                }
                return true;
              },
              onColumnResizeUpdate: (ColumnResizeUpdateDetails details) {
                dataSource.columnWidths[details.column.columnName] =
                    details.width;
                print(details.width);
                return true;
              },
              controller: dataGridController,
              rowsPerPage: dataSource.data.length,
              source: dataSource,
              shrinkWrapRows: true,
              columnWidthMode: ColumnWidthMode.fill,
              headerGridLinesVisibility: GridLinesVisibility.both,
              gridLinesVisibility: GridLinesVisibility.both,
              headerRowHeight: 40,
              rowHeight: 40,
              columns: dataSource.buildColumns(dataSource.columnWidths),
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
}
