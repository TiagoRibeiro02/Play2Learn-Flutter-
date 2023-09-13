import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static late SharedPreferences _preferences;

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setUsername(String username) async =>
      await _preferences.setString('username', username);

  static String? getUsername() => _preferences.getString('username');

  static Future setEmail(String email) async =>
      await _preferences.setString('email', email);

  static String? getEmail() => _preferences.getString('email');
  
}