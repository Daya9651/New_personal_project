import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:likhit/common/widget/const_container.dart';
import 'package:likhit/common/widget/custom_app_bar.dart';
import 'package:likhit/screens/bottombar/controllers/lawyer_transaction_controllers.dart';
import 'package:likhit/screens/lawyer_screen/screens/views/client_transaction.dart';
import 'package:likhit/screens/lawyer_screen/screens/views/lawyer_my_transaction.dart';

import '../../common/widget/const_text_with_styles.dart';
import '../../const/const_height.dart';
import '../../const/const_width.dart';
import '../../style/color.dart';
import '../../style/gradients.dart';
import '../../style/text_style.dart';

class LawyerTransactionPage extends GetView<LawyerTransactionControllers> {
  const LawyerTransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(h0),
            child:  SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  constTabButton("Client", 0),
                  constTabButton("Own", 1),
                  constTabButton("Direct", 2),
                  constTabButton("Appointments", 3),
                  constTabButton("Payment Request", 4),
                ],
              ),
            ), )
        ),
body:    IndexedStack(
  index: controller.currentIndex.value,
  children: const [
    ClientTransaction(),
    LawyerMyTransaction(),
    Text("sds"),
  ],
),
    );
  }
  Widget constTabButton(String text, int index) {
    return Obx(() => InkWell(
      onTap: () {
        controller.currentIndex.value = index;
      },
      child: ConstantContainer(
        radiusBorder: w5,
        borderColor: AppColors.white,
        borderWidth: 0.5,
        gradient: controller.currentIndex.value == index
            ? primaryGradientColor
            : null,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: w25, vertical: h5),
          child: textWithoutStyle(
              text,
              AppTextStyles.kCaption12RegularTextStyle.copyWith(
                  color: controller.currentIndex.value == index
                      ? AppColors.white
                      : AppColors.white)),
        ),
      ),
    ));
  }
}
