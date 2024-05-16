import 'package:shared_preferences/shared_preferences.dart';

class SharedService {
  static final SharedService instance = SharedService();

  Future<SharedPreferences> getSharedInstance() async {
    return await SharedPreferences.getInstance();
  }

  Future<void> setValue({required String key, required dynamic value}) async {
    SharedPreferences prefs = await getSharedInstance();
    if (value is String) {
      await prefs.setString(key, value);
    } else if (value is int) {
      await prefs.setInt(key, value);
    } else if (value is double) {
      await prefs.setDouble(key, value);
    } else if (value is bool) {
      await prefs.setBool(key, value);
    } else if (value is List<String>) {
      await prefs.setStringList(key, value);
    } 
  }

  Future<dynamic> getValue({required String key}) async {
    SharedPreferences prefs = await getSharedInstance();
    return prefs.get(key);
  }
}
