import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:namer_app/config/color.dart';
import 'package:shimmer/shimmer.dart';

class TableSkeleton {
  const TableSkeleton({required this.count});
  final int count;
  Widget() {
    print(Get.width * 0.6 / count / 2);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
          headingRowColor: MaterialStatePropertyAll(primaryLight),
          dataRowMinHeight: 39,
          columns: List.generate(
              count,
              (index) => DataColumn(
                      label: Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      width: 100,
                      height: 16,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white),
                    ),
                  ))),
          rows: List.generate(
            10,
            (index) => DataRow(
                cells: List.generate(
              count,
              (cellIndex) => DataCell(shimmerRow()),
            )),
          )),
    );
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
