import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:likhit/common/const_api.dart';
import 'package:likhit/routes/routes.dart';
import 'package:likhit/screens/lawyer_screen/screens/views/profile/models/lawyer_bank_model.dart';
import 'package:dio/dio.dart' as dio;

import '../../../../../../const/api_url.dart';
import '../../../../../../utils/const_toast.dart';

class LawyerBankController extends GetxController{

RxBool isLoading = false.obs;
  var lawyerBankList = LawyerBankModel().obs;
  var searchTransactionController = TextEditingController().obs;
  var nameController = TextEditingController().obs;
  var bankNameController = TextEditingController().obs;
  var accNoController = TextEditingController().obs;
  var ifscController = TextEditingController().obs;
  var micrController = TextEditingController().obs;
  var upiController = TextEditingController().obs;
  RxString isSelectAccType = "".obs;
  final Rx<File?> qrImageFile = Rx<File?>(null);
File? get qrImage => qrImageFile.value;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    ApiService.init();
    getAllBanks();
  }

  Future<void> getQrImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      qrImageFile.value = File(pickedFile.path);
    } else {
      qrImageFile.value = null;
    }
  }
  Future getAllBanks({String ?search})async {
    try {
      dio.Response myTransactionResponse = await ApiService.getData(
          lawyerBankUrl,
          queryParameters: {
            'search': search,
            'page': "1",
          }
      );
      if(myTransactionResponse.data['response_code']==200){

        lawyerBankList.value = LawyerBankModel.fromJson(
            myTransactionResponse.data);
      }else{
        debugPrint("${myTransactionResponse.data['message']}");
      }


    } catch (e) {
      debugPrint("getMyTransactions error : $e");
    }
  }

  void selectAccountType(value){
    isSelectAccType.value = value;
  }

  Future<void> addBankLawyer() async {
    if (qrImage== null ) {
      ConstToast.to.showError('Qr image is required');
      return;
    }
    isLoading(true);
    try {
      dio.FormData formData = dio.FormData();

      formData.files.addAll([

        MapEntry(
          'qr_code',
          await dio.MultipartFile.fromFile(qrImage!.path,
              filename: qrImage!.path.split('/').last),
        ),
      ]);

      formData.fields.addAll({
        'account_holder_name': nameController.value.text,
        'bank_name': bankNameController.value.text,
        'account_number': accNoController.value.text,
        'ifsc_code': ifscController.value.text,
        'account_type': isSelectAccType.value,
        'micr_code': micrController.value.text,
        'upi_id': upiController.value.text,
        // Add other fields as needed
      }.entries.map((e) => MapEntry(e.key, e.value)));


      dio.Response<dynamic> response = await ApiService.uploadImages(
        url: lawyerBankUrl,
        formData: formData,
      );

      debugPrint('addBankLawyer ${response.statusCode}');

      if (response.data['response_code'] == 200) {
        ConstToast.to.showSuccess('Bank Added Successfully');
        isLoading(false);
        getAllBanks();
        Get.offAndToNamed(ApplicationPages.lawyerBankPage, );
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
Future<void> updateBankDetails(int bankId) async {
  if (qrImage == null) {
    ConstToast.to.showError('Qr image is required');
    return;
  }
  isLoading(true);
  try {
    dio.FormData formData = dio.FormData();

    formData.files.addAll([
      MapEntry(
        'qr_code',
        await dio.MultipartFile.fromFile(qrImage!.path,
            filename: qrImage!.path.split('/').last),
      ),
    ]);

    formData.fields.addAll({
      'bank_id': bankId,
      'account_holder_name': nameController.value.text,
      'bank_name': bankNameController.value.text,
      'account_number': accNoController.value.text,
      'ifsc_code': ifscController.value.text,
      'account_type': isSelectAccType.value,
      'micr_code': micrController.value.text,
      'upi_id': upiController.value.text,

    }.entries.map((e) => MapEntry(e.key, e.value.toString())));

    dio.Response<dynamic> response = await ApiService.patchData(
      url: lawyerBankUrl,
      data: formData,
    );

    debugPrint('updateBankDetails ${response.statusCode}');

    if (response.data['response_code'] == 200) {
      ConstToast.to.showSuccess('Bank Updated Successfully');
      isLoading(false);
      getAllBanks();
      Get.offAndToNamed(ApplicationPages.lawyerBankPage);
      toClr();
    } else {
      isLoading(false);
      ConstToast.to.showError('${response.data['message']}');
    }
  } catch (e) {
    isLoading(false);
    ConstToast.to.showError('Failed to update bank details: $e');
    debugPrint('exception $e');
  }
}
Future deleteBank(int id)async {
  isLoading(true);
  try {
    dio.Response myTransactionResponse = await ApiService.deleteData(
     url:    lawyerBankUrl,
        data: {
          'bank_id': id,

        }
    );
    if(myTransactionResponse.data['response_code']==200){
      getAllBanks();
      isLoading(false);
    }else{
      isLoading(false);
      debugPrint("${myTransactionResponse.data['message']}");
    }


  } catch (e) {
    isLoading(false);
    debugPrint("getMyTransactions error : $e");
  }
}
  toClr(){
  nameController.value.clear();
  bankNameController.value.clear();
  accNoController.value.clear();
  ifscController.value.clear();
  micrController.value.clear();
  upiController.value.clear();
  qrImageFile.value = null;


}
}
