import 'package:flutter/material.dart';
import "package:get/get.dart";
import "package:namer_app/global_scaffold_key.dart";
import "package:namer_app/main_controller.dart";
import "package:namer_app/nav_model.dart";
import "package:namer_app/config/themes.dart";

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // await SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  List<Menu> data = [];

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: Locale('ko'),
      title: "Namer App",
      debugShowCheckedModeBanner: false,
      theme: Themes.light,
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
          body: Obx(
            () => Row(
              children: [
                Container(
                  width: 200, // 네비게이션 바의 고정된 너비
                  // color: Colors.blue,
                  child: ListView.builder(
                    itemCount: MyController.to.navList.length,
                    itemBuilder: (BuildContext context, int index) =>
                        _navList(MyController.to.navList[index]),
                  ),
                ),
                Expanded(
                  child: MyController.to.currentWidget.value,
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
        MyController.to.changePage(menu.page!, menu.name, menu.depth);
      },
      child: ListTile(
        mouseCursor: SystemMouseCursors.click,
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24),
          child: Text(
            menu.name,
            style: TextStyle(fontSize: 16),
          ),
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
      padding: EdgeInsets.only(left: menu.depth * 24), // 깊이에 따라 왼쪽 패딩 적용
      child: Text(
        menu.name,
        style: TextStyle(fontSize: 16),
      ),
    ),
    children: menu.subMenu!
        .map((subMenu) => Padding(
              padding: EdgeInsets.only(
                  left: (menu.depth) * 24), // 자식 메뉴에 깊이에 따라 왼쪽 패딩 적용
              child: _navList(subMenu),
            ))
        .toList(),
  );
}
