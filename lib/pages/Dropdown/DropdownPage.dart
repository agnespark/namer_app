import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:namer_app/config/color.dart';

class DropdownMenuPage extends StatelessWidget {
  final List<String> list;

  DropdownMenuPage({
    Key? key,
    List<String>? list,
  })  : this.list = list ?? ['one', 'two'],
        super(key: key);

  final DropdownController controller = DropdownController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownMenu<String>(
        menuStyle: MenuStyle(
          fixedSize: MaterialStatePropertyAll(Size(100, list.length * 40)),
        ),
        width: 100,
        textStyle: TextStyle(
          color: primaryMain,
          fontWeight: FontWeight.w500,
          fontSize: 13,
        ),
        trailingIcon: Icon(
          Icons.arrow_drop_down,
          color: Colors.blue,
        ),
        inputDecorationTheme: InputDecorationTheme(
          iconColor: Colors.blue,
          suffixIconColor: Colors.blue,
          isCollapsed: true,
          isDense: true,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
          // constraints: BoxConstraints.tight(Size.fromHeight(28)),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue,
              width: 1,
            ),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue,
              width: 1,
            ),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue,
              width: 1,
            ),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
        ),
        initialSelection: list.first,
        onSelected: (String? name) {
          if (name != null) {
            controller.changeValue(name);
          }
        },
        dropdownMenuEntries:
            list.map<DropdownMenuEntry<String>>((String value) {
          return DropdownMenuEntry<String>(
              value: value,
              label: value,
              style: ButtonStyle(
                  textStyle:
                      MaterialStatePropertyAll(TextStyle(fontSize: 13))));
        }).toList(),
      ),
      // child: DropdownButton<String>(
      //   value: controller.dropdownValue.value,
      //   icon: const Icon(Icons.arrow_downward),
      //   elevation: 16,
      //   style: const TextStyle(color: Colors.deepPurple),
      //   underline: Container(
      //     height: 2,
      //     color: Colors.deepPurpleAccent,
      //   ),
      //   onChanged: (String? value) {
      //     // This is called when the user selects an item.
      //     if (value != null) {
      //       controller.changeValue(value);
      //     }
      //   },
      //   items: list.map<DropdownMenuItem<String>>((String value) {
      //     return DropdownMenuItem<String>(
      //       value: value,
      //       child: Text(value),
      //     );
      //   }).toList(),
      // ),
    );
    // ),
  }
}

class DropdownController extends GetxController {
  static DropdownController get to => Get.find<DropdownController>();

  Rx<String> dropdownValue = "value".obs;

  void changeValue(String? value) {
    if (value != null) {
      dropdownValue.value = value;
    }
  }
}
