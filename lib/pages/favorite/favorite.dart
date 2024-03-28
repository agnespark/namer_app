import 'package:flutter/material.dart';
import 'package:namer_app/main_controller.dart';
import "package:get/get.dart";

class FavoritePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  FavoritePage(this.scaffoldKey);

  @override
  Widget build(BuildContext context) {
    if (MyController.to.favorites.isEmpty) {
      return Column(
        children: [
          Center(
            child: Text('no favorites'),
          ),
          ElevatedButton(
            onPressed: () {
              scaffoldKey.currentState!.openEndDrawer();
            },
            child: Text('Detail'),
          ),
        ],
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
