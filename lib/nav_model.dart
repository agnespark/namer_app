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
  Widget? page;
  Widget? detail;
  double depth;

  Menu(
      {required this.name,
      this.subMenu,
      this.page,
      this.detail,
      required this.depth});
}
