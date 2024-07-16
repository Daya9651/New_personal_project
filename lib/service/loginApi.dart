
// import 'package:dio/dio.dart%20%20';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get_rx/get_rx.dart';
import 'package:likhit/const/api_url.dart';
import 'package:likhit/pending_review_page.dart';
import 'package:likhit/routes/routes.dart';
import 'package:likhit/screens/auth/save_auth_data.dart';
import 'package:likhit/utils/const_toast.dart';
import '../common/const_api.dart';
import '../screens/auth/choose_account_type.dart';
import '../screens/otp generate/otp_screen.dart';
import 'package:dio/dio.dart' as dio;


  class EmailService  extends GetxController{
  RxBool isLoading = false.obs;
  final Dio _dio = Dio();
  // String authToken = '';


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    ApiService.init();
  }


  Future<void> sendOtp(String email,BuildContext context) async {
    _dio.options.headers['Authorization'] = publicToken;
    isLoading.value = true;
    try {
      // Response response = await _dio.post( 'http://192.168.1.71:6768/get-otp-api/',
     var response = await _dio.post( loginEmailUrl,
        data: {'email': email},
      );
      debugPrint("loginEmailUrl: $loginEmailUrl");
      if (response.data['response_code'] == 200) {
        isLoading.value= false;
        Navigator.push(context, MaterialPageRoute(builder: (context) => VerifyOtpPage(email: email,)));


        ConstToast.to.showSuccess(response.data['message'] +email);
        debugPrint('OTP sent successfully');
      } else {
        isLoading.value = false;
        ConstToast.to.showError(response.data['message'] );
        debugPrint('Failed to send OTP');
      }
    } catch (e) {
      isLoading.value = false;
      ConstToast.to.showError('$e');
      debugPrint('Error sending OTP: $e');
    }
  }


  Future<void> verifyByOtp(String email, String otp, BuildContext context) async {
    debugPrint("sending otp: $email, $otp");

    try {
      dio.Response response = await ApiService.postData(
        url: otpVerify,
        data: {
          'email': email,
          'otp': otp,

        },
        publicToken: true,
      );

      debugPrint("response status code: ${response.statusCode}");
      if (response.data['response_code'] == 200) {
        var token = response.data['token_key'];
        var type = response.data['user_type'];
        debugPrint("type by login: $type");

        if (type == "Not Define") {
          Get.off(const ChoosePage(),);
        } else if (type == "Approval Pending") {
          Get.to(() => const PendingReviewPage());
        } else {
          Get.offAllNamed(ApplicationPages.myBottomBar);
        }

        UserDataService.saveUserData(token, type);
        debugPrint("saveUserData tokenType ${await UserDataService.getAuthToken()}");

        ConstToast.to.showSuccess(response.data['message']);
      } else {
        ConstToast.to.showError(response.data['message']);
        debugPrint('Failed verification');
      }
    } catch (e) {
      ConstToast.to.showError('$e');
      debugPrint('Error verification: $e');
    }
  }




}


