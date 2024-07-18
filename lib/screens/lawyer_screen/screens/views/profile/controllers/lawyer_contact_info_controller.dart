import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:likhit/screens/lawyer_screen/screens/views/profile/models/lawyer_contact_info_model.dart';
import 'package:likhit/utils/const_toast.dart';

import '../../../../../../common/const_api.dart';
import '../../../../../../const/api_url.dart';
class LawyerContactInfoController extends GetxController{

RxBool isLoading = false.obs;
  var contactList = LawyerContactInfoModel().obs;
  var searchTransactionController = TextEditingController().obs;
  var mobileController = TextEditingController().obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    ApiService.init();
    getAllContacts();
  }


  Future getAllContacts({String ?search})async {
    isLoading(true);
    try {
      dio.Response myTransactionResponse = await ApiService.getData(
          lawyerPhoneUrl,
          queryParameters: {
            'search': search,
            // 'page': "1",
          }
      );
      if(myTransactionResponse.data['response_code']==200){
        isLoading(false);
        contactList.value = LawyerContactInfoModel.fromJson(
            myTransactionResponse.data);
      }else{
        isLoading(false);
        debugPrint("${myTransactionResponse.data['message']}");
      }


    } catch (e) {
      isLoading(false);
      debugPrint("getAllContacts error : $e");
    }
  }

var selectedMobile = 'Mobile-Number'.obs;
RxInt  mobileType = 2.obs;
void setMobileType(int value, String title){
  mobileType.value = value;
  selectedMobile.value = title;
}
  Future addContact()async {
    isLoading(true);
    try {
      dio.Response myTransactionResponse = await ApiService.postData(
      url:     lawyerPhoneUrl,
          data: {
            'title': selectedMobile.value,
            'number': mobileController.value.text,
            // 'page': "1",
          }
      );
      if(myTransactionResponse.data['response_code']==200){
        ConstToast.to.showSuccess("Contact Added");
        // getAllContacts();
        Get.back();
        isLoading(false);

      }else{
        ConstToast.to.showError("${myTransactionResponse.data['message']}");
        isLoading(false);
        debugPrint("${myTransactionResponse.data['message']}");
      }


    } catch (e) {
      isLoading(false);
      debugPrint("getAllContacts error : $e");
    }
  }
  Future deleteContact(int id)async {
    isLoading(true);
    try {
      dio.Response myTransactionResponse = await ApiService.deleteData(
      url:     lawyerPhoneUrl,
          data: {
            'phone_number_id': id,
            // 'page': "1",
          }
      );
      if(myTransactionResponse.data['response_code']==200){
        isLoading(false);
        getAllContacts();
      }else{
        isLoading(false);
        debugPrint("${myTransactionResponse.data['message']}");
      }


    } catch (e) {
      isLoading(false);
      debugPrint("getAllContacts error : $e");
    }
  }

}
