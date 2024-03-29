import "package:english_words/english_words.dart";
import 'package:flutter/material.dart';
import 'package:namer_app/global_scaffold_key.dart';
import 'package:namer_app/main_controller.dart';
import "package:get/get.dart";

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
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
                    MyController.to.toggleFavorite();
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
                  GlobalScaffoldKey.key.currentState!.openEndDrawer();
                },
                child: Text('Drawer Detail'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => CustomDetail()),
                  // );
                },
                child: Text('Custom Detail'),
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
