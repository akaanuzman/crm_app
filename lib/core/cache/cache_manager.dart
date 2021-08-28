// ignore_for_file: constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

mixin CacheManager {
  Future<bool> saveToken({required String token}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(CacheManagerKey.TOKEN.toString(), token);
    return true;
  }

  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(CacheManagerKey.TOKEN.toString());
  }
}

enum CacheManagerKey { TOKEN }