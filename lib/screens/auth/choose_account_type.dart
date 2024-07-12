import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:likhit/common/widget/const_text_with_styles.dart';
import 'package:likhit/screens/auth/controller/account_manage_controller.dart';
import 'package:likhit/screens/auth/user_add_profile.dart';
import 'package:likhit/screens/auth/widget/choose_card.dart';
import 'package:likhit/style/color.dart';

import '../../const/const_height.dart';
import '../../const/const_width.dart';
import '../../const/image_strings.dart';
import '../../custom/botton.dart';
import 'lawyer_add_profile.dart';

class ChoosePage extends StatefulWidget {
  const ChoosePage({super.key});

  @override
  State<ChoosePage> createState() => _ChoosePageState();
}

class _ChoosePageState extends State<ChoosePage> {
  AccountManageController controller = Get.put(AccountManageController());

  int choose = 0;
  bool choose1 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: Image.asset(logo,height: 0.3.sh,),
            ).paddingSymmetric(vertical: w80,),
            Column(
              children: [
                const12TextBold(
                  "Choose Account Type",

                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ChooseCard(
                      image: lawyerLogo,
                      language: "Lawyer",
                      color: choose == 0 ? AppColors.info80 : Colors.white,
                      onTap: () {
                        setState(() {
                          choose = 0;
                        });
                      },
                    ),
                    ChooseCard(
                      image: clientLogo,
                      language: "Client",
                      color: choose == 1 ? AppColors.info80 : Colors.white,
                      onTap: () {
                        setState(() {
                          choose = 1;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
            CustomButton(
              width: double.maxFinite,
              color: AppColors.white,
              text: "Continue",
              onPressed: () async {
                // await UserDataService.removeUser();
                choose == 0
                    ? Get.to(LawyerAddProfile())
                    : Get.to(UserAddProfile());
              },
            )
          ],
        ).paddingSymmetric(horizontal: w5),
      ),
    );
  }
}
