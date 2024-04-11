import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingleCheckBoxPage extends StatelessWidget {
  final RxList<String> singleCheckBoxList;
  final RxString selectedSingleCheckBox;

  SingleCheckBoxPage({
    Key? key,
    required this.singleCheckBoxList,
    required this.selectedSingleCheckBox,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (singleCheckBoxList.isEmpty) {
      return Text('-');
    } else {
      return Container(
        child: Wrap(
          children: singleCheckBoxList.map(
            (item) {
              return IntrinsicWidth(
                child: Obx(
                  () {
                    return GestureDetector(
                      child: Center(
                        child: Row(
                          children: [
                            Checkbox(
                              value: selectedSingleCheckBox.value == item,
                              onChanged: (bool? val) {
                                if (val == true) {
                                  selectedSingleCheckBox.value =
                                      (selectedSingleCheckBox.value == item)
                                          ? ''
                                          : item;
                                }
                              },
                            ),
                            Flexible(
                              child: Text(item),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ).toList(),
        ),
      );
    }
  }
}
