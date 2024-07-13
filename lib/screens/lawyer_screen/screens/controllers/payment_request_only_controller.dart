import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:likhit/common/const_api.dart';
import 'package:likhit/screens/lawyer_screen/screens/models/client_list_model.dart';
import 'package:likhit/screens/lawyer_screen/screens/models/lawyer_plan_model.dart';
import 'package:likhit/utils/const_toast.dart';

import '../../../../const/api_url.dart';
import '../../../../service/razor_pay_services.dart';
class PaymentRequestOnlyController extends GetxController{
  final RazorpayService _razorpayService = RazorpayService();
  var lawyerPlanList = LawyerPlanModel().obs;
  var clientList = ClientListModel().obs;
  var searchTransactionController = TextEditingController().obs;
  RxInt isSelectedClientId = 0.obs;

  RxBool isLoading = false.obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    ApiService.init();
      getClientList();
  }
  @override
  void onClose() {
    super.onClose();
    _razorpayService.clear();
  }

  var amountController = TextEditingController().obs;
  var paymentReasonController = TextEditingController().obs;
  var expiryTimeController = TextEditingController().obs;





  Future<void> buyPlan() async {
    _razorpayService.openCheckout(
      // amount: int.parse(amountController.value.text),
      amount: 100
    );
  }


  Future<void> refreshData() async {

    // await getClientList();
  }


  Future getClientList({String ?search})async {
    try {
      dio.Response clientTransactionResponse = await ApiService.getData(
        clientListUrl,
        queryParameters: {
          "search":search,
        }

      );
      if(clientTransactionResponse.data['response_code']==200){

        clientList.value = ClientListModel.fromJson(
            clientTransactionResponse.data);
      }


    } catch (e) {
      debugPrint("getClientList error : $e");
    }
  }
  Future lawyerRequestPayment()async {
    isLoading(true);
    try {
      dio.Response clientTransactionResponse = await ApiService.postData(
        url:   lawyerRequestPaymentUrl,
     data: {

       "payment_amount":amountController.value.text,
       "payment_for":paymentReasonController.value.text,
       "expiry_time":expiryTimeController.value.text,
       "client_id":isSelectedClientId.value,

     }

      );
      if(clientTransactionResponse.data['response_code']==200){
        isLoading(false);
      ConstToast.to.showSuccess('${clientTransactionResponse.data['message']}');
      clr();
      // Get.back();
      }else{
        isLoading(false);
      ConstToast.to.showError('${clientTransactionResponse.data['message']}');

      }


    } catch (e) {
      debugPrint("getClientList error : $e");
      isLoading(false);
    }
  }

  List<String> getClientSuggestions(String query) {
    return clientList.value.data
        ?.where((client) => client.clientName.toString().toLowerCase().contains(query.toLowerCase()))
        .map((client) => client.clientName.toString())
        .toList() ?? [];
  }

  void selectClient(String clientName, int clientId) {
    // Store selected client ID
    isSelectedClientId.value = clientId;
    // Optionally, you can use clientName for any display purposes or further processing
    debugPrint('Selected Client: $clientName, ID: $clientId');
  }


  clr(){
    amountController.value.clear();
    paymentReasonController.value.clear();
    expiryTimeController.value.clear();
    isSelectedClientId.value =0;

  }


}