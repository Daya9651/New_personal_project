import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import 'model/banking_model.dart';
import 'model/edit_profile.dart';

 const String baseUrl = "http://192.168.1.71:6768/";

class EmailService {
  final Dio _dio = Dio();

  Future<void> sendOtp(String email) async {
    _dio.options.headers['Authorization'] = '52fca82c967fc97df119f49faab7b9179e73f229';
    try {
      Response response = await _dio.post( 'http://192.168.1.71:6768/get-otp-api/',
        data: {'email': email},
      );
      if (response.statusCode == 200) {
        print('OTP sent successfully');
      } else {
        print('Failed to send OTP');
      }
    } catch (e) {
      print('Error sending OTP: $e');
    }
  }


  Future<void> veifyByOtp(String email) async {
    _dio.options.headers['Authorization'] = '52fca82c967fc97df119f49faab7b9179e73f229';
    try {
      Response response = await _dio.post( 'http://192.168.1.71:6768/verify-user-otp-api/',
        data: {'email': email},
      );
      if (response.statusCode == 200) {
        print('verify successfully');
      } else {
        print('Failed verification');
      }
    } catch (e) {
      print('Error verification: $e');
    }
  }


  Future<editProfile> fetchProfile() async {
    _dio.options.headers['Authorization'] = '0f89866b53f96d4199328755d526acf7a75834a1';
    try {
      Response response = await _dio.get('http://192.168.1.71:6768/view-profile-api/');

      // Parse JSON and return DataModel object
      return editProfile.fromJson(response.data);
    } catch (e) {
      // Handle DioError exceptions if any
      print('Error fetching data: $e');
      throw e;
    }
  }


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
  Future bankDetails() async{
    final _dio = Dio();
    try{
      var response = await _dio.get('http://192.168.1.71:6768/crud-lawyer-bank/',
          options: Options(
            headers: {
              'Authorization' : 'Token 0f89866b53f96d4199328755d526acf7a75834a1'
            },
          ));
      var result = response.data;
      var data = result['data'] as List;
      // mStoreProductData.value = data.map((item) => ProductList.fromJson(item)).toList();

      debugPrint('Response Data -------------------------------------- ${data}');
      return BankingModel.fromJson(response.data);
    }catch(e){
      e.toString();
      debugPrint("Exception of bank details $e");
    }
  }


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


