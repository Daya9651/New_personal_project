import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:likhit/common/const_api.dart';
import 'package:likhit/screens/lawyer_screen/screens/models/lawyer_appointment_model.dart';
import 'package:likhit/utils/const_toast.dart';

import '../../../../const/api_url.dart';

class LawyerAppointmentControllers extends GetxController{

  var lawyerAppointmentList = LawyerAppointmentModel().obs;
  var searchTransactionController = TextEditingController().obs;

  var dateController = TextEditingController().obs;
  var timeController = TextEditingController().obs;
  var reasonController = TextEditingController().obs;
RxBool isLoading = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    ApiService.init();
    getLawyerAppointment();
  }


  Future getLawyerAppointment({String ?search})async {
    isLoading(true);
    try {
      dio.Response clientTransactionResponse = await ApiService.getData(
          viewLawyerAppointment,
          queryParameters: {
            'search': search,
            'page': "1",
          }
      );
      if(clientTransactionResponse.data['response_code']==200){
        isLoading(false);
        lawyerAppointmentList.value = LawyerAppointmentModel.fromJson(
            clientTransactionResponse.data);
      }else{
        isLoading(false);
      }


    } catch (e) {
      isLoading(false);
      debugPrint("LawyerAppointmentModel error : $e");
    }
  }



  Future bookAppointment(id,status)async {
    isLoading(true);
    try {
      dio.Response clientTransactionResponse = await ApiService.postData(
       url:    lawyerConfirmRejectAppointmentUrl,
        data: {
          "appointment_id":id,
          "status":status,
        }
      );
      if(clientTransactionResponse.data['response_code']==200) {
        isLoading(false);
        Get.back();
        ConstToast.to.showSuccess("${clientTransactionResponse.data['message']}");
      }else{
        isLoading(false);
        ConstToast.to.showError("${clientTransactionResponse.data['message']}");


      }

      getLawyerAppointment();
    } catch (e) {
      isLoading(false);
      debugPrint("bookAppointment error : $e");
    }
  }


  Future rescheduleAppointment(id)async {
    isLoading(true);
    try {
      dio.Response clientTransactionResponse = await ApiService.postData(
       url:    lawyerConfirmRejectAppointmentUrl,
        data: {
          "appointment_id":id,
          "date":dateController.value.text,
          "time":timeController.value.text,
          // "time":"7.15",
          "reason":reasonController.value.text,
          "status":"Reschedule",

        }
      );
      if(clientTransactionResponse.data['response_code']==200) {
        isLoading(false);
        Get.back();
        clrControllers();
        ConstToast.to.showSuccess("${clientTransactionResponse.data['message']}");
      }else{
        ConstToast.to.showError("${clientTransactionResponse.data['message']}");

        isLoading(false);
      }

      getLawyerAppointment();
    } catch (e) {
      isLoading(false);
      debugPrint("rescheduleAppointment : $e");
    }
  }


clrControllers(){
    dateController.value.clear();
    timeController.value.clear();
    reasonController.value.clear();
}

}