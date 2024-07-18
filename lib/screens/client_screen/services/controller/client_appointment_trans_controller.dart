import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:likhit/common/const_api.dart';

import '../../../../const/api_url.dart';
import '../../../auth/controller/account_manage_controller.dart';
import '../model/client_appointment_trans_model.dart';
import '../model/client_side_client_trans_model.dart';

class ClientAppointmentTransController extends GetxController{

  RxBool isLoading = false.obs;
  var clientTransactionList = ClientAppointmentTransModel().obs;
  var searchTransactionController = TextEditingController().obs;
  final AccountManageController controller = Get.put(AccountManageController());

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
          clientAppointTransUrl,
          queryParameters: {
            'search': search,
            'page': "1",
          }
      );
      if(clientTransactionResponse.data['respnse_code']==200){
        isLoading(false);
        clientTransactionList.value = ClientAppointmentTransModel.fromJson(
            clientTransactionResponse.data);
      }else{
        isLoading(false);
      }


    } catch (e) {
      isLoading(false);
      debugPrint("getClientDirectTransactions error : $e");
    }
  }







}