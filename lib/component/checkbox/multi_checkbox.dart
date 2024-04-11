import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MultiCheckBoxPage extends StatelessWidget {
  final RxList<String> checkBoxList;
  final RxList<String> selectedCheckBox;
  const MultiCheckBoxPage({
    Key? key,
    required this.checkBoxList,
    required this.selectedCheckBox,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (checkBoxList.isEmpty) {
      return Text('-');
    } else {
      return Obx(() {
        return Container(
          child: Wrap(
            children: checkBoxList.map(
              (item) {
                return IntrinsicWidth(
                  child: GestureDetector(
                    child: Center(
                      child: Row(
                        children: [
                          Checkbox(
                            value: selectedCheckBox.contains(item),
                            onChanged: (bool? val) {
                              if (val != null) {
                                if (item.contains("ALL")) {
                                  // 'All' 체크박스의 경우
                                  if (val) {
                                    // 모두 선택
                                    selectedCheckBox.clear();
                                    selectedCheckBox.addAll(checkBoxList);
                                  } else {
                                    // 모두 해제
                                    selectedCheckBox.clear();
                                  }
                                } else {
                                  // 'All'이 아닌 경우 해당 체크박스의 상태만 업데이트
                                  if (val) {
                                    selectedCheckBox.add(item);
                                  } else {
                                    selectedCheckBox.remove(item);
                                  }

                                  if (selectedCheckBox.contains('ALL') &&
                                      !val) {
                                    selectedCheckBox.remove('ALL');
                                  }
                                }
                              }
                            },
                          ),
                          Flexible(
                            child: Text(item),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ).toList(),
          ),
        );
      });
    }
  }
}
