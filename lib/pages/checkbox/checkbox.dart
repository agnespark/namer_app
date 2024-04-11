import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckBoxPage extends StatefulWidget {
  final RxList<String> checkBoxList;
  final RxList<bool> selectedCheckBox;
  const CheckBoxPage(
      {Key? key, required this.checkBoxList, required this.selectedCheckBox})
      : super(key: key);

  @override
  _CheckBoxPageState createState() => _CheckBoxPageState();
}

class _CheckBoxPageState extends State<CheckBoxPage> {
  @override
  Widget build(BuildContext context) {
    if (widget.checkBoxList.isEmpty) {
      return Text('-');
    } else {
      return ListView(
        shrinkWrap: true,
        children: [
          Wrap(
            children: widget.checkBoxList.map(
              (item) {
                var index = widget.checkBoxList.indexOf(item);
                return IntrinsicWidth(
                  child: Obx(
                    () {
                      return GestureDetector(
                        child: Center(
                          child: Row(
                            children: [
                              Checkbox(
                                value: widget.selectedCheckBox[index],
                                onChanged: (bool? val) {
                                  if (val != null) {
                                    if (index == 0) {
                                      // 'All' 체크박스의 경우
                                      for (int i = 0;
                                          i < widget.selectedCheckBox.length;
                                          i++) {
                                        widget.selectedCheckBox[i] = val;
                                      }
                                    } else {
                                      // 'All'이 아닌 경우 해당 체크박스의 상태만 업데이트
                                      widget.selectedCheckBox[index] = val;

                                      if (widget.selectedCheckBox[0] && !val) {
                                        widget.selectedCheckBox[0] = false;
                                      }
                                    }
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
        ],
      );
    }
  }
}
