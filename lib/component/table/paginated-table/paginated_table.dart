import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:namer_app/component/dialog.dart';
import 'package:namer_app/config/color.dart';
import 'package:shimmer/shimmer.dart';
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
    this.detail,
    this.isCheckable = false,
    this.isDeletable = false,
  }) : super(key: key);

  final List<String> header;
  final List<double> width;
  final List<dynamic> data;
  final int rowsPerPage;
  final int totalPage;
  final Function(int)? detail;
  final bool isCheckable;
  final bool isDeletable;

  @override
  State<PaginatedTable> createState() => _PaginatedTableState();
}

class _PaginatedTableState extends State<PaginatedTable> {
  late DataSource dataSource;
  late RxMap<String, double> columnWidths;
  RxBool showLoadingIndicator = true.obs;
  final DataGridController dataGridController = DataGridController();

  @override
  void initState() {
    super.initState();
    dataSource = DataSource(
      datas: widget.data,
      header: widget.header,
      rowsPerPage: widget.rowsPerPage,
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
        final double pagerHeight = 60.0;

        return Obx(() {
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
        });
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
        showCheckboxColumn:
            widget.isCheckable | widget.isDeletable ? true : false,
        checkboxColumnSettings: widget.isDeletable
            ? DataGridCheckboxColumnSettings(
                label: Text("삭제"), showCheckboxOnHeader: false)
            : DataGridCheckboxColumnSettings(),
        selectionMode: widget.isCheckable
            ? SelectionMode.multiple
            : widget.isDeletable
                ? SelectionMode.single
                : SelectionMode.none,
        onSelectionChanged:
            (List<DataGridRow> addedRows, List<DataGridRow> removedRows) {
          var selectedIndex = dataGridController.selectedIndex;
          var selectedRow = dataGridController.currentCell;
          var selectedRows = dataGridController.selectedRows;
          // print(selectedIndex);
          // print(selectedRow);
          DialogWidget("삭제하시겠습니까?", () {
            dataGridController.selectedIndex = -1;
          }).delete();
        },
        checkboxShape: CircleBorder(),
        onCellTap: (DataGridCellTapDetails details) {
          if (widget.isCheckable) {
            return;
          } else if (widget.isDeletable) {
          } else {
            widget.detail?.call(details.rowColumnIndex.rowIndex);
          }
        },
      ),
    );
  }

  List<GridColumn> buildColumns(Map<String, double> columnWidths) {
    return widget.header
        .map((columnName) => buildColumn(columnName, columnName, columnWidths))
        .toList();
  }

  GridColumn buildColumn(
      String columnName, String label, Map<String, double> columnWidths) {
    double width = columnName == 'orderID' ? 100 : columnWidths[columnName]!;
    return GridColumn(
      width: width,
      autoFitPadding: EdgeInsets.all(10.0),
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
      height: 60,
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

  Widget buildStack(BoxConstraints constraints) {
    List<Widget> _getChildren() {
      final List<Widget> stackChildren = [];
      stackChildren.add(buildDataGrid());

      if (showLoadingIndicator.value) {
        stackChildren.add(
          Shimmer.fromColors(
            baseColor: Colors.red,
            highlightColor: Colors.blue,
            child: Container(
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              color: Colors.white,
            ),
          ),
        );
      }

      return stackChildren;
    }

    return Stack(
      children: _getChildren(),
    );
  }
}

class DataSource extends DataGridSource {
  DataSource(
      {required List<dynamic> datas,
      required List<String> header,
      required int rowsPerPage}) {
    // print(datas);
    _datas = datas;
    _rowsPerPage = rowsPerPage;
    _header = header;
    paginatedOrders = datas.getRange(0, _rowsPerPage).toList(growable: false);
    buildPaginatedDataGridRows(_header);
  }

  int _rowsPerPage = 0;
  List<String> _header = [];
  List<dynamic> _datas = [];
  List<dynamic> paginatedOrders = [];

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
    int startIndex = newPageIndex * _rowsPerPage;
    int endIndex = startIndex + _rowsPerPage;
    if (startIndex < _datas.length && endIndex <= _datas.length) {
      await Future.delayed(Duration(milliseconds: 1000));
      paginatedOrders =
          _datas.getRange(startIndex, endIndex).toList(growable: false);
      buildPaginatedDataGridRows(_header);
      notifyListeners();
    } else {
      paginatedOrders = [];
    }

    return true;
  }

  void buildPaginatedDataGridRows(List<String> _header) {
    dataGridRows = paginatedOrders.map<DataGridRow>((dataGridRow) {
      List<DataGridCell> cells = [];
      var dataMap = (dataGridRow as OrderInfo).toMap();
      print(dataMap);

      for (var columnName in _header) {
        print(columnName);
        print(dataMap[columnName]);
        var value = dataMap[columnName.toLowerCase()];
        print(value);

        cells.add(DataGridCell(columnName: columnName, value: value));
      }

      return DataGridRow(cells: cells);
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
      'orderID': orderID,
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
