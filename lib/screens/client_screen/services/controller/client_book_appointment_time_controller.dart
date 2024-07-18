import 'dart:convert';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:likhit/routes/routes.dart';
import 'package:likhit/service/razor_pay_services.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../../../common/const_api.dart';
import '../../../../const/api_url.dart';
import '../../../../utils/const_toast.dart';
import '../../../auth/save_auth_data.dart';

class ClientBookAppointmentTimeController extends GetxController {
  RxString timeDuration = ''.obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit

    super.onInit();
  }

  RazorpayService razorpayService = RazorpayService();

  var dateController = TextEditingController().obs;
  var timeController = TextEditingController().obs;
  var nameController = TextEditingController().obs;
  var emailController = TextEditingController().obs;
  var phoneController = TextEditingController().obs;
  var aboutController = TextEditingController().obs;

  bookAppointRazorPay(int amount,id) async {
    debugPrint("amount : $amount , orderId: $id");
    razorpayService.openCheckout(amount: amount,orderId: id);

    PaymentSuccessResponse? paymentResponse =
    await razorpayService.waitForPaymentResponse();

    if (paymentResponse != null) {
      // Handle the success response
      debugPrint('Payment Successful: ${jsonEncode(paymentResponse.data)}');
      await razorPayResponse(paymentResponse.data);
    } else {
      // Handle the failure case
      debugPrint('Payment Failed or Cancelled');
    }
  }



  clrControllers(){
    nameController.value.clear();
    timeController.value.clear();
    dateController.value.clear();
    emailController.value.clear();
    phoneController.value.clear();
    aboutController.value.clear();
  }

  Future clientBookAppointmentPost({
    int? serviceID,
    int? lawyerID,
    int? amount,
  }) async {
    isLoading(true);
    try {
      dio.Response response =
          await ApiService.postData(url: clientBookAppointmentUrl, data: {
        'lawyer_id': lawyerID,
        'date': dateController.value.text,
        'name': nameController.value.text,
        'email': emailController.value.text,
        'service_id': serviceID,
        'content': aboutController.value.text,
        'time': timeController.value.text,
        'phone_no': phoneController.value.text,
        'booktime': timeDuration.value,
      });
      if (response.data['response_code'] == 200) {
        isLoading(false);
        // var type = response.data['user_type'];
        // UserDataService.saveUserType(type);
        ConstToast.to.showSuccess("${response.data['message']}");
        var id = response.data['data']['payment_no'];
debugPrint("payment_no id $id");
        bookAppointRazorPay(amount??0,id);
        clrControllers();
        Get.offAndToNamed(ApplicationPages.myBottomBar);
        // Get.back();
      } else {
        isLoading(false);
        debugPrint("else clientBookAppointmentApi ${response.data}");
        ConstToast.to.showError("${response.data['message']}");
      }
    } catch (e) {
      isLoading(false);
      debugPrint("clientBookAppointmentApi exception : $e");
    }
  }


  Future<void> razorPayResponse( orderId) async {
    if (orderId != null) {
      isLoading(true);
      try {
        dio.Response addressResponse = await ApiService.postData(
            url: razorAppointUrl,
            data: {
              'response': jsonEncode(orderId),
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
        // getAddressList(); // Update your UI or data after successful payment
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
