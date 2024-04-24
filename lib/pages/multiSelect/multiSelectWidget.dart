import 'package:flutter/material.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

class MutiSelectWidget extends StatelessWidget {
  final List<String> list;
  MutiSelectWidget({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: MultiSelectDropDown(
        onOptionSelected: (options) {
          debugPrint(options.toString());
        },
        options: <ValueItem>[
          for (int i = 0; i < list.length; i++)
            ValueItem(label: list[i], value: i + 1)
        ],
        selectionType: SelectionType.multi,
        chipConfig: const ChipConfig(wrapType: WrapType.scroll),
        dropdownHeight: 400,
        optionTextStyle: const TextStyle(fontSize: 16),
        selectedOptionIcon: const Icon(Icons.check_circle),
      ),
    );
  }
}
