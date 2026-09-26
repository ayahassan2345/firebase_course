import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static late SharedPreferences prefs;

  static init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static void setIsLoggedIn({required bool isLoggedIn}) {
    prefs.setBool('is_logged_in', isLoggedIn);
  }

  static bool getIsLoggedIn() {
    return prefs.getBool('is_logged_in') ?? false;
  }
}
