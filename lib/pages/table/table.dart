import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class TablePage extends StatefulWidget {
  @override
  State<TablePage> createState() => _TablePageState();
}

class _TablePageState extends State<TablePage> {
  List<OrderInfo> _orders = [];

  late OrderInfoDataSource _orderInfoDataSource;

  final int _rowsPerPage = 5;

  final double _dataPagerHeight = 60.0;

  @override
  void initState() {
    super.initState();
    _orders = getOrders();
    _orderInfoDataSource = OrderInfoDataSource(orders: _orders);
  }

  List<OrderInfo> getOrders() {
    return [
      OrderInfo(10001, 'James', DateTime.now(), 200.0),
      OrderInfo(10002, 'Kathryn', DateTime.now(), 300.0),
      OrderInfo(10003, 'Lara', DateTime.now(), 150.0),
      OrderInfo(10004, 'Michael', DateTime.now(), 150.0),
      OrderInfo(10005, 'Martin', DateTime.now(), 150.0),
      OrderInfo(10006, 'Newberry', DateTime.now(), 150.0),
      OrderInfo(10007, 'Balnc', DateTime.now(), 150.0),
      OrderInfo(10008, 'Perry', DateTime.now(), 150.0),
      OrderInfo(10009, 'Gable', DateTime.now(), 150.0),
      OrderInfo(10010, 'Grimes', DateTime.now(), 150.0),
      OrderInfo(10001, 'a', DateTime.now(), 200.0),
      OrderInfo(10002, 'b', DateTime.now(), 300.0),
      OrderInfo(10003, 'c', DateTime.now(), 150.0),
      OrderInfo(10004, 'd', DateTime.now(), 150.0),
      OrderInfo(10005, 'e', DateTime.now(), 150.0),
      OrderInfo(10006, 'f', DateTime.now(), 150.0),
      OrderInfo(10007, 'g', DateTime.now(), 150.0),
      OrderInfo(10008, 'h', DateTime.now(), 150.0),
      OrderInfo(10009, 'i', DateTime.now(), 150.0),
      OrderInfo(10010, 'j', DateTime.now(), 150.0)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Syncfusion DataGrid'),
      ),
      body: LayoutBuilder(builder: (context, constraint) {
        return Column(children: [
          SizedBox(
              height: constraint.maxHeight - _dataPagerHeight,
              width: constraint.maxWidth,
              child: _buildDataGrid(constraint)),
          Container(
              height: _dataPagerHeight,
              child: SfDataPager(
                delegate: _orderInfoDataSource,
                pageCount: (_orders.length / _rowsPerPage).ceil().toDouble(),
                direction: Axis.horizontal,
              ))
        ]);
      }),
    );
  }

  Widget _buildDataGrid(BoxConstraints constraint) {
    return SfDataGrid(
        source: _orderInfoDataSource,
        columnWidthMode: ColumnWidthMode.fill,
        headerGridLinesVisibility: GridLinesVisibility.both,
        gridLinesVisibility: GridLinesVisibility.both,
        columns: <GridColumn>[
          GridColumn(
              columnName: 'orderID',
              label: Container(
                  padding: EdgeInsets.all(16.0),
                  alignment: Alignment.center,
                  child: Text(
                    'Order ID',
                    overflow: TextOverflow.ellipsis,
                  ))),
          GridColumn(
              columnName: 'customerID',
              label: Container(
                  padding: EdgeInsets.all(16.0),
                  alignment: Alignment.center,
                  child: Text('Customer Name'))),
          GridColumn(
              columnName: 'orderDate',
              label: Container(
                  padding: EdgeInsets.all(16.0),
                  alignment: Alignment.center,
                  child: Text('Order Date'))),
          GridColumn(
              columnName: 'freight',
              label: Container(
                  padding: EdgeInsets.all(16.0),
                  alignment: Alignment.center,
                  child: Text('Freight'))),
        ]);
  }
}

class OrderInfoDataSource extends DataGridSource {
  OrderInfoDataSource({required List<OrderInfo> orders}) {
    _orders = orders;
    // _paginatedOrders =
    //     _orders.getRange(0, _rowsPerPage).toList(growable: false);
    // buildPaginatedDataGridRows();
  }

  List<OrderInfo> _orders = [];
  List<OrderInfo> _paginatedOrders = [];
  final int _rowsPerPage = 5;

  List<DataGridRow> dataGridRows = [];

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
      if (dataGridCell.columnName == 'orderID') {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          alignment: Alignment.center,
          child: Text(
            dataGridCell.value.toString(),
            overflow: TextOverflow.ellipsis,
          ),
        );
      } else if (dataGridCell.columnName == 'customerID') {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          alignment: Alignment.center,
          child: Text(
            dataGridCell.value.toString(),
            overflow: TextOverflow.ellipsis,
          ),
        );
      } else if (dataGridCell.columnName == 'orderDate') {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          alignment: Alignment.center,
          child: Text(
            dataGridCell.value.toString(),
            overflow: TextOverflow.ellipsis,
          ),
        );
      } else {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          alignment: Alignment.center,
          child: Text(
            dataGridCell.value.toString(),
            overflow: TextOverflow.ellipsis,
          ),
        );
      }
    }).toList());
  }

  @override
  // Syncfusion DataPager에서 페이지가 변경될 때 호출되는 콜백 함수
  Future<bool> handlePageChange(int oldPageIndex, int newPageIndex) async {
    int startIndex = newPageIndex * _rowsPerPage;
    if (startIndex < _orders.length) {
      _paginatedOrders = _orders.skip(startIndex).take(_rowsPerPage).toList();
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

class OrderInfo {
  final int orderID;
  final String customerID;
  final DateTime orderDate;
  final double freight;

  OrderInfo(this.orderID, this.customerID, this.orderDate, this.freight);
}
