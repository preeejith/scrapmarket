import 'package:shared_preferences/shared_preferences.dart';

class PrefManager {
  static setToken(var token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  static getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  static setIsLoggedIn(bool isLoggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', isLoggedIn);
  }

  static getIsLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('isLoggedIn') != null) {
      return prefs.getBool('isLoggedIn');
    } else {
      return false;
    }
  }

  static setUserId(var userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userId', userId);
  }

  static setDeviceToken(var fcmtoken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('fcmtoken', fcmtoken);
  }

  static getDeviceToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('fcmtoken');
  }

  static getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('userId');
  }

  static setRole(var role) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('role', role);
  }

  static getRole() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('role');
  }

  static setCstate(String cState) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('cState', cState);
  }

  static Future<String?> getCstate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('cState');
  }

  static setClang(String cLang) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('cLang', cLang);
  }

  static Future<String?> getClang() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('cLang');
  }

  static clearToken() async {
    final pref = await SharedPreferences.getInstance();
    await pref.clear();
  }
}
