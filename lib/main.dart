import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:likhit/screens/auth/choose_account_type.dart';
import 'package:likhit/screens/auth/save_auth_data.dart';
import 'package:likhit/screens/bottombar/profile.dart';
import 'package:likhit/screens/profile/banking.dart';
import 'package:likhit/screens/profile/lawyer_edit_profile.dart';
import 'package:likhit/screens/profile/profiledata.dart';
import 'package:likhit/screens/signup/signUp.dart';
import 'package:likhit/screens/splash/splash_screen.dart';
import 'package:likhit/screens/splash_screen_likhit.dart';
import 'package:likhit/utils/const_toast.dart';

void main() {
  Get.put(ConstToast(), permanent: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // minTextAdapt: true,
      // designSize: Size(300, 800),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:SplashScreenLikhit()
      ),
    );
  }

  checkLogin() async{
    if(await UserDataService.getAuthToken() != null){
      Get.to(ChoosePage());

    }else{
      Get.to(SignInPage());

    }

  }
}