import 'package:flutter/material.dart';
import 'package:namer_app/component/frame.dart';
import 'package:namer_app/global_scaffold_key.dart';
import 'package:namer_app/main_controller.dart';
import "package:get/get.dart";
import 'package:namer_app/pages/sampling/sampling_detail/sampling_detail.dart';

class SamplingPage extends StatelessWidget {
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
                MyController.to
                    .changeDetail(Container(child: SamplingDetail()));
                GlobalScaffoldKey.key.currentState!.openEndDrawer();
              },
              child: Text('Detail'),
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
    return frameWidget(
      'PLC/Sampling/${MyController.to.currentMenu.value}',
      _buildContent(),
    ).Widget();
  }
}
