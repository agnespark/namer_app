import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:namer_app/main_controller.dart';

class DashboardDetailWidget extends StatelessWidget {
  final String? detailName;
  final MyController controller = MyController();
  DashboardDetailWidget({super.key, this.detailName});

  @override
  Widget build(BuildContext context) {
    return Obx(() => buildContent(controller.currentDetail.value));
  }

  Widget buildContent(name) {
    if (detailName == "loading") {
      return Text(
        "Loading...",
        textAlign: TextAlign.center,
      );
    } else if (detailName == "") {
      return Text("No detail specified");
    } else {
      return Text("Details loaded error");
    }
  }
}
