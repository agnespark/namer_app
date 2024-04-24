import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:namer_app/component/shimmer/loading.dart';
import 'package:namer_app/pages/sampling/detail/controller.dart';
import 'package:namer_app/pages/sampling/detail/sampling_log.dart';

class SamplingDetailWidget extends StatelessWidget {
  SamplingDetailWidget({super.key});

  final SamplingDetailController controller = SamplingDetailController();

  @override
  Widget build(BuildContext context) {
    return Obx(() => buildContent(controller.pageName.value));
  }

  Widget buildContent(String? name) {
    switch (name) {
      case "loading":
        return DetailLoadingPage();
      case "sampling_log":
        return SamplingLogDetail();
      default:
        return Text('Details loaded error');
    }
  }
}
