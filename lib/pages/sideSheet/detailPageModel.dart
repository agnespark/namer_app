import 'package:flutter/material.dart';

class DetailPageModel {
  late int id;

  DetailPageModel.fromJson(dynamic json) {
    id = json['id'] ?? 0;
  }
}

class DetailPage {
  String name = "";
  Widget? page;

  DetailPage({required this.name, this.page});
}
