import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:namer_app/config/color.dart';
import 'package:namer_app/pages/table/table_controller.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class TablePage extends StatefulWidget {
  @override
  State<TablePage> createState() => _TablePageState();
}

class _TablePageState extends State<TablePage> {
  final TableController controller = Get.put(TableController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // header
        SizedBox(height: 8),
        _buildDataGrid(),
        // body
        Container(
          height: controller.dataPagerHeight,
          width: Get.width / 3,
          child: Center(
            child: SfDataPagerTheme(
              data: SfDataPagerThemeData(
                itemColor: Colors.white,
                selectedItemColor: Colors.blue,
                // itemBorderRadius: BorderRadius.circular(5),
                // backgroundColor: Colors.teal,
              ),
              // pagination
              child: SfDataPager(
                delegate: controller.dataSource,
                pageCount: (controller.data.length / controller.rowsPerPage)
                    .ceil()
                    .toDouble(),
                direction: Axis.horizontal,
                // onPageNavigationStart: ,
                // onPageNavigationEnd: ,
                // onRowsPerPageChanged: ,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDataGrid() {
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
      ),
      child: SfDataGrid(
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
        columns: <GridColumn>[
          GridColumn(
              width: controller.columnWidths['orderID']!,
              minimumWidth: 50,
              columnName: 'orderID',
              label: Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Order ID',
                    overflow: TextOverflow.ellipsis,
                  ))),
          GridColumn(
              width: controller.columnWidths['customerID']!,
              minimumWidth: 50,
              columnName: 'customerID',
              label: Container(
                  alignment: Alignment.center, child: Text('Customer Name'))),
          GridColumn(
              width: controller.columnWidths['orderDate']!,
              minimumWidth: 50,
              columnName: 'orderDate',
              label: Container(
                  alignment: Alignment.center, child: Text('Order Date'))),
          GridColumn(
              width: controller.columnWidths['freight']!,
              minimumWidth: 50,
              columnName: 'freight',
              label: Container(
                  alignment: Alignment.center, child: Text('Freight'))),
        ],
      ),
    );
  }
}

class DataSource extends DataGridSource {
  DataSource({required List<dynamic> orders}) {
    _orders = orders;
    // _paginatedOrders =
    //     _orders.getRange(0, _rowsPerPage).toList(growable: false);
    buildPaginatedDataGridRows();
  }

  List<dynamic> _orders = [];
  List<dynamic> _paginatedOrders = [];
  final int _rowsPerPage = 5;

  List<DataGridRow> dataGridRows = [];

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
      if (dataGridCell.columnName == 'orderID') {
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
      } else {
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
      }
    }).toList());
  }

  @override
  // Syncfusion DataPager에서 페이지가 변경될 때 호출되는 콜백 함수
  Future<bool> handlePageChange(int oldPageIndex, int newPageIndex) async {
    int startIndex = newPageIndex * _rowsPerPage;
    int endIndex = startIndex + _rowsPerPage;
    if (startIndex < _orders.length) {
      _paginatedOrders =
          _orders.getRange(startIndex, endIndex).toList(growable: false);
    } else {
      _paginatedOrders = [];
    }
    buildPaginatedDataGridRows();
    notifyListeners();
    return true;
  }

  void buildPaginatedDataGridRows() {
    dataGridRows = _paginatedOrders.map<DataGridRow>((dataGridRow) {
      return DataGridRow(cells: [
        DataGridCell(columnName: 'orderID', value: dataGridRow.orderID),
        DataGridCell(columnName: 'customerID', value: dataGridRow.customerID),
        DataGridCell(columnName: 'orderDate', value: dataGridRow.orderDate),
        DataGridCell(columnName: 'freight', value: dataGridRow.freight),
      ]);
    }).toList(growable: false);
  }
}
