import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:likhit/common/const_api.dart';
import 'package:dio/dio.dart' as dio;
import '../../../../const/api_url.dart';
import '../models/client_transaction_model.dart';

class ClientTransactionController extends GetxController{

  var clientTransactionList = LawyerClientTransactionsModel().obs;
  var searchTransactionController = TextEditingController().obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    ApiService.init();
    getClientDirectTransactions();
  }


  Future getClientDirectTransactions({String ?search})async {
    try {
      dio.Response clientTransactionResponse = await ApiService.getData(
          lawyerPaymentUrl,
          queryParameters: {
            'search': search,
            'page': "1",
          }
      );
          if(clientTransactionResponse.data['respnse_code']==200){

            clientTransactionList.value = LawyerClientTransactionsModel.fromJson(
                clientTransactionResponse.data);
          }


    } catch (e) {
debugPrint("clientTransactionResponse error : $e");
    }
  }







}