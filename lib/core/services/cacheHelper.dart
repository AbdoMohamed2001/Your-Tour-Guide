import 'package:shared_preferences/shared_preferences.dart';

class CacheData {
  static late SharedPreferences sharedPreferences;
  static cacheInit() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static const likedKey = 'liked_key';
  static late bool liked = false;

  static Future<bool> setData(
      {required String key, required dynamic value}) async {
    if (value is bool) {
      await sharedPreferences.setBool(key, value);
      return true;
    }
    if (value is String) {
      await sharedPreferences.setString(key, value);
      return true;
    }
    return false;
  }

  static dynamic getData({required String key}) {
    return sharedPreferences.get(key);
  }

  //--------------------------------------------------------------

  static const String _cachedCode = "cachedCode";
  static String getCachedLanguage() {
    final code = sharedPreferences.getString(_cachedCode);
    if (code != null) {
      return code;
    } else {
      return 'en';
    }
  }

  static Future<void> cacheLanguage(String code) async {
    await sharedPreferences.setString(_cachedCode, code);
  }

  //--------------------------------------------------------------
  static const String _cachedTheme = "cachedTheme";
  static bool getCachedTheme() {
    final isDark = sharedPreferences.getBool(_cachedTheme);
    if (isDark != null) {
      return isDark;
    } else {
      print('null in isDark value and default value will be false');
      return false;
    }
  }

  static Future<void> cacheTheme(bool isDark) async {
    await sharedPreferences.setBool(_cachedTheme, isDark);
  }
//--------------------------------------------------------------
}
