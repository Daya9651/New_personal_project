import 'package:shared_preferences/shared_preferences.dart';

class UserDataService{
  static const token = 'token';
  static const userType = 'user_type';

  static Future<void> saveUserData(String authToken,String type) async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(token, authToken);
    await prefs.setString(token, type);
  }

  static Future<String?> getAuthToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(token);
  }
  static Future<String?> getUserType() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(userType);
  }

  static Future<void> removeUser() async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(token);
    await prefs.remove(userType);

  }

}