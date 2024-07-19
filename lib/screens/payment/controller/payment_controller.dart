import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:likhit/const/api_url.dart';
import 'package:dio/dio.dart' as dio;
import 'package:likhit/screens/payment/model/direct_transactions_model.dart';
import '../../../common/const_api.dart';
import '../model/lawyer_payment_request_model.dart';
import '../model/my_transactions_invoice_model.dart';

class PaymentController extends GetxController{
  RxBool isLoading = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    // getDirectInvoiceData();
    super.onInit();
  }
  var invoiceList = InvoiceModel().obs;
  var invoicePaymentRequestList = PaymentRequestModel().obs;
  Future getInvoiceData( paymentID)async {
    isLoading(true);
    try {
      dio.Response invoiceResponse = await ApiService.getData(
          invoiceUrl,
          queryParameters: {
            'payment_id': paymentID,
            // 'invoiceResponse': paymentID,
          }
      );
      if(invoiceResponse.data['respnse_code']==200){
        invoiceList.value = InvoiceModel.fromJson(invoiceResponse.data);
        isLoading(false);
      }else{
        isLoading(false);
      }
    } catch (e) {
      isLoading(false);
      debugPrint("invoiceResponse error : $e");
    }
  }
  Future getPaymentRequestInvoiceData( paymentID)async {
    isLoading(true);
    try {
      dio.Response invoiceResponse = await ApiService.getData(
          invoicePaymentRequestUrl,
          queryParameters: {
            'payment_id': paymentID,
            // 'invoiceResponse': paymentID,
          }
      );
      if(invoiceResponse.data['respnse_code']==200){
        isLoading(false);
        invoicePaymentRequestList.value = PaymentRequestModel.fromJson(invoiceResponse.data);
      }else{
        isLoading(false);
        debugPrint('${invoiceResponse.data}');
      }
    } catch (e) {
      isLoading(false);
      debugPrint("invoiceResponse error : $e");
    }
  }

  var invoiceDirectList = DirectTransactionInvoiceModel().obs;

  // Direct Transaction Invoice Api
  Future getDirectInvoiceData(paymentID)async {
    isLoading(true);
    try {
      dio.Response invoiceResponse = await ApiService.getData(
        invoiceDirectUrl,
        data: {
          'payment_id' : 39
        }
      );
      if(invoiceResponse.data['respnse_code']==200){
        isLoading(false);
        invoiceDirectList.value = DirectTransactionInvoiceModel.fromJson(invoiceResponse.data);
        debugPrint("invoiceDirect : ${invoiceDirectList.value.data?[0].status}");
      }else{
        isLoading(false);
      }

    } catch (e) {
      isLoading(false);
      debugPrint("invoiceDirectResponse error : $e");
    }
  }

}