import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:likhit/routes/routes.dart';
import 'package:likhit/screens/auth/choose_account_type.dart';
import 'package:likhit/screens/auth/save_auth_data.dart';
import 'package:likhit/screens/book_appointment_client/views/book_appointments_page.dart';
import 'package:likhit/screens/bottombar/profile.dart';
import 'package:likhit/screens/profile/banking.dart';
import 'package:likhit/screens/profile/lawyer_edit_profile.dart';
import 'package:likhit/screens/profile/profiledata.dart';
import 'package:likhit/screens/signup/signUp.dart';
import 'package:likhit/screens/splash/splash_screen.dart';
import 'package:likhit/screens/splash_screen_likhit.dart';
import 'package:likhit/style/color.dart';
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
          // iconTheme: IconThemeData(
          //   color: isDesktop()
          //       ? AppColors.white
          //       : AppColors
          //       .white100, // Change this color to whatever you want
          // ),
        ),
      ),
      initialRoute: ApplicationPages.bookAppointmentsPage,
      // home: SimpleDataTable(),
      // home: MobileEstimateViewPdfScreen(),
      getPages: ApplicationPages.getApplicationPages(),
    )
    );
  }


}