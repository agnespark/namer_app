// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:namer_app/pages/dashboard/dashboard_detail/dashboard_detail.dart';
import 'package:namer_app/pages/dashboard/dashboard_post/dashboard_post.dart';
import 'package:namer_app/pages/sideSheet/detailContainer.dart';
import 'package:side_sheet/side_sheet.dart';

class DetailWidget {
  final DetailController controller = Get.put(DetailController());

  Widget(context) {
    return SideSheet.right(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(() {
            switch (controller.pageName.value) {
              case "population_post":
                return DashboardPost();
              case "population_detail":
                return DashboardDetail();
              default:
                return Text('No page found');
            }
          }),
        ),
        context: context,
        width: Get.width * 0.6);
  }

  // Widget detailWidget2() {
  //   return Container(
  //       alignment: Alignment.topCenter,
  //       width: Get.width,
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.start,
  //         children: [
  //           Container(
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               crossAxisAlignment: CrossAxisAlignment.center,
  //               children: [
  //                 // 버튼 변경될 내용
  //                 Container(
  //                   child: Stack(children: [
  //                     IconButton(
  //                       onPressed: () {
  //                         controller.changeDetailPage("population_post");
  //                       },
  //                       icon: Icon(Icons.close),
  //                     ),
  //                   ]),
  //                 ),
  //                 Container(
  //                     decoration: ShapeDecoration(
  //                       shape: RoundedRectangleBorder(
  //                         side:
  //                             BorderSide(width: 1.50, color: Color(0xFF148FEF)),
  //                         borderRadius: BorderRadius.circular(5),
  //                       ),
  //                     ),
  //                     child: ButtonWidget('완료', () {}).blue()),
  //               ],
  //             ),
  //           ),
  //           SizedBox(height: 16),
  //           Container(
  //               width: Get.width,
  //               padding: const EdgeInsets.only(
  //                 top: 48,
  //                 left: 56,
  //                 right: 56,
  //                 bottom: 8,
  //               ),
  //               child: Row(
  //                   mainAxisSize: MainAxisSize.min,
  //                   mainAxisAlignment: MainAxisAlignment.start,
  //                   crossAxisAlignment: CrossAxisAlignment.center,
  //                   children: [
  //                     Text(
  //                       //title 변경
  //                       'title',
  //                       style: TextStyle(
  //                         color: Colors.black,
  //                         fontSize: 24,
  //                         fontFamily: 'Noto Sans KR',
  //                       ),
  //                     ),
  //                   ])),
  //           SizedBox(height: 16),
  //           Container(
  //               width: Get.width,
  //               padding: const EdgeInsets.only(
  //                 left: 56,
  //                 right: 56,
  //               ),
  //               child:
  //                   // content 영역
  //                   ButtonWidget('PrevPage', () {
  //                 controller.changeDetailPage('population_post');
  //               }).blue())
  //         ],
  //       ));
  // }
}
