import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:namer_app/component/shimmer/loading.dart';
import 'package:namer_app/pages/dashboard/detail/detail_controller.dart';
import 'package:namer_app/pages/dashboard/detail/log_detail.dart';

class DashboardDetailWidget extends StatelessWidget {
  DashboardDetailWidget({super.key});

  final DashboardDetailController controller =
      Get.find<DashboardDetailController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => buildContent(controller.pageName.value));
  }

  Widget buildContent(String? name) {
    switch (name) {
      case 'loading':
        return DetailLoadingPage();
      case 'log':
        return DashboardDetail();
      default:
        return Text('loaded error');
    }
  }
}
