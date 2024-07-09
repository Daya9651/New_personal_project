import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:likhit/screens/signUpPage.dart';
import 'package:likhit/screens/signup/signUp.dart';
import 'package:likhit/screens/splash/splash_screen.dart';

import '../const/const_height.dart';
import '../const/const_width.dart';
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
      if (loggedIn) {
        // If logged in, go to HomeScreen
        Get.off(SplashScreen());
      } else {
        // If not logged in, go to LoginScreen
        Get.off(SignInPage());
      }
    } catch (e) {
      debugPrint("Error checking login status: $e");
      // Navigate to login screen in case of error
      Get.off(SignInPage());
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
          'assets/logo/likhitlogo.png',
          // fit: BoxFit.fill,
          // fit: BoxFit.scaleDown,
        ),
      ),
    );
  }

  Future<bool> checkLoggedIn() async {
    // Check if user is logged in
    final authToken = await UserDataService.getAuthToken();
    return authToken != null;
  }
}