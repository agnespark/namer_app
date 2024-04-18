import 'package:get/get.dart';
import 'package:namer_app/component/table/basic-table/basic_table.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class BasicTableController extends GetxController {
  final EmployeeDataSource employeeDataSource = EmployeeDataSource();

  @override
  void onInit() {
    super.onInit();
    _populateEmployeeData();
  }

  void _populateEmployeeData() {
    final List<Employee> employees = [
      Employee(10001, 'Jack', 'Manager', 120000),
      Employee(10002, 'Perry', 'Project Lead', 80000),
      Employee(10003, 'Lara', 'Developer', 45000),
      Employee(10004, 'Ellis', 'Developer', 43000),
      Employee(10005, 'Adams', 'Developer', 41000),
      Employee(10006, 'Owens', 'QA Testing', 40000),
      Employee(10007, 'Balnc', 'UX Designer', 39000),
      Employee(10008, 'Steve', 'Support', 37000),
      Employee(10009, 'Linda', 'Administrator', 36000),
      Employee(10010, 'Michael', 'Sales Associate', 35000)
    ];
    employeeDataSource.addRows(_convertToDataGridRows(employees));
  }

  List<DataGridRow> _convertToDataGridRows(List<Employee> employees) {
    return employees.map<DataGridRow>((e) {
      return DataGridRow(cells: [
        DataGridCell<int>(columnName: 'id', value: e.id),
        DataGridCell<String>(columnName: 'name', value: e.name),
        DataGridCell<String>(columnName: 'designation', value: e.designation),
        DataGridCell<int>(columnName: 'salary', value: e.salary),
      ]);
    }).toList();
  }

  void addEmployeeData(List<Employee> newData) {
    employeeDataSource.addRows(_convertToDataGridRows(newData));
  }
}
