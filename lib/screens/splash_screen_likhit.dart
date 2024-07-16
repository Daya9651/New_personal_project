import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:likhit/pending_review_page.dart';
import 'package:likhit/routes/routes.dart';
import 'package:likhit/screens/auth/choose_account_type.dart';
import 'package:likhit/screens/sign_in_page.dart';
import 'package:likhit/screens/signup/signUp.dart';
import 'package:likhit/screens/bottombar/bottombar.dart';
import 'package:likhit/screens/splash/splash_screen.dart';

import '../const/const_height.dart';
import '../const/const_width.dart';
import '../const/image_strings.dart';
import 'auth/save_auth_data.dart';


class SplashScreenLikhit extends StatefulWidget {
  const SplashScreenLikhit({super.key});

  @override
  State<SplashScreenLikhit> createState() => _SplashScreenLikhitState();
}

class _SplashScreenLikhitState extends State<SplashScreenLikhit> {
  @override
  void initState() {
    super.initState();
    navigateToNextScreen();
  }

  void navigateToNextScreen() async {
    // Simulate a splash screen delay
    await Future.delayed(const Duration(seconds: 3));

    // Check login status
    try {
      final loggedIn = await UserDataService.getAuthToken() != null;
      final type = await UserDataService.getUserType() ;
      if (loggedIn) {

        if(type =="Approval Pending"){
          Get.off(PendingReviewPage());
        }else if(type =="Not Define"){
          Get.offAllNamed(ApplicationPages.choosePage);
        }
        else{
          Get.offAllNamed(ApplicationPages.myBottomBar);

        }

        // If logged in, go to HomeScreen
        // Get.offAllNamed(ApplicationPages.choosePage);
      } else {
        // If not logged in, go to LoginScreen
        Get.offAllNamed(ApplicationPages.signUpPage);
      }
    } catch (e) {
      debugPrint("Error checking login status: $e");
      // Navigate to login screen in case of error
      Get.offAllNamed(ApplicationPages.signUpPage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SizedBox(
        height: h25,
        width: w25,
        child: Image.asset(
          logo,
          // fit: BoxFit.fill,
          // fit: BoxFit.scaleDown,
        ),
      ),
    );
  }


}
