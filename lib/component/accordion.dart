import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:namer_app/component/filter/filter-row/filter_row.dart';
import 'package:namer_app/component/textarea/info-textarea.dart';
import 'package:namer_app/component/textfield/basic-textfield.dart';
import 'package:namer_app/config/color.dart';
import 'package:namer_app/config/themes.dart';

class Accordion extends StatelessWidget {
  const Accordion({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: borderColor), // 왼쪽 오른쪽 border 추가
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          listTileTheme: ListTileTheme.of(context)
              .copyWith(dense: true, minVerticalPadding: 1),
        ),
        child: ExpansionTile(
          shape: RoundedRectangleBorder(
            side: BorderSide.none,
          ),
          title: Text(
            "키워드로 검색",
            style: Themes.light.textTheme.titleMedium,
          ),
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  InfoTextAreaPage(content: "hi".obs),
                  SizedBox(
                    height: 10,
                  ),
                  FilterRow(
                    title: "Search1",
                    body: BasicTextField(
                      hintText: "hint text1",
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FilterRow(
                    title: "Search2",
                    body: BasicTextField(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FilterRow(
                    title: "Search3",
                    body: BasicTextField(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FilterRow(
                    title: "Search4",
                    body: BasicTextField(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FilterRow(
                    title: "Search5",
                    body: BasicTextField(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
