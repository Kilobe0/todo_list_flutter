import 'package:shared_preferences/shared_preferences.dart';

class SharedService {
  static final SharedService instance = SharedService();

  Future<SharedPreferences> getSharedInstance() async {
    return await SharedPreferences.getInstance();
  }

  Future<void> setValue({required String key, required dynamic value}) async {
    SharedPreferences prefs = await getSharedInstance();
    if (value is String) {
      prefs.setString(key, value);
    } else if (value is int) {
      prefs.setInt(key, value);
    } else if (value is double) {
      prefs.setDouble(key, value);
    } else if (value is bool) {
      prefs.setBool(key, value);
    } else if (value is List<String>) {
      prefs.setStringList(key, value);
    }
  }

  Future<dynamic> getValue({required String key}) async {
    SharedPreferences prefs = await getSharedInstance();
    return prefs.get(key);
  }
}