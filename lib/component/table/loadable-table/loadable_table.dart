import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:namer_app/component/table/loadable-table/loadable_table_controller.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class LoadableTable extends StatefulWidget {
  LoadableTable({Key? key}) : super(key: key);

  @override
  _LoadableTableState createState() => _LoadableTableState();
}

class _LoadableTableState extends State<LoadableTable> {
  final LoadableTableController controller = Get.put(LoadableTableController());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SfDataGrid(
        source: controller.employeeDataSource,
        loadMoreViewBuilder: (BuildContext context, LoadMoreRows loadMoreRows) {
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
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: BorderDirectional(
                      top: BorderSide(
                        width: 1.0,
                        color: Color.fromRGBO(0, 0, 0, 0.26),
                      ),
                    ),
                  ),
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
      ),
    );
  }
}

class EmployeeDataSource extends DataGridSource {
  final List<Employee> _employeeData = [];

  @override
  List<DataGridRow> get rows => _employeeData.map<DataGridRow>((e) {
        return DataGridRow(cells: [
          DataGridCell<int>(columnName: 'id', value: e.id),
          DataGridCell<String>(columnName: 'name', value: e.name),
          DataGridCell<String>(columnName: 'designation', value: e.designation),
          DataGridCell<int>(columnName: 'salary', value: e.salary),
        ]);
      }).toList();

  void addMoreRows(List<Employee> newData) {
    _employeeData.addAll(newData);
    // 데이터가 업데이트되었음을 알려야 합니다.
    notifyListeners();
  }

  Future<void> handleLoadMoreRows() async {
    await Future.delayed(Duration(seconds: 5));
    // 수정된 부분: 컨트롤러를 통해 데이터 추가
    Get.find<LoadableTableController>().addMoreRows(10);
  }

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((e) {
        return Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(e.value.toString()),
        );
      }).toList(),
    );
  }
}

class Employee {
  Employee(this.id, this.name, this.designation, this.salary);

  final int id;
  final String name;
  final String designation;
  final int salary;
}
