import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:namer_app/component/table/paginated-table/paginated_table_controller.dart';
import 'package:namer_app/config/color.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class PaginatedTable extends StatefulWidget {
  @override
  State<PaginatedTable> createState() => _PaginatedTableState();
}

class _PaginatedTableState extends State<PaginatedTable> {
  final PaginatedTableController controller =
      Get.put(PaginatedTableController());

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double pagerHeight = 60.0;

        return Column(
          children: [
            SizedBox(
              height: constraints.maxHeight - 60,
              child: buildStack(constraints),
            ),
            Container(
              height: pagerHeight,
              child: buildDataPager(),
            ),
          ],
        );
      },
    );
  }

  Widget buildDataGrid() {
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
        allowSorting: true,
        allowFiltering: true,
        // allowMultiColumnSorting: true,
        showColumnHeaderIconOnHover: true,
        // showCheckboxColumn: true,
        // checkboxColumnSettings: DataGridCheckboxColumnSettings(
        //     label: Text('check'), width: 100, showCheckboxOnHeader: false),
        // selectionMode: SelectionMode.multiple,
        allowColumnsResizing: true,
        onColumnResizeStart: (ColumnResizeStartDetails details) {
          if (details.column.columnName == 'orderID') {
            return false;
          }
          return true;
        },
        onColumnResizeUpdate: (ColumnResizeUpdateDetails details) {
          setState(() {
            controller.columnWidths[details.column.columnName] = details.width;
          });
          return true;
        },
        source: controller.dataSource,
        columnWidthMode: ColumnWidthMode.fill,
        headerGridLinesVisibility: GridLinesVisibility.both,
        gridLinesVisibility: GridLinesVisibility.both,
        headerRowHeight: 40,
        rowHeight: 40,
        columns: controller.buildColumns(controller.columnWidths),
        onCellTap: (DataGridCellTapDetails details) {
          print(details.rowColumnIndex.rowIndex);
          // 행을 탭했을 때 호출됩니다.
          // dataSource.handleRowTap(details.rowIndex);
        },
      ),
    );
  }

  Widget buildDataPager() {
    return Container(
      height: 60,
      width: Get.width / 3,
      child: Center(
        child: SfDataPagerTheme(
          data: SfDataPagerThemeData(
            itemColor: Colors.white,
            selectedItemColor: Colors.blue,
          ),
          child: SfDataPager(
            delegate: controller.dataSource,
            pageCount: (controller.data.length / 5).ceil().toDouble(),
            direction: Axis.horizontal,
            onPageNavigationStart: (int pageIndex) {
              setState(() {
                controller.showLoadingIndicator.value = true;
              });
            },
            onPageNavigationEnd: (int pageIndex) {
              setState(() {
                controller.showLoadingIndicator.value = false;
              });
            },
          ),
        ),
      ),
    );
  }

  Widget buildStack(BoxConstraints constraints) {
    List<Widget> _getChildren() {
      final List<Widget> stackChildren = [];
      stackChildren.add(buildDataGrid());

      if (controller.showLoadingIndicator.value) {
        stackChildren.add(Container(
            color: Colors.black12,
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            child: Align(
                alignment: Alignment.center,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                ))));
      }

      return stackChildren;
    }

    return Stack(
      children: _getChildren(),
    );
  }
}

class DataSource extends DataGridSource {
  DataSource({required List<dynamic> datas}) {
    _datas = datas;
    paginatedOrders = datas.getRange(0, rowsPerPage).toList(growable: false);
    buildPaginatedDataGridRows();
  }

  List<dynamic> _datas = [];
  List<dynamic> paginatedOrders = [];
  final int rowsPerPage = 5;
  final List<String> tableHeader = [
    "orderID",
    "customerID",
    "orderDate",
    "freight",
  ];

  List<DataGridRow> dataGridRows = [];

  @override
  List<DataGridRow> get rows => dataGridRows;

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

  @override
  // Syncfusion DataPager에서 페이지가 변경될 때 호출되는 콜백 함수
  Future<bool> handlePageChange(int oldPageIndex, int newPageIndex) async {
    int startIndex = newPageIndex * rowsPerPage;
    int endIndex = startIndex + rowsPerPage;
    if (startIndex < _datas.length && endIndex <= _datas.length) {
      await Future.delayed(Duration(milliseconds: 2000));
      paginatedOrders =
          _datas.getRange(startIndex, endIndex).toList(growable: false);
      buildPaginatedDataGridRows();
      notifyListeners();
    } else {
      paginatedOrders = [];
    }

    return true;
  }

  void buildPaginatedDataGridRows() {
    dataGridRows = paginatedOrders.map<DataGridRow>((dataGridRow) {
      return DataGridRow(cells: [
        DataGridCell(columnName: 'orderID', value: dataGridRow.orderID),
        DataGridCell(columnName: 'customerID', value: dataGridRow.customerID),
        DataGridCell(columnName: 'orderDate', value: dataGridRow.orderDate),
        DataGridCell(columnName: 'freight', value: dataGridRow.freight),
      ]);
    }).toList(growable: false);
  }
}

class OrderInfo {
  final int orderID;
  final String customerID;
  final DateTime orderDate;
  final double freight;

  OrderInfo(this.orderID, this.customerID, this.orderDate, this.freight);

  Map<String, dynamic> toJson() {
    return {
      'orderID': customerID,
      'customerID': customerID,
      'orderDate': orderDate,
      'freight': freight,
    };
  }

  Map<String, dynamic> toMap() {
    return {
      'orderID': orderID,
      'customerID': customerID,
      'orderDate': orderDate,
      'freight': freight,
    };
  }
}
