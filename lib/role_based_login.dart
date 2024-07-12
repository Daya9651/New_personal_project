import 'package:get/get.dart';
import 'package:likhit/routes/routes.dart';
import 'package:likhit/screens/client_screen/client_lawyer_list.dart';
import 'package:likhit/screens/splash/components/bottombar.dart';
import 'package:likhit/screens/splash/splash_screen.dart';

import 'pending_review_page.dart';
import 'screens/auth/save_auth_data.dart';

checkRole() async {
  final loggedIn = await UserDataService.getAuthToken() != null;
  String? type = await UserDataService.getAuthToken();
  if (loggedIn) {
    if (type == "Client") {
      Get.offAll(ClientLawyerList());
    } else if (type == "Lawyer") {
      Get.offAllNamed(ApplicationPages.myBottomBar);
    } else {
      Get.offAll(PendingReviewPage());
    }
  }
}
