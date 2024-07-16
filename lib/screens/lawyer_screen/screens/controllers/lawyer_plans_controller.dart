import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:likhit/common/const_api.dart';
import 'package:dio/dio.dart' as dio;
import 'package:likhit/screens/lawyer_screen/screens/models/lawyer_plan_model.dart';
import '../../../../const/api_url.dart';
import '../../../../utils/const_toast.dart';

class LawyerPlansController extends GetxController{

  var lawyerPlanList = LawyerPlanModel().obs;
  var lawyerSubscriptionPlanList = LawyerPlanModel().obs;
  var searchTransactionController = TextEditingController().obs;

RxBool isLoading = false.obs;


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

  var selectedSubscriptionIndex = (-1).obs;
  var selectedNFCIndex = (-1).obs;

   bool isSelectedSubs(int index) => selectedSubscriptionIndex.value == index;

  bool isSelectedNFc(int index) => selectedNFCIndex.value == index;
  RxInt selectedPlanId = 0.obs;
  RxInt selectedFreePlanId = 0.obs;

  void selectSubscription(int index) {
    selectedSubscriptionIndex.value = index;
  }

  void selectNFC(int index) {
    selectedNFCIndex.value = index;
  }
  Future<void> refreshData() async {

    await getNFCPlan();
    await getSubsPlan();
  }


  Future getNFCPlan()async {
    isLoading(true);
    try {
      dio.Response clientTransactionResponse = await ApiService.getData(
          getNfcUrl,

      );
      if(clientTransactionResponse.data['response_code']==200){
        isLoading(false);
        lawyerPlanList.value = LawyerPlanModel.fromJson(
            clientTransactionResponse.data);
      }else{
        isLoading(false);
      }


    } catch (e) {
      isLoading(false);
      debugPrint("getNFCPlan error : $e");
    }
  }

  Future getSubsPlan()async {
    isLoading(true);
    try {
      dio.Response clientTransactionResponse = await ApiService.getData(
        getSubPlanUrl,

      );
      if(clientTransactionResponse.data['response_code']==200){
        isLoading(false);
        lawyerSubscriptionPlanList.value = LawyerPlanModel.fromJson(
            clientTransactionResponse.data);
      }
else{
        isLoading(false);
      }

    } catch (e) {
      isLoading(false);
      debugPrint("getNFCPlan error : $e");
    }
  }



  Future lawyerBuyPlan({int?id,int?address,int?coupon})async {

    debugPrint(" lawyerBuyPlan id : $id ,address: $address ");
    isLoading(true);
    try {
      dio.Response clientTransactionResponse = await ApiService.postData(
          url:   lawyerBuyPlantUrl,
          data: {

            "plan_id":id,
            "delhivery_address_id":address,
            "coupon_id":coupon??0


          }

      );
      if(clientTransactionResponse.data['response_code']==200){
        isLoading(false);
        ConstToast.to.showSuccess('${clientTransactionResponse.data['message']}');

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






}