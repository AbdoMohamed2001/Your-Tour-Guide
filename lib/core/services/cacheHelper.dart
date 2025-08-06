import 'package:your_tour_guide/core/services/shared_prefs_services.dart';

class CacheHelper {
  //--------------------------------------------------------------
  // LOCALIZATION
  //--------------------------------------------------------------
  static Future<void> cacheLanguage(String code) async {
    await Prefs.setString(_cachedCode, code);
  }

  static const String _cachedCode = "cachedCode";
  static String getCachedLanguage() {
    final code = Prefs.getString(_cachedCode);
    if (code != null) {
      return code;
    } else {
      return 'en';
    }
  }

  //--------------------------------------------------------------
  // THEME
  //--------------------------------------------------------------
  static const String _cachedTheme = "cachedTheme";
  static Future<void> cacheTheme(bool isDark) async {
    await Prefs.setBool(_cachedTheme, isDark);
  }

  static bool getCachedTheme() {
    final cachedTheme = Prefs.getBool(_cachedTheme);
    return cachedTheme;
  }
}
