import 'package:flutter/material.dart';
import "package:get/get.dart";
import "package:namer_app/components/detail/home_detail.dart";
import "package:namer_app/components/favorite_detail.dart";
import "package:namer_app/main_controller.dart";
import "package:namer_app/pages/favorite/favorite.dart";
import "package:namer_app/pages/home/home.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyController());
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
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          key: _scaffoldKey,
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
          body: Row(
            children: [
              Container(
                width: 200, // 네비게이션 바의 고정된 너비
                color: Colors.blue,
                child: Obx(
                  () => ListView(
                    children: [
                      const SizedBox(height: 20),
                      Center(child: Text("Query Stacker")),
                      const SizedBox(height: 20), // 네비게이션 바 헤더의 높이만큼 여백 추가
                      ListTile(
                        title: Text(
                          'Home',
                          style: TextStyle(
                            color: MyController.to.selectedIndex.value == 0
                                ? Colors.white // 선택된 항목의 텍스트 색상 설정
                                : Colors.black, // 선택되지 않은 항목의 텍스트 색상 설정
                          ),
                        ),
                        onTap: () {
                          MyController.to.changePage(0);
                        },
                      ),
                      ListTile(
                        title: Text(
                          'Favorite',
                          style: TextStyle(
                            color: MyController.to.selectedIndex.value == 1
                                ? Colors.white // 선택된 항목의 텍스트 색상 설정
                                : Colors.black, // 선택되지 않은 항목의 텍스트 색상 설정
                          ),
                        ),
                        onTap: () {
                          MyController.to.changePage(1);
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  child: Obx(
                    () {
                      Widget currentPage = Container();
                      switch (MyController.to.selectedIndex.value) {
                        case 1:
                          currentPage = FavoritePage(_scaffoldKey);
                          break;
                        default:
                          currentPage = HomePage(_scaffoldKey);
                      }
                      return currentPage;
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
