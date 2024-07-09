import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:likhit/const/api_url.dart';
import 'package:likhit/screens/profile/model/contact_add_email_model.dart';
import 'package:likhit/screens/profile/model/contact_add_social_media_model.dart';

import '../../../../service/model/edit_profile.dart';
import '../../../../utils/const_toast.dart';
import '../../../auth/save_auth_data.dart';
import '../../model/contact_add_phone_number_model.dart';

class ContactInformationServices extends GetxController {

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    addPhoneNumberFetch();
    addEmailFetch();
    addSocialMediaFetch();
  }

  //todo add phone number get and post api
  Future<void> addPhoneNumberPost(String title, String number) async {
    final dio = Dio();
    try {
      debugPrint(
          'addPhoneNumberPost $title $number Token ${ await UserDataService
              .getAuthToken()}');
      var response = await dio.post(addPhoneNumber,
          data: {
            'title': title,
            'number': number,
          },
          options: Options(
            headers: {
              "Authorization": 'Token ${ await UserDataService.getAuthToken()}'
            },
          ));

      if (response.data['response_code'] == 200) {
        ConstToast.to.showSuccess(response.data['message']);
        addPhoneNumberFetch();

        debugPrint('Success  ${response.data['message']}');
      }
    } catch (e) {
      ConstToast.to.showError('$e');
      debugPrint("Error --  $e");
    }
  }
  var addPhoneNumberData = <ContactNumber>[].obs;
  Future<void> addPhoneNumberFetch() async {
    final dio = Dio();
    try {
      var response = await dio.get(addPhoneNumber,
          options: Options(
              headers: {
                "Authorization": 'Token ${ await UserDataService
                    .getAuthToken()}'
              }
          ));
      var data = response.data['data'] as List;
      addPhoneNumberData.value = data.map((item) => ContactNumber.fromJson(item)).toList();
      update();
    } catch (e) {
      debugPrint(" fetch add number ${e}");
    }
  }


//todo add email get and post api
  Future<void> addEmailPost(String email) async {
    final dio = Dio();
    try {
      debugPrint('addEmailPost $email Token ${ await UserDataService
          .getAuthToken()}');
      var response = await dio.post(addEmail,
          data: {
            'email': email,
          },
          options: Options(
            headers: {
              "Authorization": 'Token ${ await UserDataService.getAuthToken()}'
            },
          ));

      if (response.data['response_code'] == 200) {
        ConstToast.to.showSuccess(response.data['message']);
        addEmailFetch();
        debugPrint('Success  ${response.data['message']}');
      }
    } catch (e) {
      ConstToast.to.showError('$e');
      debugPrint("Error --  $e");
    }
  }
  var addEmailData = <EmailData>[].obs;
  Future<void> addEmailFetch() async {
    final dio = Dio();
    try {
      var response = await dio.get(addEmail,
          options: Options(
              headers: {
                "Authorization": 'Token ${ await UserDataService
                    .getAuthToken()}'
              }
          ));
      var data = response.data['data'] as List;
      addEmailData.value = data.map((item) => EmailData.fromJson(item)).toList();
      update();
    } catch (e) {
      debugPrint(" fetch add number ${e}");
    }
  }

  //todo add social media get and post
  Future<void> addSocialMediaPost(String platform, String url) async {
    isLoading(true);
    final dio = Dio();
    try {
      debugPrint('addSocialMediaPost $platform $url Token ${ await UserDataService.getAuthToken()}');
      var response = await dio.post(addSocialMedia,
          data: {
            'platform': platform,
            'url': url
          },
          options: Options(
            headers: {
              "Authorization": 'Token ${ await UserDataService.getAuthToken()}'
            },
          ));

      if (response.data['response_code'] == 200) {
        ConstToast.to.showSuccess(response.data['message']);

        // Get.back();

        isLoading(false);

        debugPrint('Success  ${response.data['message']}');
      }else{
        ConstToast.to.showError(response.data['message']);
        isLoading(false);
      }
      addSocialMediaFetch();
    } catch (e) {
      isLoading(false);
      ConstToast.to.showError('$e');
      debugPrint("Error --  $e");
    }
  }
  var addSocialMediaData = <SocialMediaData>[].obs;
  Future<void> addSocialMediaFetch() async {
    final dio = Dio();
    try {
      var response = await dio.get(addSocialMedia,
          options: Options(
              headers: {
                "Authorization": 'Token ${ await UserDataService.getAuthToken()}'
              }
          ));
      var data = response.data['data'] as List;
      addSocialMediaData.value = data.map((item) => SocialMediaData.fromJson(item)).toList();
      update();
    } catch (e) {
      debugPrint(" fetch add number ${e}");
    }
  }

}