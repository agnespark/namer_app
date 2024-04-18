import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:namer_app/pages/table/table.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class TableController extends GetxController {
  late RxList<dynamic> data;
  late DataSource dataSource;

  final int rowsPerPage = 5;
  final double dataPagerHeight = 60.0;

  late RxMap<String, double> columnWidths = {
    'orderID': double.nan,
    'customerID': double.nan,
    'orderDate': double.nan,
    'freight': double.nan
  }.obs;

  @override
  void onInit() {
    super.onInit();
    data = getOrders();
    dataSource = DataSource(orders: data);
  }

  // load data
  RxList<dynamic> getOrders() {
    return List.generate(
      30,
      (index) => OrderInfo(
        index + 10001,
        String.fromCharCode('a'.codeUnitAt(0) + index),
        DateTime.now(),
        150.0,
      ),
    ).obs;
  }

  // header setting
  List<GridColumn> buildColumns(Map<String, double> columnWidths) {
    return [
      'orderID',
      'customerID',
      'orderDate',
      'freight',
    ]
        .map((columnName) => buildColumn(columnName, columnName, columnWidths))
        .toList();
  }

  GridColumn buildColumn(
      String columnName, String label, Map<String, double> columnWidths) {
    return GridColumn(
      width: columnWidths[columnName]!,
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

// 모델 예시
class OrderInfo {
  final int orderID;
  final String customerID;
  final DateTime orderDate;
  final double freight;

  OrderInfo(this.orderID, this.customerID, this.orderDate, this.freight);
}
