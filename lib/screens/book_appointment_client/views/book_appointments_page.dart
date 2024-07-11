import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:likhit/common/widget/const_container.dart';
import 'package:likhit/common/widget/const_text_with_styles.dart';
import 'package:likhit/screens/book_appointment_client/controllers/booking_appointment_controller.dart';
import 'package:likhit/style/color.dart';
import '../../../const/const_height.dart';
import '../../../const/const_width.dart';
import '../../../const/image_strings.dart';
import '../../../style/gradients.dart';
import '../../../style/text_style.dart';

class BookAppointmentsPage extends GetView<BookingAppointmentController> {
  const BookAppointmentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          CircleAvatar(
            radius: w70
            ,
            child: Image.asset(clientLogo),
          ),
    const15BoldText("Adv Satya-m"),
          const8Text("With highest number of LinkedIn recommendations for Legal Consultations done in India & Asia-Pacific region.",textColor: AppColors.white60),
      Row(
        children: [
          constTabButton("All", 0),
          constTabButton("1:1 Call", 1),
          constTabButton("Priority", 2),
        ],
      ),

          IndexedStack(
            index: controller.currentIndex.value,
            children: [
              Expanded(
                child: ListView.builder(
                  // shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (context,index){return
                ListTile(
                  title: const12TextBold("Satyam",textColor: AppColors.primary),
                  subtitle: const8Text("best lawyer in the world",textColor: AppColors.white70),
                  trailing: const10TextBold("Rs109",textColor: AppColors.success40) ,

                );

                }),
              )
            ],
          )

        ],
      ).paddingAll(w8),
    );
  }
  Widget constTabButton(String text, int index) {
    return Obx(() => InkWell(
      onTap: () {
        controller.currentIndex.value = index;
      },
      child: ConstantContainer(
        radiusBorder: w5,
        borderColor: AppColors.primary,
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
                      : null)),
        ),
      ),
    ));
  }
}
