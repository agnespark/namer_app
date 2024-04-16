import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:namer_app/component/textfield/search-textfield.dart';
import 'package:namer_app/config/color.dart';
import 'package:namer_app/config/themes.dart';
import 'package:namer_app/pages/sap/sap_controller.dart';

class SapPage extends StatelessWidget {
  const SapPage({Key? key});

  @override
  Widget build(BuildContext context) {
    final SapController controller = Get.put(SapController());
    return Container(
      height: 280,
      child: Obx(() {
        return Row(
          children: [
            _buildTableList(controller.beforeTableList,
                controller.selectedBeforeTableIndex, controller),
            _buildButtonColumn(controller),
            _buildTableList(controller.afterTableList,
                controller.selectedAfterTableIndex, controller,
                isAfter: true),
          ],
        );
      }),
    );
  }

  Widget _buildTableList(
      RxList<String> tableList, RxInt selectedIndex, SapController controller,
      {bool isAfter = false}) {
    return Container(
      width: 300,
      height: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            isAfter ? '포함 테이블' : '테이블 검색',
            style: Themes.light.textTheme.bodyMedium,
          ),
          const SizedBox(height: 8),
          SearchTextField(
            hintText: isAfter ? "포함 테이블 검색" : "테이블 검색",
            onChanged: (value) {
              controller.filterTableList(value);
            },
          ),
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
              child: ListView.builder(
                itemCount: tableList.length,
                itemBuilder: (context, index) {
                  return MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        if (isAfter) {
                          controller.selectedAfterTableIndex.value = index;
                        } else {
                          controller.selectedBeforeTableIndex.value = index;
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        color: selectedIndex.value == index
                            ? grayLight
                            : Colors.transparent,
                        padding: EdgeInsets.all(8),
                        child: Text(tableList[index]),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtonColumn(SapController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        height: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 70),
            _buildButton(
              onTap: controller.RightButtonClicked,
              iconAsset: 'assets/icons/MdOutlineArrowDropDownCircle.svg',
              angle: pi,
            ),
            _buildButton(
              onTap: controller.LeftButtonClicked,
              iconAsset: 'assets/icons/MdOutlineArrowDropDownCircle.svg',
            ),
            SizedBox(height: 20),
            _buildButton(
              onTap: controller.DoubleRightButtonClicked,
              iconAsset: 'assets/icons/MdDoubleArrow.svg',
              angle: pi,
            ),
            SizedBox(height: 3),
            _buildButton(
              onTap: controller.DoubleLeftButtonClicked,
              iconAsset: 'assets/icons/MdDoubleArrow.svg',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(
      {VoidCallback? onTap, String? iconAsset, double angle = 0}) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Transform.rotate(
          angle: angle,
          child: SvgPicture.asset(
            iconAsset!,
            height: 24,
            width: 24,
          ),
        ),
      ),
    );
  }
}
