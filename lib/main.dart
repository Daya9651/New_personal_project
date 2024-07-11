import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:likhit/screens/auth/save_auth_data.dart';
import 'package:likhit/screens/splash_screen_likhit.dart';
import 'package:likhit/utils/const_toast.dart';

void main() {
  Get.put(ConstToast(), permanent: true);
  checkLogin();

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
          home: SplashScreenLikhit()),
    );
  }
}

checkLogin() async {
  debugPrint("${await UserDataService.getUserType()}");
  debugPrint("${await UserDataService.getAuthToken()}");
  // if(await UserDataService.getAuthToken() != null){
  //   Get.to(ChoosePage());
  //
  // }else{
  //   Get.to(SignInPage());
  //
  // }
}
