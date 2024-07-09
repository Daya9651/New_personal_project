import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
// import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import '../const/api_urls.dart';
import '../utils/const_toast.dart';

class ApiService {
  static final Dio _dio = Dio();

  static void init() {
    // Initialize common configurations such as base URL, headers, etc.
    _dio.options.baseUrl = baseUrl;
    // _dio.options.connectTimeout = const Duration(seconds: 15);
    // _dio.options.receiveTimeout = const Duration(seconds: 15);

    // Add interceptors
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // Do something before request is sent
          // For example, add headers
          options.headers.addAll({'Authorization': token});
          return handler.next(options); // continue
        },
        onResponse: (response, handler) {
          // Do something with the response data
          return handler.next(response); // continue
        },
        onError: (e, handler) {
          // Do something with the error
          if (e.response != null) {
            // The request was made and the server responded with a status code
            // that falls out of the range of 2xx.

            if (e.response?.data["message"] is List) {
              ConstToast.to.showSuccess( "${e.response?.data["message"][0]}");
            } else {
              ConstToast.to.showError( "${e.response?.data["message"]}");
            }
            debugPrint('Error status: ${e.response!.statusCode}');
            debugPrint('Error message: ${e.response!.statusMessage}');
            debugPrint('Error data: ${e.response!.data}');
          } else {
            // Something happened in setting up or sending the request that triggered an Error
            debugPrint('Dio Error: $e');
            // if(InternetStatus.connected==true) {
            //   ConstToast.to.showError( " connection time out");
            // }else{
            //   ConstToast.to.showError( "check your internet connection");
            // }
          }
          return handler.next(e); // continue
        },
      ),
    );

  //   if (kDebugMode) {
  //     _dio.interceptors.add(PrettyDioLogger(
  //       requestBody: true,
  //     ));
  //   }
  }

  static Future<Response> getData(String path,
      {Map<String, dynamic>? queryParameters, dynamic data}) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
        data: data,
      );
      return response;
    } catch (e) {
      // Handle error gracefully
      throw 'Failed to fetch data: $e';
    }
  }

  static Future<Response> postData(
      {required url, dynamic data, options}) async {
    try {
      final response = await _dio.post(
        url,
        data: data,
        options: options,
      );

      return response;
    } catch (e) {
      throw 'Failed to post data: $e';
    }
  }
  static Future<Response> uploadImage({
    required String url,
    required File imageFile,
    Map<String, dynamic>? additionalData,
  }) async {
    try {
      FormData formData = FormData.fromMap({
        "image": await MultipartFile.fromFile(imageFile.path,
            filename: imageFile.path.split('/').last),
        if (additionalData != null) ...additionalData,
      });

      final response = await _dio.post(
        url,
        data: formData,
      );

      return response;
    } catch (e) {
      throw 'Failed to upload image: $e';
    }
  }

  static Future<Response> uploadImages({
    required String url,
    required FormData formData,
  }) async {
    try {
      final response = await _dio.post(
        url,
        data: formData,
      );
      return response;
    } catch (e) {
      throw 'Failed to upload image: $e';
    }
  }
// Add other methods for different HTTP methods as needed
}