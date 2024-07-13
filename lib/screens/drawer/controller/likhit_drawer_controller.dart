import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:likhit/const/api_url.dart';
import 'package:likhit/screens/bottombar/controllers/bottom_nav_controller.dart';
import 'package:dio/dio.dart' as dio;

import '../../../common/const_api.dart';
import '../models/profile_model.dart';
class LikhitDrawerController extends GetxController {

  final BottomNavController bottomNavController = Get.put(BottomNavController());


  var profileData = ProfileModel().obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    ApiService.init();
    getProfileData();
  }


  Future getProfileData({String ?search})async {
    try {
      dio.Response myTransactionResponse = await ApiService.getData(
          profileUrl,

      );
      if(myTransactionResponse.data['response_code']==200){

        profileData.value = ProfileModel.fromJson(
            myTransactionResponse.data);
      }


    } catch (e) {
      debugPrint("clientTransactionResponse error : $e");
    }
  }
}





