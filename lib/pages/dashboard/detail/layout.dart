import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:namer_app/component/shimmer/detail_skeleton.dart';
import 'package:namer_app/pages/dashboard/detail/controller.dart';
import 'package:namer_app/pages/dashboard/detail/pages/log_detail.dart';

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
        return DetailSkeleton();
      case 'log':
        return DashboardDetail();
      default:
        return Text('loaded error');
    }
  }
}
