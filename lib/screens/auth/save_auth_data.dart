import 'package:shared_preferences/shared_preferences.dart';

class UserDataService{
  static const token = 'token';

  static Future<void> saveUserData(String authToken) async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(token, authToken);
  }

  static Future<String?> getAuthToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(token);
  }

}