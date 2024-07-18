import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:likhit/common/const_api.dart';
import 'package:dio/dio.dart' as dio;
import '../../../../const/api_url.dart';
// import '../../../client transactions/model/client_view_appointment.dart';

import '../models/lawyer_payment_request_model.dart';

class LawyerPaymentRequestController extends GetxController{

  var myTransactionList = PaymentRequestTransactionModel().obs;
  // var clientAppointmentTransaction = UserPaymentHistory().obs;
  var searchTransactionController = TextEditingController().obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    ApiService.init();
    getPaymentRequestTransactions();
  }


  Future getPaymentRequestTransactions({String ?search})async {
    try {
      dio.Response myTransactionResponse = await ApiService.getData(
          paymentLawyerRequestTransactionUrl,
          queryParameters: {
            'search': search,
            'page': "1",
          }
      );
      if(myTransactionResponse.data['respnse_code']==200){

        myTransactionList.value = PaymentRequestTransactionModel.fromJson(
            myTransactionResponse.data);
      }


    } catch (e) {
      debugPrint("getPaymentRequestTransactions error : $e");
    }
  }
  // Future getClientAppointmentTransactions({String ?search})async {
  //   try {
  //     dio.Response myTransactionResponse = await ApiService.getData(
  //         clientAppointmentHistoryUrl,
  //         queryParameters: {
  //           'search': search,
  //           'page': "1",
  //         }
  //     );
  //     if(myTransactionResponse.data['respnse_code']==200){
  //
  //       clientAppointmentTransaction.value = UserPaymentHistory.fromJson(
  //           myTransactionResponse.data);
  //     }
  //
  //
  //   } catch (e) {
  //     debugPrint("getPaymentRequestTransactions error : $e");
  //   }
  // }
}