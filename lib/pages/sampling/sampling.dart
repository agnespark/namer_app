import 'package:flutter/material.dart';
import 'package:namer_app/component/detail_sheet.dart';
import 'package:namer_app/component/frame.dart';
import 'package:namer_app/controller/detailContainer.dart';
import 'package:namer_app/main_controller.dart';
import "package:get/get.dart";
import 'package:namer_app/pages/sampling/detail/sampling_sr.dart';

import 'detail/sampling_log.dart';

class SamplingPage extends StatelessWidget {
  final DetailController controller = Get.put(DetailController());

  @override
  Widget build(BuildContext context) {
    // 조건에 따라 적절한 위젯을 반환하는 로컬 함수
    Widget _buildContent() {
      if (MyController.to.favorites.isEmpty) {
        return Column(
          children: [
            Center(
              child: Text('no favorites'),
            ),
            ElevatedButton(
              onPressed: () {
                // controller.sampingDetailPage('sampling_log');
                DetailSheet(child: SamplingLogDetail());
              },
              child: Text('sampling_log'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                DetailSheet(
                    child: SamplingLogDetail(
                  isBtn: false,
                ));
              },
              child: Text('sampling_log_doc'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                DetailSheet(child: SamplingSrDetail());
              },
              child: Text('sampling_sr'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                DetailSheet(
                    child: SamplingSrDetail(
                  isBtn: false,
                ));
              },
              child: Text('sampling_sr_doc'),
            ),
          ],
        );
      } else {
        return ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Obx(
                () => Text(
                    'You have ${MyController.to.favorites.length} favorites:'),
              ),
            ),
            for (var pair in MyController.to.favorites)
              ListTile(
                leading: Icon(Icons.favorite),
                title: Text(pair.asLowerCase),
              ),
          ],
        );
      }
    }

    // frameWidget 함수를 사용하여 전체 페이지를 구성
    return FrameWidget(
      title: 'PLC/Sampling/${MyController.to.currentMenu.value}',
      child: _buildContent(),
    );
  }
}
