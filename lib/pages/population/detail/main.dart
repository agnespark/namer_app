import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:namer_app/controller/detailContainer.dart';
import 'package:namer_app/pages/population/detail/create_multi_complete.dart';
import 'package:namer_app/pages/population/detail/create_multi_log.dart';
import 'package:namer_app/pages/population/detail/select_multi_log.dart';
import 'package:namer_app/pages/population/detail/population_srdocList.dart';

class PopulationDetailWidget extends StatelessWidget {
  PopulationDetailWidget({super.key});

  final DetailController controller = Get.find<DetailController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => buildContent(controller.pageName.value));
  }

  Widget buildContent(String? name) {
    switch (name) {
      case "loading":
        return Text("Loading...", textAlign: TextAlign.center);
      case "select":
        return SelectMultiLog();
      case "multi_create":
        return CreateMultiLog();
      case "multi_complete":
        return CreateMultiComplelet();
      case "srdocList":
        return PopulationSrdocList();
      default:
        return Text("Details loaded error");
    }
  }
}
