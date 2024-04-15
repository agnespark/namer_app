import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:namer_app/component/textfield/search-textfield.dart';
import 'package:namer_app/config/color.dart';
import 'package:namer_app/config/themes.dart';
import 'package:namer_app/pages/sap/sap_controller.dart';

class SapPage extends StatelessWidget {
  const SapPage({super.key});

  @override
  Widget build(BuildContext context) {
    final SapController controller = Get.put(SapController());
    return Container(
      height: 280,
      child: Obx(() {
        return Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 300,
              height: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('테이블 검색', style: Themes.light.textTheme.bodyMedium),
                  const SizedBox(height: 8),
                  SearchTextField(hintText: "Table Search"),
                  const SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    height: 200,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          color: borderColor,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...List.generate(
                            controller.beforeTableList.length,
                            (index) => MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                onTap: () {
                                  controller.selectedBeforeTableIndex.value =
                                      index;
                                },
                                child: Container(
                                  width: double.infinity,
                                  color: controller
                                              .selectedBeforeTableIndex.value ==
                                          index
                                      ? grayLight
                                      : Colors.transparent,
                                  padding: EdgeInsets.all(8),
                                  child:
                                      Text(controller.beforeTableList[index]),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // 버튼
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Container(
                height: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 70),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          // 1. 첫 번째 버튼 클릭 시 beforeTableList에서 선택된 항목을 afterTableList로 추가합니다.
                          if (controller.selectedBeforeTableIndex.value != -1) {
                            String selectedItem = controller.beforeTableList[
                                controller.selectedBeforeTableIndex.value];
                            if (!controller.afterTableList
                                .contains(selectedItem)) {
                              controller.afterTableList.add(selectedItem);
                              controller.beforeTableList.removeAt(
                                  controller.selectedBeforeTableIndex.value);
                            }
                          }
                        },
                        child: Transform.rotate(
                          angle: pi,
                          child: SvgPicture.asset(
                            'assets/icons/MdOutlineArrowDropDownCircle.svg',
                            height: 24,
                            width: 24,
                          ),
                        ),
                      ),
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          // 2. 두 번째 버튼 클릭 시 afterTableList에서 선택된 항목을 beforeTableList로 이동합니다.
                          if (controller.selectedAfterTotalTableIndex.value !=
                              -1) {
                            String selectedItem = controller.afterTableList[
                                controller.selectedAfterTotalTableIndex.value];
                            if (!controller.beforeTableList
                                .contains(selectedItem)) {
                              controller.beforeTableList.add(selectedItem);
                              controller.afterTableList.removeAt(controller
                                  .selectedAfterTotalTableIndex.value);
                            }
                          }
                        },
                        child: SvgPicture.asset(
                          'assets/icons/MdOutlineArrowDropDownCircle.svg',
                          height: 24,
                          width: 24,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Transform.rotate(
                      angle: pi,
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {
                            // 3. 세 번째 버튼 클릭 시 beforeTableList의 모든 항목을 afterTableList로 이동합니다.
                            controller.afterTableList.clear();
                            controller.afterTableList
                                .addAll(controller.beforeTableList);
                            controller.beforeTableList.clear();
                          },
                          child: SvgPicture.asset(
                            'assets/icons/MdDoubleArrow.svg',
                            height: 20,
                            width: 20,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 3),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          // 4. 네 번째 버튼 클릭 시 afterTableList의 모든 항목을 beforeTableList로 이동합니다.
                          controller.beforeTableList.clear();
                          controller.beforeTableList
                              .addAll(controller.afterTableList);
                          controller.afterTableList.clear();
                        },
                        child: SvgPicture.asset(
                          'assets/icons/MdDoubleArrow.svg',
                          height: 20,
                          width: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 300,
              height: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('포함 테이블', style: Themes.light.textTheme.bodyMedium),
                  Container(
                    width: double.infinity,
                    height: 200,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color: borderColor,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...List.generate(
                            controller.afterTableList.length,
                            (index) => MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                onTap: () {
                                  controller.selectedAfterTotalTableIndex
                                      .value = index;
                                },
                                child: Container(
                                  width: double.infinity,
                                  color: controller.selectedAfterTotalTableIndex
                                              .value ==
                                          index
                                      ? grayLight
                                      : Colors.transparent,
                                  padding: EdgeInsets.all(8),
                                  child:
                                      Text(controller.beforeTableList[index]),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
