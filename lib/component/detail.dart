// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:namer_app/pages/dashboard/dashboard_detail/dashboard_detail.dart';
import 'package:namer_app/pages/dashboard/dashboard_detail/dashboard_sr_detail.dart';
import 'package:namer_app/pages/dashboard/dashboard_post/add_log_post.dart';
import 'package:namer_app/pages/dashboard/dashboard_post/dashboard_post.dart';
import 'package:namer_app/pages/sideSheet/detailContainer.dart';
import 'package:side_sheet/side_sheet.dart';

class DetailWidget {
  final DetailController controller = Get.put(DetailController());

  Widget(context) {
    return SideSheet.right(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(() {
            switch (controller.pageName.value) {
              case "population_post":
                return DashboardPost();
              case "population_detail":
                return DashboardDetail();
              case "population_sr_detail":
                return DashboardSrDetail();
              case "add_log_post":
                return AddLogPost();
              default:
                return Text('No page found');
            }
          }),
        ),
        context: context,
        width: Get.width * 0.6);
  }
}
