import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late final SharedPreferences prefs;

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future<bool> saveBool(String key, bool flag) {
    return prefs.setBool(key, flag);
  }

  static bool? getBool(String key) {
    return prefs.getBool(key);
  }

  static Future<bool> saveSurasList(int index) {
    List<String> surasList = getSurasList() ?? [];
    surasList.remove("$index");

    surasList.add(index.toString());
    return prefs.setStringList("surasList", surasList);
  }

  static List<String>? getSurasList() {
    return prefs.getStringList("surasList")?.toSet().toList() ?? [];
  }
}
