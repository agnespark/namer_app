import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:namer_app/component/depth.dart';
import 'package:namer_app/component/profile.dart';

class FrameWidget extends StatelessWidget {
  const FrameWidget({super.key, required this.title, required this.child});

  final String title;
  final child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: Get.width,
              height: 48,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DepthWidget(title),
                  ProfileWidget(),
                ],
              ),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.black12, width: 1))),
            ),
            Container(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 40),
                child: child),
          ],
        ),
      ),
    );
  }
}
