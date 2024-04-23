import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
  Widget? post;
  double depth;

  Menu(
      {required this.name,
      this.subMenu,
      this.page,
      this.detail,
      this.post,
      required this.depth});
}
