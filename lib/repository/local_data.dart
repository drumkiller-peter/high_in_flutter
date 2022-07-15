import 'package:shared_preferences/shared_preferences.dart';

class LocalRepositoryManager {
  static SharedPreferences? _preferences;
  static Future initializeSharedPreferences() async {
    _preferences = await SharedPreferences.getInstance();
  }

  saveTheme(bool isDarkModeOn) async {
    await _preferences!.setBool("isDarkModeOn", isDarkModeOn);
  }

  bool getTheme() {
    return _preferences!.getBool("isDarkModeOn") ?? false;
  }
}
