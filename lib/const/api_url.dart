// const String baseUrl = "http://192.168.1.71:6768"; //local
const String baseUrl = "https://admin1.likhitde.com"; //live

const String loginEmailUrl = "$baseUrl/get-otp-api/";
const String otpVerify = "$baseUrl/verify-user-otp-api/";

const String curdLawyerServices = "$baseUrl/crud-lawyer-fee-api/";
const String addPhoneNumber = "$baseUrl/crud-lawyer-phone-number-api/";
const String addEmail = "$baseUrl/crud-lawyer-email-api/";
const String addSocialMedia = "$baseUrl/crud-lawyer-social-media/";


const String publicToken = "Token 52fca82c967fc97df119f49faab7b9179e73f229";

//todo for get token keys
// void loginApi() async {
//   isLoading.value = true;
//
//   try {
//     var response = await http.post(
//       Uri.parse(loginUrl),
//       body: {
//         'username': emailController.value.text,
//         'password': passwordController.value.text,
//       },
//     );
//
//     var data = json.decode(response.body);
//     // debugPrint("${data}");
//     if (data['response_code'] == 200) {
//       isLoading.value = false;
//       Get.offNamed(ApplicationPages.dashboardScreen);
//       debugPrint("login success $data");
//       int userId = data['user_id'];
//       String token = data['token'];
//       String name = data['user_name'];
//       // String storeLogo = data['store_logo'];
//
//       UserDataService.saveUserData(token, userId.toString(), name);
//       await UserDataService.getAuthToken();
//       debugPrint("after login $userId\n$token");
//       await fetchProfile();
//     } else {
//       isLoading.value = false;
//       // data = 'Error: ${response.statusCode}';
//       // showErrorSnack(context,"${data['message']}");
//
//       ConstToast.to.showError("${data['message']}");
//       debugPrint("login  $data");
//     }
//   } catch (e) {
//     ConstToast.to.showError("$e");
//     isLoading.value = false;
//     debugPrint("exception login $e ");
//   } finally {
//     isLoading.value = false;
//   }
// }

// static Future<void> saveUserData(
// String authToken, String userid, String username) async {
// final prefs = await SharedPreferences.getInstance();
// await prefs.setString(token, authToken);
// await prefs.setString(userId, userid);
// await prefs.setString(userName, username);
// }

// static Future<String?> getAuthToken() async {
// final prefs = await SharedPreferences.getInstance();
// return prefs.getString(token);
// }