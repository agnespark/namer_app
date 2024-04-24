import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:namer_app/component/shimmer/detail_skeleton.dart';
import 'package:namer_app/pages/population/detail/controller.dart';
import 'package:namer_app/pages/population/detail/pages/create_multi_complete.dart';
import 'package:namer_app/pages/population/detail/pages/create_multi_log.dart';
import 'package:namer_app/pages/population/detail/pages/log.dart';
import 'package:namer_app/pages/population/detail/pages/select_multi_log.dart';
import 'package:namer_app/pages/population/detail/pages/population_srdocList.dart';

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
        return DetailSkeleton();
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
