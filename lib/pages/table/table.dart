import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:namer_app/component/table/basic-table/basic_table.dart';
import 'package:namer_app/component/table/loadable-table/loadable_table.dart';
import 'package:namer_app/component/table/paginated-table/paginated_table.dart';
import 'package:namer_app/pages/table/table_controller.dart';

class TablePage extends StatefulWidget {
  @override
  State<TablePage> createState() => _TablePageState();
}

class _TablePageState extends State<TablePage> {
  final TableController controller = Get.put(TableController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        PaginatedTable(),
        SizedBox(height: 50),
        BasicTable(),
        SizedBox(height: 50),
        LoadableTable()
      ],
    ));
  }
}
