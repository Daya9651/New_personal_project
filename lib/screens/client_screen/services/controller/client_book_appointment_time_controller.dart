import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:likhit/service/razor_pay_services.dart';

import '../../../../common/const_api.dart';
import '../../../../const/api_url.dart';
import '../../../../utils/const_toast.dart';
import '../../../auth/save_auth_data.dart';

class ClientBookAppointmentTimeController extends GetxController {
  RxString timeDuration = ''.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    clientBookAppointmentPost();
    super.onInit();
  }

  RazorpayService _razorpayService = RazorpayService();

  var dateController = TextEditingController().obs;
  var timeController = TextEditingController().obs;
  var nameController = TextEditingController().obs;
  var emailController = TextEditingController().obs;
  var phoneController = TextEditingController().obs;
  var aboutController = TextEditingController().obs;

  bookAppointRazorPay() {
    _razorpayService.openCheckout(amount: 100);
  }

  Future clientBookAppointmentPost({
    int? serviceID,
    int? lawyerID,
  }) async {
    try {
      dio.Response response =
          await ApiService.postData(url: clientBookAppointmentUrl, data: {
        'lawyer_id': lawyerID,
        'date': dateController.value.text,
        'name': nameController.value.text,
        'email': emailController.value.text,
        'service_id': 36,
        'content': aboutController.value.text,
        'time': timeController.value.text,
        'phone_no': phoneController.value.text,
        'booktime': timeDuration.value,
      });
      if (response.data['response_code'] == 200) {
        var type = response.data['user_type'];
        UserDataService.saveUserType(type);
        ConstToast.to.showSuccess("${response.data['message']}");
      } else {
        debugPrint("else clientBookAppointmentApi ${response.data}");
        ConstToast.to.showError("${response.data['message']}");
      }
    } catch (e) {
      debugPrint("clientBookAppointmentApi exception : $e");
    }
  }
}
