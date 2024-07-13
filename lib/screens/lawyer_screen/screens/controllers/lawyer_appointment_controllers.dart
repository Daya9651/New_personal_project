import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:likhit/common/const_api.dart';
import 'package:likhit/screens/lawyer_screen/screens/models/invoice_model.dart';
import 'package:likhit/screens/lawyer_screen/screens/models/lawyer_appointment_model.dart';
import 'package:likhit/utils/const_toast.dart';

import '../../../../const/api_url.dart';
import '../models/invoice_model.dart';

class LawyerAppointmentControllers extends GetxController{

  var lawyerAppointmentList = LawyerAppointmentModel().obs;
  var searchTransactionController = TextEditingController().obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    ApiService.init();
    getLawyerAppointment();

  }


  Future getLawyerAppointment({String ?search})async {
    try {
      dio.Response clientTransactionResponse = await ApiService.getData(
          viewLawyerAppointment,
          queryParameters: {
            'search': search,
            'page': "1",
          }
      );
      if(clientTransactionResponse.data['response_code']==200){

        lawyerAppointmentList.value = LawyerAppointmentModel.fromJson(
            clientTransactionResponse.data);
      }


    } catch (e) {
      debugPrint("LawyerAppointmentModel error : $e");
    }
  }



  Future bookAppointment(id,status)async {
    try {
      dio.Response clientTransactionResponse = await ApiService.postData(
       url:    lawyerConfirmRejectAppointmentUrl,
        data: {
          "appointment_id":id,
          "status":status,
        }
      );
      if(clientTransactionResponse.data['response_code']==200) {

        Get.back();
        ConstToast.to.showSuccess("${clientTransactionResponse.data['message']}");
      }else{
        ConstToast.to.showError("${clientTransactionResponse.data['message']}");


      }

      getLawyerAppointment();
    } catch (e) {
      debugPrint("clientTransactionResponse error : $e");
    }
  }

// daya

  var invoice = InvoiceModel().obs;
  Future getInvoiceById({int? id})async {

    try {
      dio.Response response = await ApiService.getData(
          invoiceUrl,
          queryParameters: {
            'payment_id': 4,
          }
      );
      if(response.data['respnse_code']==200){

        invoice.value = InvoiceModel.fromJson(
            response.data);
      }

    } catch (e) {
      debugPrint("invoiceData error : $e");
    }
  }


}