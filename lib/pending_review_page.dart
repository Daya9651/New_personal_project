import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:likhit/const/image_strings.dart';
import 'package:likhit/custom/botton.dart';
import 'package:likhit/routes/routes.dart';
import 'package:likhit/screens/auth/save_auth_data.dart';
import 'package:likhit/style/text_style.dart';
import 'package:lottie/lottie.dart';

import 'const/const_height.dart';

class PendingReviewPage extends StatelessWidget {
  const PendingReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(underReview),
            Text(
              textAlign: TextAlign.center,
              "Your lawyer profile is under review and will be evaluated as promptly as possible",
              style: AppTextStyles.kCaption12SemiBoldTextStyle,
            ),
            CustomButton2(
                imageHeight: h20,
                imageWidth: h20,
                image: logo,
                text: "Login",
                onPressed: () async {
                  await UserDataService.removeUser();
                  Get.offAllNamed(ApplicationPages.signUpPage);
                })
          ],
        ),
      ),
    );
  }
}
