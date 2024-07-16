import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:likhit/common/const_api.dart';
import 'package:dio/dio.dart' as dio;
import 'package:likhit/screens/lawyer_screen/screens/controllers/lawyer_plans_controller.dart';
import 'package:likhit/screens/lawyer_screen/screens/models/checkout_model.dart';
import 'package:likhit/service/razor_pay_services.dart';
import 'package:likhit/utils/const_toast.dart';
import '../../../../const/api_url.dart';
import '../../../auth/services/model/city_model.dart';
import '../../../auth/services/model/state_model.dart';
import '../models/address_model.dart';
import '../models/client_transaction_model.dart';

class AddAddressController extends GetxController{

  final LawyerPlansController lawyerPlansController = Get.put(LawyerPlansController());
  var addressList = AddressModel().obs;
  var checkoutData = CheckOutModel().obs;
  var searchTransactionController = TextEditingController().obs;
   RxInt selectedAddressIndex = 0.obs;
  RxString state = ''.obs;
  RxString city = ''.obs;
RxBool isLoading = false.obs;
  final RazorpayService _razorpayService = RazorpayService();


  var nameController = TextEditingController().obs;
  var phoneController = TextEditingController().obs;
  var addressController = TextEditingController().obs;
  var pinController = TextEditingController().obs;
  RxInt  addressType = 0.obs;
RxInt selectedAddressId = 0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    ApiService.init();
    getAddressList();
    stateGet();
  }
  @override
  void onClose() {
    super.onClose();
    _razorpayService.clear();
  }

  var selectedTitle = 'Home'.obs;

  void setAddressType(int value, String title){
    addressType.value = value;
    selectedTitle.value = title;
  }

  // Method to select an address
  void selectAddressToBuy(int index) {
    selectedAddressIndex.value = index;
    selectedAddressId.value = addressList.value.data![index].id ?? 0; // Update selected address ID

  }
  bool isSelected(int index) {
    return selectedAddressIndex.value == index;
  }

  // Method to buy selected plan
  Future buySelectedPlan(id,addressId) async{
    try{
      debugPrint("buySelectedPlan $id,$addressId");
      if (selectedAddressIndex.value != -1) {
       await lawyerPlansController.lawyerBuyPlan(id:id,address:addressId);
      } else {
        ConstToast.to.showError('Please select an address to proceed.');
      }
    }catch(e){
      debugPrint("buySelectedPlan $e");
    }

  }




// todo state api

  var stateData = <StateData>[].obs;

  Future stateGet() async{

    cityData.value = [];
    try{
      dio.Response response = await ApiService.getData(
          stateUrl,
          queryParameters: {
            'country_id' : 1
          }
      );
      var data = response.data['data'] as List;
      stateData.value = data.map((item) => StateData.fromJson(item)).toList();
      update();
    }catch(e){
      debugPrint("StateGetApi exception : $e");
    }
  }

  // todo city api
  var cityData = <CityData>[].obs;
  Future cityGet( stateID) async{

    debugPrint("CityGetApi  : $stateID");
    try{
      cityData.value = [];
      city.value ="Select City";
      dio.Response response = await ApiService.getData(
          cityUrl,
          queryParameters: {
            'state_id' : stateID
          }
      );
      var data = response.data['data'] as List;
      cityData.value = data.map((item) => CityData.fromJson(item)).toList().toSet().toList();
      debugPrint("CityGetApi : ${cityData.map((item) => item.name)}");
      update();
    }catch(e){
      debugPrint("CityGetApi exception : $e");
    }
  }


  Future getAddressList({String ?search})async {
    isLoading(true);
    try {
      dio.Response addressResponse = await ApiService.getData(
          addressUrl,
          queryParameters: {
            'search': search,

          }
      );
      if(addressResponse.data['response_code']==200){
        isLoading(false);
        addressList.value = AddressModel.fromJson(
            addressResponse.data);
      }else{
        ConstToast.to.showError('${addressResponse.data['message']}');
      }


    } catch (e) {
      isLoading(false);
      debugPrint("getAddressList error : $e");
    }
  }
  Future deleteAddress(id)async {
    isLoading(true);
    try {
      dio.Response addressResponse = await ApiService.deleteData(
      url:     addressUrl,
          data: {
            'delhivery_address_id': id,

          }
      );
      if(addressResponse.data['response_code']==200){
        isLoading(false);

     ConstToast.to.showSuccess(addressResponse.data['message']);
     getAddressList();
      }else{
        isLoading(false);
     ConstToast.to.showError(addressResponse.data['message']);

      }

      getAddressList();
    } catch (e) {
      isLoading(false);
      debugPrint("getAddressList error : $e");
    }
  }



  Future addAddress({String ?search})async {
    isLoading(true);
    try {
      dio.Response addressResponse = await ApiService.postData(
     url:      addressUrl,
          data: {
            'address': addressController.value.text,
            'address_type': selectedTitle.value.toLowerCase(),
            'mobile_number': phoneController.value.text,
            'pincode': pinController.value.text,
            'name': nameController.value.text,
            'city': city.value,
            'country': "India",
            'state': state.value,

          }
      );
      if(addressResponse.data['response_code']==200){
        isLoading(false);
      ConstToast.to.showSuccess("${addressResponse.data['message']}");
      clrControllers();
      }else{
        isLoading(false);
      ConstToast.to.showError("${addressResponse.data['message']}");

      }


    } catch (e) {
      isLoading(false);
      debugPrint("getAddressList error : $e");
    }
  }

clrControllers(){
  addressController.value.clear();
  nameController.value.clear();
  phoneController.value.clear();
  pinController.value.clear();
  city.value ='';
  state.value ='';

}


  Future checkOut(planId,addressId,{int?couponId})async {
    isLoading(true);
    try {
      dio.Response addressResponse = await ApiService.getData(
           lawyerBuyPlantUrl,
         queryParameters : {
            'plan_id': planId,
            'delhivery_address_id': addressId,
            'coupon_id':couponId,


          }
      );
      if(addressResponse.data['response_code']==200){
        isLoading(false);
        checkoutData.value = CheckOutModel.fromJson(
            addressResponse.data);
        // ConstToast.to.showSuccess("${addressResponse.data['message']}");
        clrControllers();
      }else{
        isLoading(false);
        ConstToast.to.showError("${addressResponse.data['message']}");

      }


    } catch (e) {
      isLoading(false);
      debugPrint("checkOut error : $e");
    }
  }


  Future<void> buyPlanByRazorPay(int amount) async {
    _razorpayService.openCheckout(
      // amount: int.parse(amountController.value.text),
        amount: amount
    );
    String? orderID = await _razorpayService.waitForOrderID();

    // Now call razorPayResponse with the obtained order ID
    await razorPayResponse(orderID);
  }
  //razor pay success response

  Future<void> razorPayResponse(String? orderId) async {
    if (orderId != null) {
      isLoading(true);
      try {
        dio.Response addressResponse = await ApiService.postData(
            url: responseRazorUrl,
            data: {
              'razorpay_order_id': orderId,
              // Other parameters as needed
            }
        );
        // if (addressResponse.data['response_code'] == 200) {
          isLoading(false);
          ConstToast.to.showSuccess(addressResponse.data['message']);
        // } else {
        //   isLoading(false);
        //   ConstToast.to.showError(addressResponse.data['message']);
        // }
        getAddressList(); // Update your UI or data after successful payment
      } catch (e) {
        isLoading(false);
        debugPrint("razorPayResponse error : $e");
      }
    } else {
      // Handle case where orderID is null (optional based on your app logic)
      debugPrint('Error: Order ID is null');
    }
  }



}