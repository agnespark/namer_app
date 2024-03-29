import 'package:flutter/material.dart';
import 'package:namer_app/global_scaffold_key.dart';
import 'package:namer_app/main_controller.dart';
import "package:get/get.dart";

class SamplingPage extends StatelessWidget {
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
              GlobalScaffoldKey.key.currentState!.openEndDrawer();
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
