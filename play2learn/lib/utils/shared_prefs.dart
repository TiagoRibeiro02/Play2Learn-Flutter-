import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static late SharedPreferences _preferences;

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setUsername(String username) async =>
      await _preferences.setString('username', username);

  static String getUsername() => _preferences.getString('username') ?? '';

  static Future removeUsername() async => await _preferences.remove('username');

  static Future setEmail(String email) async =>
      await _preferences.setString('email', email);

  static String getEmail() => _preferences.getString('email') ?? '';

  static Future removeEmail() async => await _preferences.remove('email');

  static Future setRole(String role) async =>
      await _preferences.setString('role', role);

  static String getRole() => _preferences.getString('role') ?? '';

  static Future removeRole() async => await _preferences.remove('role');

  static Future setBio(String bio) async =>
      await _preferences.setString('bio', bio);

  static String getBio() => _preferences.getString('bio') ?? '';
  
}