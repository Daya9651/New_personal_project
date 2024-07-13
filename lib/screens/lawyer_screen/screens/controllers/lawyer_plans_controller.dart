import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:likhit/common/const_api.dart';
import 'package:dio/dio.dart' as dio;
import 'package:likhit/screens/lawyer_screen/screens/models/lawyer_plan_model.dart';
import '../../../../const/api_url.dart';
import '../models/client_transaction_model.dart';

class LawyerPlansController extends GetxController{

  var lawyerPlanList = LawyerPlanModel().obs;
  var lawyerSubscriptionPlanList = LawyerPlanModel().obs;
  var searchTransactionController = TextEditingController().obs;




  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    ApiService.init();
    _pageController = PageController(initialPage: currentIndex.value);

    getNFCPlan();
    getSubsPlan();
  }


  late PageController _pageController;
  final currentIndex = 0.obs;
  RxInt selectedPlansNFC = RxInt(-1);
  RxInt selectedPlansSubs = RxInt(-1);


  void selectIndex(int index) {
    selectedPlansNFC.value = index;
  }
  void selectIndexSubs(int index) {
    selectedPlansSubs.value = index;
  }

  bool isSelectedNFc(int index) {
    return selectedPlansNFC.value == index;
  }
  bool isSelectedSubs(int index) {
    return selectedPlansNFC.value == index;
  }

  Future<void> refreshData() async {

    await getNFCPlan();
    await getSubsPlan();
  }


  Future getNFCPlan()async {
    try {
      dio.Response clientTransactionResponse = await ApiService.getData(
          getNfcUrl,

      );
      if(clientTransactionResponse.data['response_code']==200){

        lawyerPlanList.value = LawyerPlanModel.fromJson(
            clientTransactionResponse.data);
      }


    } catch (e) {
      debugPrint("getNFCPlan error : $e");
    }
  }

  Future getSubsPlan()async {
    try {
      dio.Response clientTransactionResponse = await ApiService.getData(
        getSubPlanUrl,

      );
      if(clientTransactionResponse.data['response_code']==200){

        lawyerSubscriptionPlanList.value = LawyerPlanModel.fromJson(
            clientTransactionResponse.data);
      }


    } catch (e) {
      debugPrint("getNFCPlan error : $e");
    }
  }







}