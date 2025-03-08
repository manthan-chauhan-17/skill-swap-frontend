import 'package:shared_preferences/shared_preferences.dart';

class MySharedPreference {
  static bool isLoggedin = false;
  static String userName = "";
  static String authToken = "";

  static setLoggedinStatus(bool loggedinStatus) async {
    final prefs = await SharedPreferences.getInstance();
    isLoggedin = loggedinStatus;
    await prefs.setBool("is_loggedin", loggedinStatus);
  }

  static Future<bool> getLoggedinStatus() async {
    final prefs = await SharedPreferences.getInstance();
    isLoggedin = prefs.getBool("is_loggedin") ?? false;
    return isLoggedin;
  }

  static setUserName(String name) async {
    final prefs = await SharedPreferences.getInstance();
    userName = name;
    await prefs.setString("user_name", name);
  }

  Future<String> getUserName() async {
    final prefs = await SharedPreferences.getInstance();
    userName = prefs.getString("user_name") ?? "";
    return userName;
  }

  static setAuthToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    authToken = token;
    await prefs.setString("auth_token", token);
  }

  static Future<String> getAuthToken() async {
    final prefs = await SharedPreferences.getInstance();
    authToken = prefs.getString("auth_token") ?? "";
    return authToken;
  }
}
