import 'package:flutter/material.dart';
import 'package:namer_app/config/color.dart';
import 'package:shimmer/shimmer.dart';

class TableSkeleton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DataTable(
        headingRowColor: MaterialStatePropertyAll(primaryLight),
        columns: [
          DataColumn(
              label: Expanded(
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                height: 16,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white),
              ),
            ),
          ))
        ],
        rows: [
          for (int i = 0; i < 9; i++) DataRow(cells: [DataCell(shimmerRow())])
        ]);
  }
}

Widget shimmerRow() {
  return Shimmer.fromColors(
    baseColor: Colors.grey.shade300,
    highlightColor: Colors.grey.shade100,
    child: Container(
      height: 16,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Colors.white),
    ),
  );
}
