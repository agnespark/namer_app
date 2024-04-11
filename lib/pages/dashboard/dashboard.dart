import "package:english_words/english_words.dart";
import 'package:flutter/material.dart';
import 'package:namer_app/component/confirm_dialog.dart';
import 'package:namer_app/component/frame.dart';
import 'package:namer_app/component/toast.dart';
import 'package:namer_app/global_scaffold_key.dart';
import 'package:namer_app/main_controller.dart';
import "package:get/get.dart";
import 'package:namer_app/pages/dashboard/dashboard_detail/dashboard_detail.dart';
import 'package:namer_app/pages/dashboard/dashboard_post/dashboard_post.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FrameWidget(
      title: 'Dashboard',
      body: Column(
        children: [
          Obx(() => Text(MyController.to.currentMenu.value)), // 현재 선택된 메뉴 표시
          SelectableText('random number'),
          BigCard(pair: MyController.to.current),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() {
                IconData icon;
                if (MyController.to.favorites
                    .contains((MyController.to.current.value))) {
                  icon = Icons.favorite;
                } else {
                  icon = Icons.favorite_border;
                }
                return ElevatedButton.icon(
                  onPressed: () {
                    // MyController.to.toggleFavorite();
                    DialogWidget('결재문서 매핑을 해제하시겠습니까?', () {
                      MyController.to.toggleFavorite();
                      Get.back();
                      {
                        MyController.to.favorites
                                .contains(MyController.to.current.value)
                            ? ToastWidget('보관되었습니다.').blue()
                            : ToastWidget('해제되었습니다.').green();
                      }
                    }).confirm();
                  },
                  icon: Icon(icon),
                  label: Text('Like'),
                );
              }),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  MyController.to.getNext();
                },
                child: Text('Next'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  MyController.to
                      .changeDetail(Container(child: DashboardDetail()));
                  GlobalScaffoldKey.key.currentState!.openEndDrawer();
                },
                child: Text('Detail Page'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  MyController.to
                      .changeDetail(Container(child: DashboardPost()));
                  GlobalScaffoldKey.key.currentState!.openEndDrawer();
                },
                child: Text('Post Page'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.pair,
  });

  final Rx<WordPair> pair;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!
        .copyWith(color: theme.colorScheme.onPrimary);

    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Obx(
          () => Text(
            pair.value.asLowerCase,
            style: style,
            semanticsLabel: "${pair.value.first} ${pair.value.second}",
          ),
        ),
      ),
    );
  }
}
