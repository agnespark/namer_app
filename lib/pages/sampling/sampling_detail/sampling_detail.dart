import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:namer_app/controller/detailContainer.dart';
import 'package:namer_app/pages/dashboard/dashboard_post/add_log_post.dart';
import 'package:namer_app/pages/dashboard/dashboard_post/population_post.dart';
import 'package:namer_app/pages/sampling/sampling_detail/sampling_log.dart';
import 'package:namer_app/pages/sampling/sampling_detail/sampling_sr.dart';
import 'package:namer_app/pages/sampling/srdocListModal.dart';
import 'package:side_sheet/side_sheet.dart';

class SamplingDetailWidget {
  final DetailController controller = Get.put(DetailController());

  Widget(context) {
    return SideSheet.right(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(() {
            switch (controller.samplingPageName.value) {
              case "sampling_log":
                return SamplingLogDetail();
              case "sampling_sr":
                return SamplingSrDetail();
              case "sampling_log_doc":
                return SamplingLogDetail(isBtn: false);
              case "sampling_sr_doc":
                return SamplingSrDetail(
                  isBtn: false,
                );
              case "population_post":
                return PopulationPost();
              case "add_log_post":
                return AddLogPost();
              case "srdoc_list_sr":
                return srdocListModal(isLog: false);
              case "srdoc_list_log":
                return srdocListModal(isLog: true);
              default:
                return Text('No page found');
            }
          }),
        ),
        context: context,
        width: Get.width * 0.6);
  }
}
