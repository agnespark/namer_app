import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:namer_app/component/dialog.dart';
import 'package:namer_app/component/shimmer/table_skeleton.dart';
import 'package:namer_app/component/table/paginated-table/paginated_table_controller.dart';
import 'package:namer_app/config/color.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class PaginatedTable extends StatefulWidget {
  PaginatedTable({
    Key? key,
    required this.header,
    required this.width,
    required this.data,
    required this.rowsPerPage,
    required this.totalPage,
    required this.onPageClicked,
    this.detail,
    this.isCheckable = false,
    this.isDeletable = true,
  }) : super(key: key);

  final List<String> header;
  final List<double> width;
  final List<dynamic> data;
  final int rowsPerPage;
  final int totalPage;
  final Function(int) onPageClicked;
  final Function(int)? detail;
  final bool isCheckable;
  final bool isDeletable;

  @override
  State<PaginatedTable> createState() => _PaginatedTableState();
}

class _PaginatedTableState extends State<PaginatedTable> {
  late PaginatedTableController dataSource;
  late RxMap<String, double> columnWidths;
  final DataGridController dataGridController = DataGridController();

  RxBool showLoadingIndicator = true.obs;

  @override
  void initState() {
    super.initState();
    dataSource = PaginatedTableController(
      datas: widget.data,
      header: widget.header,
      rowsPerPage: widget.rowsPerPage,
      totalPage: widget.totalPage,
      onPageClicked: widget.onPageClicked,
      showLoadingIndicator: showLoadingIndicator,
    );
    columnWidths = <String, double>{}.obs;
    for (int i = 0; i < widget.header.length; i++) {
      columnWidths[widget.header[i]] = widget.width[i];
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Obx(() {
          return Column(
            children: [
              Expanded(
                child: showLoadingIndicator.value
                    ? TableSkeleton()
                    : buildDataGrid(),
              ),
              Container(
                height: 60,
                child: buildDataPager(),
              ),
            ],
          );
        });
      },
    );
  }

  Widget buildDataGrid() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
            child: SfDataGrid(
              allowSorting: true,
              allowFiltering: true,
              showColumnHeaderIconOnHover: true,
              allowColumnsResizing: true,
              onColumnResizeStart: (ColumnResizeStartDetails details) {
                if (details.columnIndex == 0 ||
                    details.columnIndex == widget.header.length - 1) {
                  return false;
                }
                return true;
              },
              onColumnResizeUpdate: (ColumnResizeUpdateDetails details) {
                columnWidths[details.column.columnName] = details.width;
                return true;
              },
              source: dataSource,
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
            ),
          ),
        ),
        if (widget.isDeletable)
          SizedBox(
            width: 40,
            child: ListView.builder(
                itemCount: widget.rowsPerPage + 1,
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
      ],
    );
  }

  List<GridColumn> buildColumns(Map<String, double> columnWidths) {
    return widget.header
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

  Widget buildDataPager() {
    return Container(
      width: Get.width / 3,
      child: Center(
        child: SfDataPagerTheme(
          data: SfDataPagerThemeData(
            itemColor: Colors.white,
            selectedItemColor: Colors.blue,
          ),
          child: SfDataPager(
            delegate: dataSource,
            pageCount: widget.totalPage.toDouble(),
            direction: Axis.horizontal,
            onPageNavigationStart: (int pageIndex) {
              showLoadingIndicator.value = true;
            },
            onPageNavigationEnd: (int pageIndex) {
              showLoadingIndicator.value = false;
            },
          ),
        ),
      ),
    );
  }
}
