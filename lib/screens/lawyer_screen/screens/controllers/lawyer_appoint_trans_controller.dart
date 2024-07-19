import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:likhit/common/const_api.dart';
import 'package:dio/dio.dart' as dio;
import '../../../../const/api_url.dart';
import '../../../auth/controller/account_manage_controller.dart';
import '../models/client_transaction_model.dart';
import '../models/lawyer_appoint_trans_model.dart';

class LawyerAppointTransController extends GetxController{
  var clientTransactionList = LawyerAppointTransModel().obs;
  // var clientViewHistory = UserPaymentHistory().obs;
  var searchTransactionController = TextEditingController().obs;
  // final AccountManageController controller = Get.put(AccountManageController());

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    ApiService.init();
    getClientDirectTransactions();
    // getClientViewHistory();

  }
  Future getClientDirectTransactions({String ?search})async {
    try {
      dio.Response clientTransactionResponse = await ApiService.getData(
          lawyerAppointmentTransactionUrl,
          queryParameters: {
            'search': search,
            'page': "1",
          }
      );
      if(clientTransactionResponse.data['respnse_code']==200){

        clientTransactionList.value = LawyerAppointTransModel.fromJson(
            clientTransactionResponse.data);
      }
    } catch (e) {
      debugPrint("getClientDirectTransactions error : $e");
    }
  }

}