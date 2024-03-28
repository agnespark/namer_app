import 'package:flutter/material.dart';

List menuList = [
  {
    "name": 'Dashboard',
  },
  {
    "name": "Favorite",
    "subMenu": [
      {"name": "favorite1"},
      {"name": "favorite2"}
    ]
  },
  {
    "name": 'Home',
  },
];

class Menu {
  String name = "";
  List<Menu>? subMenu;
  Widget page;

  Menu({required this.name, this.subMenu, required this.page});

  // Menu.fromJson(Map<String, dynamic> json) {
  // name = json['name'];
  // if (json['subMenu'] != null) {
  //   subMenu.clear();
  //   json['subMenu'].forEach((v) {
  //     subMenu.add(new Menu.fromJson(v));
  //   });
  // }
  // if (json['subMenu'] != null) {
  //   subMenu =
  //       json['subMenu'].map<Menu>((item) => Menu.fromJson(item)).toList();
  // }
  // }
}
