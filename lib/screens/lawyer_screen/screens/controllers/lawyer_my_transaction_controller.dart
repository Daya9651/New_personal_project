import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:likhit/common/const_api.dart';
import 'package:dio/dio.dart' as dio;
import '../../../../const/api_url.dart';
import '../models/client_transaction_model.dart';
import '../models/lawyer_my_transaction_model.dart';

class LawyerMyTransactionController extends GetxController{

  var myTransactionList = LawyerMyTransactionModel().obs;
  var searchTransactionController = TextEditingController().obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    ApiService.init();
    getMyTransactions();
  }


  Future getMyTransactions({String ?search})async {
    try {
      dio.Response myTransactionResponse = await ApiService.getData(
          lawyerMyTransactionUrl,
          queryParameters: {
            'search': search,
            'page': "1",
          }
      );
      if(myTransactionResponse.data['response_code']==200){

        myTransactionList.value = LawyerMyTransactionModel.fromJson(
            myTransactionResponse.data);
      }


    } catch (e) {
      debugPrint("clientTransactionResponse error : $e");
    }
  }
}