import 'dart:io';

import 'package:dio/dio.dart' as dio; // Alias Dio library
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:likhit/const/api_urls.dart';
import 'package:likhit/screens/lawyer_screen/screens/controllers/lawyer_profile_controller.dart';
import 'package:likhit/utils/const_toast.dart';

import '../../../common/const_api.dart';
import '../../drawer/models/profile_model.dart';
import '../model/lawyer_profile_model.dart';

class LawyerProfileControllerInside extends GetxController{
  var updatedProfileData = ProfileModel().obs;
  final LawyerProfileController profileController = Get.find();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    ApiService.init();
    getUpdatedProfile();
    preFillData();
  }





  RxBool isLoading = false.obs;

   //todo for lawyer kyc verification
  var aadharController = TextEditingController().obs;
  var panCardController = TextEditingController().obs;
  var lawyerLicenseController = TextEditingController().obs;

  //todo upload profile
  var nameController = TextEditingController().obs;
  var phoneController = TextEditingController().obs;
  var addressController = TextEditingController().obs;
  var websiteURLController = TextEditingController().obs;
  var aboutController = TextEditingController().obs;
  var experienceController = TextEditingController().obs;
  var dobController = TextEditingController().obs;
  RxString gender = ''.obs;

  final Rx<File?> _image = Rx<File?>(null);

  File? get image => _image.value;

  Future<void> getImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _image.value = File(pickedFile.path);
    } else {
      _image.value = "No file choose" as File?;
    }
  }
  final Rx<File?> _adharCardImage = Rx<File?>(null);
  final Rx<File?> _panCardImage = Rx<File?>(null);
  final Rx<File?> _licenseImage = Rx<File?>(null);

  File? get adharCardImage => _adharCardImage.value;
  File? get panCardImage => _panCardImage.value;
  File? get licenseImage => _licenseImage.value;


  var writtenLanguages = <String>[].obs;
  var spokenLanguages = <String>[].obs;
  var specialities = <String>[].obs;

  Future<void> getAdharCardImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _adharCardImage.value = File(pickedFile.path);
    } else {
      _adharCardImage.value = null;
    }
  }

  Future<void> getPanCardImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _panCardImage.value = File(pickedFile.path);
    } else {
      _panCardImage.value = null;
    }
  }

  Future<void> getLicenseImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _licenseImage.value = File(pickedFile.path);
    } else {
      _licenseImage.value = null;
    }
  }

  toClr(){
    panCardController.value.clear();
    aadharController.value.clear();
    lawyerLicenseController.value.clear();
    _adharCardImage.value = null;
    _panCardImage.value = null;
    _licenseImage.value = null;

  }

  Future<void> uploadLawyerDoc() async {
    if (adharCardImage == null || panCardImage == null || licenseImage == null) {
      ConstToast.to.showError('All images are required');
      return;
    }
    isLoading(true);
    try {
      dio.FormData formData = dio.FormData(); // Use Dio's FormData here

      formData.files.addAll([
        MapEntry(
          'adhar_card_image',
          await dio.MultipartFile.fromFile(adharCardImage!.path,
              filename: adharCardImage!.path.split('/').last),
        ),
        MapEntry(
          'pan_card_image',
          await dio.MultipartFile.fromFile(panCardImage!.path,
              filename: panCardImage!.path.split('/').last),
        ),
        MapEntry(
          'license_image',
          await dio.MultipartFile.fromFile(licenseImage!.path,
              filename: licenseImage!.path.split('/').last),
        ),
      ]);

      formData.fields.addAll({
        'pan_card_number': panCardController.value.text,
        'adhar_card_number': aadharController.value.text,
        'license_no': lawyerLicenseController.value.text,
        // Add other fields as needed
      }.entries.map((e) => MapEntry(e.key, e.value)));


      dio.Response<dynamic> response = await ApiService.uploadImages(
        url: '$baseUrl$uploadLawyerDocUrl',
        formData: formData,
      );

      debugPrint('uploadLawyerDocUrl ${response.statusCode}');

      if (response.data['response_code'] == 200) {
        ConstToast.to.showSuccess('Lawyer documents uploaded successfully');
        isLoading(false);
        toClr();
      } else {
        isLoading(false);
        ConstToast.to.showError('${response.data['message']}');
      }
    } catch (e) {
      isLoading(false);
      ConstToast.to.showError('Failed to upload images: $e');
      debugPrint('exception $e');
    }
  }

  RxList<LawyerProfileModelData> lawyerProfileList = <LawyerProfileModelData>[].obs;

  Future <void> updateLawyerProfile() async{
    isLoading(true);
try{
    dio.Response response = await ApiService.patchData(
     url:   '$baseUrl$updateLawyerProfileUrl',
      data: {
        "name": nameController.value.text,
        "mobile": phoneController.value.text,
        "dob": dobController.value.text,
        "address": addressController.value.text,
        "about": aboutController.value.text,
        "office_address": "", // Assuming this is not used in your form
        // "gender": gender.value,
        "website_url": websiteURLController.value.text,
        "experience": experienceController.value.text,
        "specialties": specialities, // Assuming multiple specialties can be selected
        "language_spoken": spokenLanguages,
        "language_written": writtenLanguages,
      }
    );

    debugPrint('uploadLawyerDocUrl ${response.statusCode}');

    if (response.data['response_code'] == 200) {
      LawyerProfileModel lawyerProfile = LawyerProfileModel.fromJson(response.data);
      // Clear the existing list and add new data
      Get.back();
      getUpdatedProfile();
      profileController.getProfileData();

      ConstToast.to.showSuccess('Lawyer profile updated successfully');
      isLoading(false);
      toClr();
    } else {
      isLoading(false);
      ConstToast.to.showError('${response.data['message']}');
    }
  } catch (e) {
  isLoading(false);
  ConstToast.to.showError('Failed to upload images: $e');
  debugPrint('exception $e');
  }

  }
  void preFillData() {
    if (updatedProfileData.value != null) {
      var profile = updatedProfileData.value!;
      nameController.value.text = profile.data?.name ?? "";
      phoneController.value.text = profile.data?.mobile ?? "";
      dobController.value.text = profile.data?.dob ?? "";
      addressController.value.text = profile.data?.address ?? "";
      aboutController.value.text = profile.data?.about ?? "";
      websiteURLController.value.text = profile.data?.websiteUrl ?? "";
      experienceController.value.text = profile.data?.experience ?? "";
      gender.value = profile.data?.gender ?? "";
      specialities.assignAll(profile.data?.specialties ?? []);
      writtenLanguages.assignAll(profile.data?.languageWritten ?? []);
      spokenLanguages.assignAll(profile.data?.languageSpoken ?? []);
    }
  }
  Future getUpdatedProfile()async {
    isLoading(true);
    try {
      dio.Response myTransactionResponse = await ApiService.getData(
        '$baseUrl$updateLawyerProfileUrl',

      );
      if(myTransactionResponse.data['response_code']==200){

        updatedProfileData.value = ProfileModel.fromJson(
            myTransactionResponse.data);
        preFillData();
        isLoading(false);
      }else{
        isLoading(false);
      }


    } catch (e) {
      isLoading(false);
      debugPrint("getProfileData error : $e");
    }
  }


  void toggleWrittenLanguage(String language) {
    if (writtenLanguages.contains(language)) {
      writtenLanguages.remove(language);
    } else {
      writtenLanguages.add(language);
    }
  }
  void toggleSpokenLanguage(String language) {
    if (spokenLanguages.contains(language)) {
      spokenLanguages.remove(language);
    } else {
      spokenLanguages.add(language);
    }
  } void toggleSpecialities(String speciality) {
    if (specialities.contains(speciality)) {
      specialities.remove(speciality);
    } else {
      specialities.add(speciality);
    }
  }

  //todo for Services offered Controller
  var titleController = TextEditingController().obs;
  var subtitleController = TextEditingController().obs;
  var feesController = TextEditingController().obs;

}