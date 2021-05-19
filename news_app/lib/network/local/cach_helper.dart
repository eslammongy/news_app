import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CachHelper {
  static SharedPreferences sharedPreferences;
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> putAppTheme(
      {@required String key, @required bool value}) async {
    return await sharedPreferences.setBool(key, value);
  }

  static bool getAppTheme({@required String key}) {
    return sharedPreferences.getBool(key);
  }
}
