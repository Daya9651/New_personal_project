import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:likhit/const/api_url.dart';
import 'package:likhit/screens/auth/save_auth_data.dart';
import 'package:likhit/utils/const_toast.dart';
import '../screens/auth/choose_account_type.dart';
import '../screens/otp generate/otp_screen.dart';

 // const String baseUrl = "http://192.168.1.71:6768/";

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
      if (response.data['response_code'] == 200) {
        isLoading = false;
        Navigator.push(context, MaterialPageRoute(builder: (context) => VerifyOtpPage(email: email,)));
        ConstToast.to.showSuccess(response.data['message'] +"$email");
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
    // try {
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
        // debugPrint("tokenType $token");
        // authToken = token;

        UserDataService.saveUserData(token);
        debugPrint("tokenType ${await UserDataService.getAuthToken()}");

  ConstToast.to.showSuccess(response.data['message'] );
      } else {
        ConstToast.to.showError(response.data['message'] );
        debugPrint('Failed verification');
      }
    // } catch (e) {
    //   ConstToast.to.showError('$e');
    //   debugPrint('Error verification: $e');
    // }
  }

//   Future<void> saveUserData(
// String authToken1) async {
// final prefs = await SharedPreferences.getInstance();
// await prefs.setString(authToken, authToken1);
// // await prefs.setString(userId, userid);
// // await prefs.setString(userName, username);
// }
//
//   Future<String?> getAuthToken() async {
// final prefs = await SharedPreferences.getInstance();
// return prefs.getString("$authToken");
// }



  // Future<editProfile> fetchProfile() async {
  //   _dio.options.headers['Authorization'] = '0f89866b53f96d4199328755d526acf7a75834a1';
  //   try {
  //     Response response = await _dio.get('http://192.168.1.71:6768/view-profile-api/');
  //
  //     // Parse JSON and return DataModel object
  //     return editProfile.fromJson(response.data);
  //   } catch (e) {
  //     // Handle DioError exceptions if any
  //     debugPrint('Error fetching data: $e');
  //     throw e;
  //   }
  // }


  // Profile View Api
  //
  // Future viewProfile() async{
  //   final _dio = Dio();
  //   try{
  //     var response = await _dio.get('http://192.168.1.71:6768/view-profile-api/',
  //         options: Options(
  //           headers: {
  //             'Authorization' : 'Token 0f89866b53f96d4199328755d526acf7a75834a1'
  //           },
  //         ));
  //     var result = response.data;
  //     var data = result['data'] as List;
  //     // mStoreProductData.value = data.map((item) => ProductList.fromJson(item)).toList();
  //
  //     debugPrint('Response Data -------------------------------------- ${data}');
  //     // return BankingModel.fromJson(response.data);
  //   }catch(e){
  //     e.toString();
  //     debugPrint("Exception of bank details $e");
  //   }
  // }
  //


// bank Details Api

  // Future bankDetails() async{
  //   final _dio = Dio();
  //   try{
  //     var response = await _dio.get('http://192.168.1.71:6768/crud-lawyer-bank/',
  //         options: Options(
  //           headers: {
  //             'Authorization' : 'Token 0f89866b53f96d4199328755d526acf7a75834a1'
  //           },
  //         ));
  //     var result = response.data;
  //     var data = result['data'] as List;
  //     // mStoreProductData.value = data.map((item) => ProductList.fromJson(item)).toList();
  //
  //     debugPrint('Response Data -------------------------------------- ${data}');
  //     return BankingModel.fromJson(response.data);
  //   }catch(e){
  //     e.toString();
  //     debugPrint("Exception of bank details $e");
  //   }
  // }


  // Bar Association  patch Api
  // Future barAssociation() async{
  //
  //   final _dio = Dio();
  //   try{
  //     var response = await _dio.patch('http://192.168.1.71:6768/crud-lawyer-bar-associations/?',
  //         options: Options(
  //           headers: {
  //             'Authorization' : 'Token 0f89866b53f96d4199328755d526acf7a75834a1'
  //           },
  //         ));
  //     // debugPrint("Daya++++++++++++");
  //     var output = response.data;
  //     var data = output['data'] as List;
  //     // mStoreProductData.value = data.map((item) => ProductList.fromJson(item)).toList();
  //
  //     debugPrint('Result -------------------------------------- ${data}');
  //     // return BankingModel.fromJson(response.data);
  //   }catch(e){
  //     e.toString();
  //     debugPrint("Exception of bank details1 $e");
  //   }
  // }


}


