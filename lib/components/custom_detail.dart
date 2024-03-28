import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('custom'),
        ),
      ],
    );
  }
}

class CustomDetailController extends GetxController {
  var isOverlayVisible = false.obs;

  void showOverlay(bool value) {
    isOverlayVisible.value = value;
  }
}

class CustomDetailOverlay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // 커스텀 디테일을 닫기 위해 CustomDetailController를 사용하여 오버레이를 숨김
        Get.find<CustomDetailController>().showOverlay(false);
      },
      child: Container(
        color: Colors.black.withOpacity(0.5), // 투명도 조절
        child: Center(
          child: Container(
            width: 300,
            height: 300,
            color: Colors.white,
            child: CustomDetail(),
          ),
        ),
      ),
    );
  }
}
