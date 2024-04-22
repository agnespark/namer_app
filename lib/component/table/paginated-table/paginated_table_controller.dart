// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:namer_app/component/table/paginated-table/paginated_table.dart';
// import 'package:syncfusion_flutter_datagrid/datagrid.dart';

// class PaginatedTableController extends GetxController {
//   late RxList<dynamic> data;
//   late DataSource dataSource;

//   RxBool showLoadingIndicator = true.obs;

//   // head title 이랑 flex 받아와서 세팅
//   late Map<String, double> columnWidths = {
//     'orderID': double.nan,
//     'customerID': double.nan,
//     'orderDate': double.nan,
//     'freight': double.nan
//   };

//   final List<String> tableHeader = [
//     "orderID",
//     "customerID",
//     "orderDate",
//     "freight",
//   ];

//   @override
//   void onInit() {
//     super.onInit();
//     data = getOrders();
//     dataSource = DataSource(datas: data);
//   }

//   // load data - 데이터 받아와서 세팅
//   RxList<dynamic> getOrders() {
//     return List.generate(
//       30,
//       (index) => OrderInfo(
//         index + 10001,
//         String.fromCharCode('a'.codeUnitAt(0) + index),
//         DateTime.now(),
//         150.0,
//       ),
//     ).obs;
//   }

//   // header setting
//   List<GridColumn> buildColumns(Map<String, double> columnWidths) {
//     return [
//       'orderID',
//       'customerID',
//       'orderDate',
//       'freight',
//     ]
//         .map((columnName) => buildColumn(columnName, columnName, columnWidths))
//         .toList();
//   }

//   GridColumn buildColumn(
//       String columnName, String label, Map<String, double> columnWidths) {
//     double width = columnName == 'orderID' ? 100 : columnWidths[columnName]!;
//     return GridColumn(
//       width: width,
//       autoFitPadding: EdgeInsets.all(10.0),
//       minimumWidth: 50,
//       maximumWidth: Get.width / 2,
//       columnName: columnName,
//       label: Container(
//         alignment: Alignment.center,
//         child: Text(
//           label,
//           overflow: TextOverflow.ellipsis,
//         ),
//       ),
//     );
//   }
// }
