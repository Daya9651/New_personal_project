import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:likhit/routes/routes.dart';
import 'package:likhit/screens/auth/save_auth_data.dart';
import 'package:likhit/style/color.dart';
import 'package:likhit/utils/const_toast.dart';

void main() async{
  // checkUserType();
  Get.put(ConstToast(), permanent: true);
  debugPrint("type :${await UserDataService.getUserType()}");
  debugPrint("token :${await UserDataService.getAuthToken()}");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: const Size(300, 800),
      child:GetMaterialApp(
      enableLog: true,
      defaultTransition: Transition.fade,
      opaqueRoute: Get.isPlatformDarkMode,
      popGesture: Get.isLogEnable,
      transitionDuration: Get.defaultDialogTransitionDuration,
      defaultGlobalState: Get.isLogEnable,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        useMaterial3: true,
        appBarTheme: AppBarTheme(

        ),
      ),
      initialRoute: ApplicationPages.splashScreen,
      // home: SimpleDataTable(),
      // home: MobileEstimateViewPdfScreen(),
      getPages: ApplicationPages.getApplicationPages(),
    )
    );
  }


}

Future<String> checkUserType() async {

  String type ="";
  type = await UserDataService.getUserType()??"";
  var token = await UserDataService.getAuthToken()??"";
  debugPrint("during main type: $type token $token");
  return type;

}