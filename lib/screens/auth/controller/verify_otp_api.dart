import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart' as dio;
import '../../../common/const_api.dart';
import '../../../const/api_url.dart';
import 'package:get/get.dart';

import '../../../pending_review_page.dart';
import '../../../routes/routes.dart';
import '../../../utils/const_toast.dart';
import '../choose_account_type.dart';
import '../save_auth_data.dart';

Future<void> verifyByOtp(String email, String otp, BuildContext context) async {
  debugPrint("sending otp: $email, $otp");

  try {
    dio.Response response = await ApiService.postData(
      url: otpVerify,
      data: {
        'email': email,
        'otp': otp,
      },
    );

    debugPrint("response status code: ${response.statusCode}");
    if (response.data['response_code'] == 200) {
      var token = response.data['token_key'];
      var type = response.data['user_type'];
      debugPrint("type by login: $type");

      if (type == "Not Define") {
       Get.off(const ChoosePage(),);
      } else if (type == "Approval Pending") {
        Get.to(() => const PendingReviewPage());
      } else {
        Get.offAllNamed(ApplicationPages.myBottomBar);
      }

      UserDataService.saveUserData(token, type);
      debugPrint("saveUserData tokenType ${await UserDataService.getAuthToken()}");

      ConstToast.to.showSuccess(response.data['message']);
    } else {
      ConstToast.to.showError(response.data['message']);
      debugPrint('Failed verification');
    }
  } catch (e) {
    ConstToast.to.showError('$e');
    debugPrint('Error verification: $e');
  }
}
