import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:likhit/const/api_url.dart';
import 'package:likhit/screens/client_screen/services/controller/client_api_controller.dart';

import '../../../../common/const_api.dart';
import '../../../../utils/const_toast.dart';

class ClientEditController extends GetxController {
  // var profileData = ProfileModel().obs;
  final ClientApiController clientApiController =
      Get.put(ClientApiController());
  final Rx<File?> _profilePic = Rx<File?>(null);

  File? get profilePic => _profilePic.value;

  Future<void> getPic(source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      _profilePic.value = File(pickedFile.path);
    } else {
      _profilePic.value = null;
    }
  }

  Future<void> postProfilePic() async {
    if (profilePic == null) {
      // ConstToast.to.showError(' image is required');
      return;
    }
    isLoading(true);
    try {
      dio.FormData formData = dio.FormData(); // Use Dio's FormData here

      formData.files.addAll([
        MapEntry(
          'image',
          await dio.MultipartFile.fromFile(profilePic!.path,
              filename: profilePic!.path.split('/').last),
        ),
      ]);

      formData.fields.addAll({
        // Add other fields as needed
      }.entries.map((e) => MapEntry(e.key, e.value)));

      dio.Response<dynamic> response = await ApiService.uploadPatchImages(
        url: clientEditProfileUrl,
        formData: formData,
      );

      debugPrint('uploadLawyerDocUrl ${response.statusCode}');

      if (response.data['response_code'] == 200) {
        ConstToast.to.showSuccess('Client uploaded successfully');
        isLoading(false);

        // patchClientEditProfile();
        clientApiController.getClientProfile();
        update();
      } else {
        isLoading(false);
        // ConstToast.to.showError('${response.data['message']}');
        // ConstToast.to.showError('re select image');
      }
    } catch (e) {
      isLoading(false);
      // ConstToast.to.showError('Failed to upload images: $e');
      debugPrint('exception $e');
    }
  }

  RxBool isLoading = false.obs;

  var nameController = TextEditingController().obs;
  var mobileController = TextEditingController().obs;
  var emailController = TextEditingController().obs;
  var dobController = TextEditingController().obs;
  RxString gender = ''.obs;
  var addressController = TextEditingController().obs;

  Future patchClientEditProfile() async {
    isLoading(true);
    try {
      dio.Response editProfile =
          await ApiService.patchData(url: clientEditProfileUrl, data: {
        "name": nameController.value.text,
        "email": emailController.value.text,
        "mobile": mobileController.value.text,
        "dob": dobController.value.text,
        "gender": gender.value,
        "address": addressController.value.text,
        // 'image': "",
      });
      ClientApiController().getClientProfile();
      update();
      if (editProfile.data['response_code'] == 200) {
        ConstToast.to.showSuccess("${editProfile.data['message']}");
        isLoading(false);
      } else {
        isLoading(false);
        // ConstToast.to.showError("${editProfile.data['response_code']}");
      }
    } catch (e) {
      isLoading(false);
      debugPrint("patchClientEditProfile error : $e");
    }
  }
}
