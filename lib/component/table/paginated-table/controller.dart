import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class PaginatedTableController extends DataGridSource {
  PaginatedTableController({
    required this.header,
    required this.datas,
    required this.rowsPerPage,
    required this.totalPage,
    required this.onPageClicked,
  }) {
    dataPerPage = datas.getRange(0, rowsPerPage).toList();
    buildPaginatedDataGridRows(header);
  }
  final DataPagerController dataPagerController = DataPagerController();

  int rowsPerPage = 0;
  int totalPage = 0;
  List<String> header = [];
  List<dynamic> datas = [];
  List<dynamic> dataPerPage = [];
  late Function(int) onPageClicked;
  RxBool showLoadingIndicator = true.obs;

  List<DataGridRow> dataGridRows = [];

  late RxMap<String, double> columnWidths;

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

  List<GridColumn> buildColumns(Map<String, double> columnWidths) {
    return header
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

  @override
  // Syncfusion DataPager에서 페이지가 변경될 때 호출되는 콜백 함수
  Future<bool> handlePageChange(int oldPageIndex, int newPageIndex) async {
    showLoadingIndicator.value = true;
    await Future.delayed(Duration(milliseconds: 1000));

    int startIndex = newPageIndex * rowsPerPage;
    int endIndex = startIndex + rowsPerPage;
    if (newPageIndex != 0) {
      var additionalData = await onPageClicked(startIndex);
      if (additionalData is List) {
        datas.addAll(additionalData);
      }
    }

    if (startIndex < datas.length && endIndex <= datas.length) {
      dataPerPage = datas.getRange(startIndex, endIndex).toList();
      buildPaginatedDataGridRows(header);
      notifyListeners();
    } else {
      dataPerPage = [];
    }

    return true;
  }

  void buildPaginatedDataGridRows(List<String> header) {
    dataGridRows = dataPerPage.map<DataGridRow>((dataGridRow) {
      List<DataGridCell> cells = [];
      var dataMap = dataGridRow.toJson();
      for (var columnName in header) {
        var value = dataMap[columnName];
        cells.add(DataGridCell(columnName: columnName, value: value));
      }
      return DataGridRow(cells: cells);
    }).toList();
  }
}
