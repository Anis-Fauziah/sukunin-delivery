import 'package:shared_preferences/shared_preferences.dart';

class SessionService {

  static Future<void> saveLogin({
    required String email,
  }) async {

    final prefs =
        await SharedPreferences.getInstance();

    await prefs.setBool(
      'isLogin',
      true,
    );

    await prefs.setString(
      'email',
      email,
    );
  }

  static Future<bool> isLogin() async {

    final prefs =
        await SharedPreferences.getInstance();

    return prefs.getBool(
          'isLogin',
        ) ??
        false;
  }

  static Future<void> logout() async {

    final prefs =
        await SharedPreferences.getInstance();

    await prefs.clear();
  }
}