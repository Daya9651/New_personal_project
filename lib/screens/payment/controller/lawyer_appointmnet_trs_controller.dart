import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:likhit/screens/lawyer_screen/screens/models/lawyer_appointment_model.dart';
import 'package:dio/dio.dart' as dio;
import '../../../common/const_api.dart';
import '../../../const/api_url.dart';
import '../model/lawyer_appointmnet_trns_model.dart';

class LawyerAppointmentTrsController extends GetxController{
  RxBool isLoading = false.obs;
  var appointmentTransactionInvoiceList = LawyerAppointmentTransactionModel().obs;

  Future getAppointmentTransaction(int paymentID)async {
    isLoading(true);
    try {
      dio.Response invoiceResponse = await ApiService.getData(
          lawyerInvoiceAppointmentTransactionUrl,
          queryParameters: {
            'payment_id': paymentID,
            // 'invoiceResponse': paymentID,
          }
      );
      if(invoiceResponse.data['respnse_code']==200){
        appointmentTransactionInvoiceList.value = LawyerAppointmentTransactionModel.fromJson(invoiceResponse.data);
        isLoading(false);
      }else{
        isLoading(false);
      }
    } catch (e) {
      isLoading(false);
      debugPrint("getAppointmentTransaction error : $e");
    }
  }

}