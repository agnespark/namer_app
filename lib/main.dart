import "package:english_words/english_words.dart";
import 'package:flutter/material.dart';
import "package:namer_app/controller.dart";
import "package:get/get.dart";

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
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          body: Row(
            children: [
              SafeArea(
                child: Obx(() {
                  return NavigationRail(
                    extended: constraints.maxWidth >= 600,
                    destinations: [
                      NavigationRailDestination(
                        icon: Icon(Icons.home),
                        label: Text('Home'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.favorite),
                        label: Text('Favorites'),
                      ),
                    ],
                    selectedIndex: MyController.to.selectedIndex.value,
                    onDestinationSelected: (value) {
                      MyController.to.changePage(value);
                    },
                  );
                }),
              ),
              Expanded(
                child: Container(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  child: Obx(
                    () {
                      Widget currentPage = Container();
                      if (MyController.to.selectedIndex.value == 1) {
                        currentPage = FavoritePage();
                      } else {
                        currentPage = GeneratorPage();
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

class GeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('random number'),
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

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (MyController.to.favorites.isEmpty) {
      return Center(
        child: Text('no favorites'),
      );
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Obx(
            () => Text('You have '
                '${MyController.to.favorites.length} favorites:'),
          ),
        ),
        for (var pair in MyController.to.favorites)
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text(pair.asLowerCase),
          ),
      ],
    );
  }
}
