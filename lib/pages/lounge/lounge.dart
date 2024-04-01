import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:namer_app/pages/lounge/lounge_controller.dart';

class LoungePage extends StatelessWidget {
  const LoungePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoungeController());

    return Scaffold(
      body: Center(
        child: Obx(
          () {
            if (LoungeController.to.status.value == 0) {
              return const CircularProgressIndicator();
            } else if (LoungeController.to.status.value == 1) {
              return ListView.builder(
                itemCount: LoungeController.to.loungeList.length,
                itemBuilder: (context, index) {
                  final lounge = LoungeController.to.loungeList[index];
                  return ListTile(
                    title: SelectableText(lounge.title),
                    subtitle: SelectableText(lounge.content,
                        style: const TextStyle(color: Colors.blue)),
                  );
                },
              );
            } else {
              return SelectableText('오류가 발생했습니다. 잠시 후 다시 시도해주세요.');
            }
          },
        ),
      ),
    );
  }
}
