import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManage {
  static const String token = 'Token';
  static const String idDevice = 'IdDevice';
  static const String badger = 'Badger';
  static const String faceIdKey = "FaceIdKey";
  static const String account = "Account";
  static const String password = "Password";
  static const String baseURL = "BaseURL";
  static const String codeFireBase = "CodeFireBase";
  static const String userName = 'UserName';

  static late SharedPreferences prefs1;

  static Future<SharedPreferences> _getPreference() async {
    prefs1 = await SharedPreferences.getInstance();
    await prefs1.reload();
    return prefs1;
  }

  static Future<void> setValue(String key, dynamic value) async {
    final SharedPreferences prefs = await _getPreference();
    if (value is String) {
      prefs.setString(key, value);
    } else if (value is bool) {
      prefs.setBool(key, value);
    } else if (value is int) {
      prefs.setInt(key, value);
    } else if (value is double) {
      prefs.setDouble(key, value);
    }
  }

  static Future<String?> getValue(String key) async {
    final SharedPreferences prefs = await _getPreference();
    String? value = prefs.getString(key);
    return value;
  }

  static Future<bool?> getValueBool(String key) async {
    final SharedPreferences prefs = await _getPreference();
    bool? value = prefs.getBool(key);
    return value;
  }

  static Future<void> removeValue() async {
    final SharedPreferences prefs = await _getPreference();
    prefs.remove(SharedPreferencesManage.token);
    prefs.remove(SharedPreferencesManage.userName);
    prefs.remove(SharedPreferencesManage.badger);
  }

  static Future<String?> getToken() async {
    final SharedPreferences prefs = await _getPreference();
    String? value = prefs.getString(SharedPreferencesManage.token);
    return value;
  }

  static Future<void> setToken(String value) async {
    final SharedPreferences prefs = await _getPreference();
    prefs.setString(SharedPreferencesManage.token, value);
  }
  static Future<void> setUserName(String value) async {
    final SharedPreferences prefs = await _getPreference();
    prefs.setString(SharedPreferencesManage.userName, value);
  }

}
