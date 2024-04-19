// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:namer_app/component/table/basic-table/basic_table.dart';
// import 'package:syncfusion_flutter_datagrid/datagrid.dart';

// class BasicTableController extends GetxController {
//   final DataSource dataSource = DataSource();

//   @override
//   void onInit() {
//     super.onInit();
//     loadData();
//   }

//   void loadData() {
//     dataSource.addRows(convertToDataGridRows());
//   }

//   List<DataGridRow> convertToDataGridRows() {
//     return data.map<DataGridRow>((row) {
//       return DataGridRow(cells: [
//         for (int i = 0; i < row.length; i++)
//           DataGridCell<dynamic>(columnName: '$i', value: row[i]),
//       ]);
//     }).toList();
//   }

//   List<GridColumn> buildColumns(List<String> header, List<double> widths) {
//     return List.generate(header.length, (index) {
//       return buildColumn(header[index], index, widths[index]);
//     });
//   }

//   GridColumn buildColumn(String columnName, int index, double width) {
//     return GridColumn(
//       columnName: '$index',
//       label: Container(
//         alignment: Alignment.center,
//         padding: const EdgeInsets.all(8.0),
//         child: Text(
//           columnName,
//           overflow: TextOverflow.ellipsis,
//         ),
//       ),
//       width: width,
//     );
//   }
// }

// class Employee {
//   Employee(this.id, this.name, this.designation, this.salary);
//   final int id;
//   final String name;
//   final String designation;
//   final int salary;
// }
