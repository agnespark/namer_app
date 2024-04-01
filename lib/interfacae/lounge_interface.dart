import 'package:flutter/foundation.dart';
import 'package:namer_app/dio_manager/dio_manager.dart';

class LoungeInterface {
  static Future<dynamic> getList() async {
    try {
      var resBody = await DioManager().get('lounge/main/?page=1&type=');
      return resBody;
    } catch (e, s) {
      if (kDebugMode) {
        print(e);
        print(s);
      }
      return null;
    }
  }
}
