import 'package:flutter/material.dart';
import "package:get/get.dart";
import "package:namer_app/components/detail/favorite_detail.dart";
import "package:namer_app/components/detail/home_detail.dart";
import "package:namer_app/main_controller.dart";
import "package:namer_app/nav_model.dart";
import "package:namer_app/pages/home/home.dart";

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
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Get.put(MyController(
        scaffoldKey,
        Container(
          child: HomePage(scaffoldKey),
        ).obs));
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          key: scaffoldKey,
          endDrawer: Drawer(
            width: 500,
            shape:
                const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
            child: ClipRRect(
              borderRadius: BorderRadius.zero,
              child: Obx(
                () {
                  Widget drawerContent = Container(); // 기본적으로 빈 컨테이너

                  switch (MyController.to.selectedIndex.value) {
                    case 0: // Home 페이지의 디자인
                      drawerContent = HomeDetail(); // Home 페이지용 Drawer 컨텐츠
                      break;
                    case 1: // Favorites 페이지의 디자인
                      drawerContent =
                          FavoriteDetail(); // Favorites 페이지용 Drawer 컨텐츠
                      break;
                  }

                  return drawerContent;
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
                          _buildList(MyController.to.navList[index]),
                    )),
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

Widget _buildList(Menu menu) {
  if (menu.subMenu == null) {
    return GestureDetector(
      onTap: () {
        MyController.to.changeWidget(menu.page);
      },
      child: ListTile(
        leading: SizedBox(),
        title: Text(menu.name),
      ),
    );
  }

  return ExpansionTile(
    title: Text(
      menu.name,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    ),
    children: menu.subMenu!.map(_buildList).toList(),
  );
}

class SubCategory extends StatelessWidget {
  String? name;
  SubCategory(this.name, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(name ?? ""),
        ),
        body: Center(
          child: Text("$name"),
        ));
  }
}
