import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:likhit/common/const_api.dart';
import 'package:dio/dio.dart' as dio;
import '../../../../const/api_url.dart';
import '../models/client_transaction_model.dart';
import '../models/lawyer_my_transaction_model.dart';
import '../models/lawyer_payment_request_model.dart';

class LawyerPaymentRequestController extends GetxController{

  var myTransactionList = PaymentRequestTransactionModel().obs;
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
}