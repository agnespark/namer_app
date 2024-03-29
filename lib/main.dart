import 'package:flutter/material.dart';
import "package:get/get.dart";
import "package:namer_app/global_scaffold_key.dart";
import "package:namer_app/pages/dashboard/dashboard.dart";
import "package:namer_app/main_controller.dart";
import "package:namer_app/nav_model.dart";
import "package:namer_app/pages/dashboard/dashboard_detail/dashboard_detail.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  List<Menu> data = [];

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Namer App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(MyController());
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          key: GlobalScaffoldKey.key,
          endDrawer: Drawer(
            width: 500,
            shape:
                const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
            child: ClipRRect(
              borderRadius: BorderRadius.zero,
              child: Obx(
                () {
                  return MyController.to.currentDetail.value;
                },
              ),
            ),
          ),
          body: Obx(
            () => Row(
              children: [
                Container(
                  width: 200, // 네비게이션 바의 고정된 너비
                  color: Colors.blue,
                  child: ListView.builder(
                    itemCount: MyController.to.navList.length,
                    itemBuilder: (BuildContext context, int index) =>
                        _navList(MyController.to.navList[index]),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    child: MyController.to.currentWidget.value,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget _navList(Menu menu) {
  if (menu.subMenu == null) {
    return GestureDetector(
      onTap: () {
        MyController.to.changePage(menu.page, menu.name);
      },
      child: ListTile(
        mouseCursor: SystemMouseCursors.click,
        title: Text(
          menu.name,
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  return ExpansionTile(
    collapsedShape: RoundedRectangleBorder(
      side: BorderSide.none,
    ),
    shape: RoundedRectangleBorder(
      side: BorderSide.none,
    ),
    title: Padding(
      padding: EdgeInsets.only(left: menu.depth * 10), // 깊이에 따라 왼쪽 패딩 적용
      child: Text(
        menu.name,
        style: TextStyle(fontSize: 16),
      ),
    ),
    children: menu.subMenu!
        .map((subMenu) => Padding(
              padding: EdgeInsets.only(
                  left: (menu.depth) * 30), // 자식 메뉴에 깊이에 따라 왼쪽 패딩 적용
              child: _navList(subMenu),
            ))
        .toList(),
  );
}
