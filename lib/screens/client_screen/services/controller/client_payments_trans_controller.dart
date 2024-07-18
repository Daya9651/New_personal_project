import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:likhit/common/const_api.dart';

import '../../../../const/api_url.dart';
import '../../../auth/controller/account_manage_controller.dart';
import '../model/client_payment_request_trans_model.dart';
import '../model/client_side_client_trans_model.dart';

class ClientPaymentsTransController extends GetxController{

  RxBool isLoading = false.obs;
  var clientTransactionList = ClientPaymentRequestTransModel().obs;
  var searchTransactionController = TextEditingController().obs;
  // final AccountManageController controller = Get.put(AccountManageController());

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    ApiService.init();
    getClientDirectTransactions();
  }


  Future getClientDirectTransactions({String ?search})async {
    isLoading(true);
    try {
      dio.Response clientTransactionResponse = await ApiService.getData(
          clientRequestPayTransUrl,
          queryParameters: {
            'search': search,
            'page': "1",
          }
      );
      if(clientTransactionResponse.data['respnse_code']==200){
        isLoading(false);
        clientTransactionList.value = ClientPaymentRequestTransModel.fromJson(
            clientTransactionResponse.data);
      }else{
        debugPrint("${ clientTransactionResponse.data['message']}");
        isLoading(false);
      }


    } catch (e) {
      isLoading(false);
      debugPrint("payments request getClientDirectTransactions error : $e");
    }
  }







}