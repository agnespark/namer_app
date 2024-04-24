import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:namer_app/component/table/basic-table/basic_table_widget.dart';
import 'package:namer_app/component/table/loadable-table/loadable_table_widget.dart';
import 'package:namer_app/component/table/paginated-table/paginated_table_widget.dart';
import 'package:namer_app/pages/table/table_controller.dart';

class TablePage extends StatefulWidget {
  @override
  State<TablePage> createState() => _TablePageState();
}

class _TablePageState extends State<TablePage> {
  final TableController controller = Get.put(TableController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PaginatedTableWidget(
            data: controller.paginatedTableData,
            header: controller.paginatedTableHeader,
            width: controller.paginatedTableDataWidth,
            rowsPerPage: controller.rowsPerPage,
            totalPage: controller.totalPage,
            onPageClicked: controller.onPageClicked,
          ),
        ),
        SizedBox(height: 50),
        Expanded(
          child: BasicTableWidget(
            data: controller.basicTableData,
            header: controller.basicTableDataHeader,
            width: controller.basicTableDataWidth,
          ),
        ),
        SizedBox(height: 50),
        LoadableTableWidget(header: controller.loadableDataHeader)
      ],
    );
  }
}
