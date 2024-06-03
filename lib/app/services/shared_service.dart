import 'package:shared_preferences/shared_preferences.dart';

class SharedService {
  static final SharedService instance = SharedService();
  late SharedPreferences prefs;
  Future<void> initPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

}
