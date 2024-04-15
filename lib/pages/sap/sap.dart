import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:namer_app/component/textfield/search-textfield.dart';
import 'package:namer_app/config/color.dart';
import 'package:namer_app/config/themes.dart';

class SapPage extends StatelessWidget {
  const SapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 292,
      padding: const EdgeInsets.symmetric(horizontal: 58, vertical: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 300,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
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
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [],
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
                  SizedBox(height: 55),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {},
                      child: SvgPicture.asset(
                        'assets/icons/MdOutlineArrowDropDownCircle.svg',
                        height: 24,
                        width: 24,
                      ),
                    ),
                  ),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {},
                      child: Transform.rotate(
                        angle: pi, // 180도 회전
                        child: SvgPicture.asset(
                          'assets/icons/MdOutlineArrowDropDownCircle.svg',
                          height: 24,
                          width: 24,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Transform.rotate(
                    angle: pi, // 180도 회전
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {},
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
                      onTap: () {},
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
                  padding: const EdgeInsets.all(16),
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
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
