import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:namer_app/component/shimmer/loading.dart';
import 'package:namer_app/controller/detailContainer.dart';
import 'package:namer_app/pages/dashboard/detail/log_detail.dart';

class DashboardDetailWidget extends StatelessWidget {
  DashboardDetailWidget({super.key});

  final DetailController controller = Get.find<DetailController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => buildContent(controller.pageName.value));
  }

  Widget buildContent(String? name) {
    switch (name) {
      case 'loading':
        return LoadingPage();
      case 'log':
        return DashboardDetail();
      default:
        return Text('loaded error');
    }
  }
}
