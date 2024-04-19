import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(top: 120, left: 64, right: 64, bottom: 16),
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              width: 200.0,
              height: 32.0,
              color: Colors.white,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 64, right: 64, bottom: 8),
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              width: Get.width,
              height: 24.0,
              color: Colors.white,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 64, right: 64, bottom: 8),
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              width: Get.width,
              height: 24.0,
              color: Colors.white,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 64, right: 64, bottom: 8),
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              width: Get.width,
              height: 24.0,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
