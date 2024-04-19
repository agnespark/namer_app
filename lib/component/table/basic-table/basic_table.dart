import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class BasicTable extends StatefulWidget {
  BasicTable({
    Key? key,
    required this.header,
    required this.width,
    required this.data,
  }) : super(key: key);

  final List<String> header;
  final List<double> width;
  final List<dynamic> data;

  @override
  BasicTableState createState() => BasicTableState();
}

class BasicTableState extends State<BasicTable> {
  late DataSource dataSource;

  @override
  void initState() {
    super.initState();
    dataSource = DataSource(
      header: widget.header,
      width: widget.width,
      data: widget.data,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SfDataGrid(
        source: dataSource,
        columnWidthMode: ColumnWidthMode.auto,
        columns: dataSource.buildColumns(),
      ),
    );
  }
}

class DataSource extends DataGridSource {
  DataSource({
    required this.header,
    required this.width,
    required this.data,
  }) {
    _data = convertToDataGridRows();
  }

  final List<String> header;
  final List<double> width;
  final List<dynamic> data;

  List<DataGridRow> _data = [];

  List<DataGridRow> convertToDataGridRows() {
    return data.map<DataGridRow>((row) {
      if (row is Map<String, dynamic>) {
        // If the row is a Map, assume it is already in the correct format
        List<DataGridCell<dynamic>> cells = [];
        row.forEach((key, value) {
          cells.add(DataGridCell<dynamic>(columnName: key, value: value));
        });
        return DataGridRow(cells: cells);
      } else if (row is Employee) {
        // If the row is an Employee object, convert it to a Map
        List<DataGridCell<dynamic>> cells = [];
        Map<String, dynamic> rowData = row.toJson();
        rowData.forEach((key, value) {
          cells.add(DataGridCell<dynamic>(columnName: key, value: value));
        });
        return DataGridRow(cells: cells);
      }
      // Handle other data types as needed
      return DataGridRow(cells: []);
    }).toList();
  }

  List<GridColumn> buildColumns() {
    return List.generate(header.length, (index) {
      return GridColumn(
        columnName: '$index',
        label: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: Text(
            header[index],
            overflow: TextOverflow.ellipsis,
          ),
        ),
        width: width[index],
      );
    });
  }

  @override
  List<DataGridRow> get rows => _data;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((e) {
        return Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
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

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'designation': designation,
      'salary': salary,
    };
  }
}
