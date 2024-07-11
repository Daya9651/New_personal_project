import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:likhit/const/api_url.dart';
import 'package:likhit/screens/auth/save_auth_data.dart';
import 'package:likhit/utils/const_toast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/auth/choose_account_type.dart';
import '../screens/otp generate/otp_screen.dart';
import '../screens/splash/splash_screen.dart';
import 'model/banking_model.dart';
import 'model/edit_profile.dart';


  class EmailService {
  bool isLoading = false;
  final Dio _dio = Dio();
  // String authToken = '';

  Future<void> sendOtp(String email,BuildContext context) async {
    _dio.options.headers['Authorization'] = publicToken;
    isLoading = true;
    try {
      // Response response = await _dio.post( 'http://192.168.1.71:6768/get-otp-api/',
      Response response = await _dio.post( loginEmailUrl,
        data: {'email': email},
      );
      debugPrint("loginEmailUrl: ${loginEmailUrl}");
      if (response.data['response_code'] == 200) {
        isLoading = false;
        Navigator.push(context, MaterialPageRoute(builder: (context) => VerifyOtpPage(email: email,)));
        ConstToast.to.showSuccess(response.data['message'] +email);
        debugPrint('OTP sent successfully');
      } else {
        isLoading = false;
        ConstToast.to.showError(response.data['message'] );
        debugPrint('Failed to send OTP');
      }
    } catch (e) {
      isLoading = false;
      ConstToast.to.showError('$e');
      debugPrint('Error sending OTP: $e');
    }
  }


  Future<void> verifyByOtp(String email,String otp,BuildContext context) async {
    _dio.options.headers['Authorization'] = publicToken;
    debugPrint("sending otp : $email ,$otp");
    try {
      // Response response = await _dio.post( 'http://192.168.1.71:6768/verify-user-otp-api/',
      Response response = await _dio.post( otpVerify,
        data: {
        'email': email,
        'otp': otp
        },
      );
      debugPrint("sending otp :gfgf'${response.statusCode}'");
      if (response.data['response_code'] == 200) {
        Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const ChoosePage()));
        var token = response.data['token_key'];
        var type = response.data['user_type'];
        // debugPrint("tokenType $token");
        // authToken = token;

        UserDataService.saveUserData(token,type);
        debugPrint("tokenType ${await UserDataService.getAuthToken()}");

  ConstToast.to.showSuccess(response.data['message'] );
      } else {
        ConstToast.to.showError(response.data['message'] );
        debugPrint('Failed verification');
      }
    } catch (e) {
      ConstToast.to.showError('$e');
      debugPrint('Error verification: $e');
    }
  }



}


