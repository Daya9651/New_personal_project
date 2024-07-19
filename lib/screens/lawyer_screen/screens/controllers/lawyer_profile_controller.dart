import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:likhit/const/api_url.dart';
import 'package:likhit/screens/lawyer_screen/screens/views/profile/models/lawyer_experience_model.dart';
import 'package:likhit/utils/const_toast.dart';

import '../../../../common/const_api.dart';
import '../../../drawer/models/profile_model.dart';
import '../views/profile/models/client_reviews_for_lawyer_model.dart';
import '../views/profile/models/lawyer_education_model.dart';
import '../views/profile/models/lawyer_service_model.dart';

class LawyerProfileController extends GetxController {

  RxBool isLoading = false.obs;

  var profileData = ProfileModel().obs;
  var reviewList = ClientReviewForLawyerModel().obs;
  var lawyerServiceList = LawyerServiceModel().obs;
  var lawyerEducationList = LawyerEducationModel().obs;
  var lawyerExperienceList = LawyerExperienceModel().obs;
  var isLiked = <RxBool>[].obs;
  var isDisliked = <RxBool>[].obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    ApiService.init();
    getProfileData();
    getServiceData();
    getLawyerEducationData();
    getLawyerExperience();

  }

//service add
  var titleController = TextEditingController().obs;
  var subTitleController = TextEditingController().obs;
  var feesController = TextEditingController().obs;
  var endDateController = TextEditingController().obs;



  void toggleLike(int index) {
    if (isLiked[index].value) {
      isLiked[index].value = false;
    } else {
      isLiked[index].value = true;
      isDisliked[index].value = false;
    }
  }


  void toggleDislike(int index) {
    if (isDisliked[index].value) {
      isDisliked[index].value = false;
    } else {
      isDisliked[index].value = true;
      isLiked[index].value = false;
    }
  }
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
      ConstToast.to.showError(' image is required');
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
        url:lawyerUpdateProfileUrl,
        formData: formData,
      );

      debugPrint('uploadLawyerDocUrl ${response.statusCode}');

      if (response.data['response_code'] == 200) {
        ConstToast.to.showSuccess('Lawyer documents uploaded successfully');
        isLoading(false);
        getProfileData();
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

  Future getProfileData()async {
    try {
      dio.Response myTransactionResponse = await ApiService.getData(
        profileUrl,

      );
      if(myTransactionResponse.data['response_code']==200){

        profileData.value = ProfileModel.fromJson(
            myTransactionResponse.data);
      }


    } catch (e) {
      debugPrint("getProfileData error : $e");
    }
  }

  //service
  Future getServiceData()async {
    isLoading(true);
    try {
      dio.Response myTransactionResponse = await ApiService.getData(
        lawyerServiceUrl,

      );
      if(myTransactionResponse.data['response_code']==200){
        isLoading(false);
        lawyerServiceList.value = LawyerServiceModel.fromJson(
            myTransactionResponse.data);
      }else{
        isLoading(false);
        ConstToast.to.showError("${myTransactionResponse.data['response_code']}");
      }


    } catch (e) {
      isLoading(false);
      debugPrint("getProfileData error : $e");
    }
  }
  Future postServiceData()async {
    isLoading(true);
    try {
      dio.Response myTransactionResponse = await ApiService.postData(
      url:   lawyerServiceUrl,
data: {
        "title":titleController.value.text,
        "subtitle":subTitleController.value.text,
        "fee":feesController.value.text,


}
      );
      if(myTransactionResponse.data['response_code']==200){
        isLoading(false);
        getServiceData();
      }else{
        isLoading(false);
        ConstToast.to.showError("${myTransactionResponse.data['response_code']}");
      }


    } catch (e) {
      isLoading(false);
      debugPrint("getProfileData error : $e");
    }
  }
  Future updateServiceData(int serviceId)async {
    isLoading(true);
    try {
      dio.Response myTransactionResponse = await ApiService.patchData(
      url:  '$lawyerServiceUrl',
          data: {
        "fee_id":serviceId,
        "title":titleController.value.text,
        "subtitle":subTitleController.value.text,
        "fee":feesController.value.text,


}
      );
      if(myTransactionResponse.data['response_code']==200){
        isLoading(false);
        getServiceData();
        ConstToast.to.showSuccess("Service Updated");
      }else{
        isLoading(false);
        ConstToast.to.showError("${myTransactionResponse.data['response_code']}");
      }


    } catch (e) {
      isLoading(false);
      debugPrint("updateServiceData error : $e");

    }
  }
  Future deleteServiceData(int id)async {
    isLoading(true);
    try {
      dio.Response myTransactionResponse = await ApiService.deleteData(
      url:   lawyerServiceUrl,
data: {
        "fee_id":id,



}
      );
      if(myTransactionResponse.data['response_code']==200){
        isLoading(false);
        getServiceData();
      }else{
        isLoading(false);
        ConstToast.to.showError("${myTransactionResponse.data['response_code']}");
      }


    } catch (e) {
      isLoading(false);
      debugPrint("getProfileData error : $e");
    }
  }




//education
  Future getLawyerEducationData()async {
    isLoading(true);
    try {
      dio.Response myTransactionResponse = await ApiService.getData(
        lawyerEducationUrl,

      );
      if(myTransactionResponse.data['response_code']==200){
        isLoading(false);
        lawyerEducationList.value = LawyerEducationModel.fromJson(
            myTransactionResponse.data);
      }else{
        isLoading(false);
        ConstToast.to.showError("${myTransactionResponse.data['response_code']}");
      }


    } catch (e) {
      isLoading(false);
      debugPrint("getLawyerEducationData error : $e");
    }
  }
  Future postLawyerEducation()async {
    isLoading(true);
    try {
      dio.Response myTransactionResponse = await ApiService.postData(
          url:   lawyerEducationUrl,
          data: {
            "name":titleController.value.text,
            "title":subTitleController.value.text,
            "year":feesController.value.text,


          }
      );
      if(myTransactionResponse.data['response_code']==200){
        isLoading(false);
        getLawyerEducationData();
      }else{
        isLoading(false);
        ConstToast.to.showError("${myTransactionResponse.data['response_code']}");
      }


    } catch (e) {
      isLoading(false);
      debugPrint("getProfileData error : $e");
    }
  }
  Future updateLawyerEducation(int serviceId)async {
    isLoading(true);
    try {
      dio.Response myTransactionResponse = await ApiService.patchData(
          url:  lawyerEducationUrl,
          data: {
            "education_id":serviceId,
            "name":titleController.value.text,
            "title":subTitleController.value.text,
            "year":feesController.value.text,


          }
      );
      if(myTransactionResponse.data['response_code']==200){
        isLoading(false);
        getLawyerEducationData();
        ConstToast.to.showSuccess("Service Updated");
      }else{
        isLoading(false);
        ConstToast.to.showError("${myTransactionResponse.data['response_code']}");
      }


    } catch (e) {
      isLoading(false);
      debugPrint("updateServiceData error : $e");

    }
  }
  Future deleteLawyerEducation(int id)async {
    isLoading(true);
    try {
      dio.Response myTransactionResponse = await ApiService.deleteData(
          url:   lawyerEducationUrl,
          data: {
            "education_id":id,



          }
      );
      if(myTransactionResponse.data['response_code']==200){
        isLoading(false);
        getLawyerEducationData();
      }else{
        isLoading(false);
        ConstToast.to.showError("${myTransactionResponse.data['message']}");
      }


    } catch (e) {
      isLoading(false);
      debugPrint("getProfileData error : $e");
    }
  }


  //experience
  Future getLawyerExperience()async {
    isLoading(true);
    try {
      isLoading(false);
      dio.Response myTransactionResponse = await ApiService.getData(
        lawyerExperienceUrl,

      );
      if(myTransactionResponse.data['response_code']==200){

        lawyerExperienceList.value = LawyerExperienceModel.fromJson(
            myTransactionResponse.data);
        isLoading(false);
      }else{
        isLoading(false);
        ConstToast.to.showError("${myTransactionResponse.data['response_code']}");
      }


    } catch (e) {
      isLoading(false);
      debugPrint("getLawyerEducationData error : $e");
    }
  }
  Future postLawyerExperience()async {
    isLoading(true);
    try {
      dio.Response myTransactionResponse = await ApiService.postData(
          url:   lawyerExperienceUrl,
          data: {
            "title":titleController.value.text,
            "subtitle":subTitleController.value.text,
            "from_date":feesController.value.text,
            "to_date":endDateController.value.text,


          }
      );
      if(myTransactionResponse.data['response_code']==200){
        isLoading(false);
        getLawyerExperience();
      }else{
        isLoading(false);
        ConstToast.to.showError("${myTransactionResponse.data['response_code']}");
      }


    } catch (e) {
      isLoading(false);
      debugPrint("getProfileData error : $e");
    }
  }
  Future updateLawyerExperience(int serviceId)async {
    isLoading(true);
    try {
      dio.Response myTransactionResponse = await ApiService.patchData(
          url:  lawyerExperienceUrl,
          data: {
            "experience_id":serviceId,
            "title":titleController.value.text,
            "subtitle":subTitleController.value.text,
            "from_date":feesController.value.text,
            "to_date":endDateController.value.text,


          }
      );
      if(myTransactionResponse.data['response_code']==200){
        isLoading(false);
        getLawyerExperience();
        ConstToast.to.showSuccess("Service Updated");
      }else{
        isLoading(false);
        ConstToast.to.showError("${myTransactionResponse.data['response_code']}");
      }


    } catch (e) {
      isLoading(false);
      debugPrint("updateServiceData error : $e");

    }
  }
  Future deleteLawyerExperience(int id)async {
    isLoading(true);
    try {
      dio.Response myTransactionResponse = await ApiService.deleteData(
          url:   lawyerExperienceUrl,
          data: {
            "experience_id":id,



          }
      );
      if(myTransactionResponse.data['response_code']==200){
        isLoading(false);
        getLawyerExperience();
      }else{
        isLoading(false);
        ConstToast.to.showError("${myTransactionResponse.data['response_code']}");
      }


    } catch (e) {
      isLoading(false);
      debugPrint("getProfileData error : $e");
    }
  }


  //reviews
  Future getReviews(int id)async {
    isLoading(true);
    try {
      dio.Response clientTransactionResponse = await ApiService.getData(
          reviewsUrl,
          queryParameters: {
            'lawyer_id': id,

          }
      );
      if(clientTransactionResponse.data['response_code']==200){

        reviewList.value = ClientReviewForLawyerModel.fromJson(
            clientTransactionResponse.data);
        isLiked.value =
            List.generate(reviewList.value.data!.length, (index) => false.obs);
        isDisliked.value =
            List.generate(reviewList.value.data!.length, (index) => false.obs);
        isLoading(false);
      }


    } catch (e) {
      isLoading(false);
      debugPrint("getReviews error : $e");
    }
  }
  Future reviewLike(int id)async {
    isLoading(false);
    try {
      dio.Response clientTransactionResponse = await ApiService.postData(
       url:    reviewsLikeUrl,
          data: {
            'review_id': id,

          }
      );
      if(clientTransactionResponse.data['response_code']==200){
        isLoading(false);
      }


    } catch (e) {
      isLoading(false);
      debugPrint("getReviews error : $e");
    }
  }
  Future reviewDisLike(int id)async {
    isLoading(true);
    try {
      dio.Response clientTransactionResponse = await ApiService.postData(
       url:    reviewsDisLikeUrl,
          data: {
            'review_id': id,

          }
      );
      if(clientTransactionResponse.data['response_code']==200){
        isLoading(false);
      }else{
        isLoading(false);
      }


    } catch (e) {
      isLoading(false);
      debugPrint("reviewDisLike error : $e");
    }
  }





}





