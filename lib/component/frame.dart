import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:namer_app/component/depth.dart';
import 'package:namer_app/component/profile.dart';

class FrameWidget extends StatelessWidget {
  const FrameWidget({super.key, required this.title, required this.body});

  final String title;
  final body;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: Get.width,
          height: 48,
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 32.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // depth 넣기
              DepthWidget(title).buildWidget(),
              // profile 넣기
              ProfileWidget().Widget(),
            ],
          ),
          decoration: BoxDecoration(
              border:
                  Border(bottom: BorderSide(color: Colors.black12, width: 1))),
        ),
        Expanded(child: body),
      ],
    );
  }
}
