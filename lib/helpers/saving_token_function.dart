import '../screens/auth/save_auth_data.dart';

Future<bool> checkLoggedIn() async {
  // Check if user is logged in
  final authToken = await UserDataService.getAuthToken();
  return authToken != null;
}