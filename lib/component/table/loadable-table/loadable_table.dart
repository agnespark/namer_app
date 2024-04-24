import 'dart:async';
import 'package:flutter/material.dart';
import 'package:namer_app/component/table/loadable-table/loadable_table_controller.dart';
import 'package:namer_app/config/color.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class LoadableTable extends StatefulWidget {
  LoadableTable({Key? key, required this.header}) : super(key: key);

  final List<String> header;

  @override
  _LoadableTableState createState() => _LoadableTableState();
}

class _LoadableTableState extends State<LoadableTable> {
  late LoadableTableDataGridController dataSource;

  @override
  void initState() {
    super.initState();
    dataSource = LoadableTableDataGridController(
      header: widget.header,
    );
    dataSource.loadData(20);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SfDataGridTheme(
        data: SfDataGridThemeData(gridLineColor: borderColor),
        child: SfDataGrid(
          columnWidthMode: ColumnWidthMode.fill,
          headerGridLinesVisibility: GridLinesVisibility.both,
          gridLinesVisibility: GridLinesVisibility.both,
          source: dataSource,
          loadMoreViewBuilder:
              (BuildContext context, LoadMoreRows loadMoreRows) {
            Future<String> loadRows() async {
              await loadMoreRows();
              return 'Completed';
            }

            return FutureBuilder<String>(
              initialData: 'loading',
              future: loadRows(),
              builder: (context, snapshot) {
                if (snapshot.data == 'loading') {
                  return Container(
                    height: 60.0,
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return SizedBox.fromSize(size: Size.zero);
                }
              },
            );
          },
          columns: <GridColumn>[
            GridColumn(
              columnName: 'id',
              label: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                alignment: Alignment.center,
                child: Text('ID'),
              ),
            ),
            GridColumn(
              columnName: 'name',
              label: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                alignment: Alignment.center,
                child: Text('Name'),
              ),
            ),
            GridColumn(
              width: 120.0,
              columnName: 'designation',
              label: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                alignment: Alignment.center,
                child: Text(
                  'Designation',
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            GridColumn(
              columnName: 'salary',
              label: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                alignment: Alignment.center,
                child: Text('Salary'),
              ),
            ),
          ],
          onCellTap: (DataGridCellTapDetails details) {
            // dataSource.handleRowTap(details.rowIndex);
          },
        ),
      ),
    );
  }
}
