import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:namer_app/component/shimmer/loading.dart';
import 'package:namer_app/pages/population/detail/detail_controller.dart';
import 'package:namer_app/pages/population/detail/create_multi_complete.dart';
import 'package:namer_app/pages/population/detail/create_multi_log.dart';
import 'package:namer_app/pages/population/detail/log.dart';
import 'package:namer_app/pages/population/detail/select_multi_log.dart';
import 'package:namer_app/pages/population/detail/population_srdocList.dart';

class PopulationDetailWidget extends StatelessWidget {
  PopulationDetailWidget({super.key});

  final PopulationDetailController controller =
      Get.find<PopulationDetailController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => buildContent(controller.pageName.value));
  }

  Widget buildContent(String? name) {
    switch (name) {
      case "loading":
        return DetailLoadingPage();
      case "select":
        return SelectMultiLog();
      case "multi_create":
        return CreateMultiLog();
      case "multi_complete":
        return CreateMultiComplelet();
      case "srdocList":
        return PopulationSrdocList();
      case "log":
        return LogDetail();
      default:
        return Text("Details loaded error");
    }
  }
}
