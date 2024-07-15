import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:likhit/common/widget/const_container.dart';
import 'package:likhit/common/widget/const_text_with_styles.dart';
import 'package:likhit/routes/routes.dart';
import 'package:likhit/screens/book_appointment_client/controllers/booking_appointment_controller.dart';
import 'package:likhit/style/color.dart';

import '../../../const/const_height.dart';
import '../../../const/const_width.dart';
import '../../../const/image_strings.dart';
import '../../../style/gradients.dart';
import '../../../style/text_style.dart';
import '../../client_screen/services/controller/client_api_controller.dart';
import '../../client_screen/services/controller/client_book_appointment_time_controller.dart';

class BookAppointmentsPage extends GetView<BookingAppointmentController> {
  BookAppointmentsPage({super.key});

  ClientApiController clientApiController = Get.put(ClientApiController());
  ClientBookAppointmentTimeController clientBookAppointmentTimeController =
      Get.put(ClientBookAppointmentTimeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          CircleAvatar(
            radius: w50,
            backgroundColor: Colors.transparent,
            // Ensure CircleAvatar is transparent
            child: AspectRatio(
              aspectRatio: 1,
              child: ClipOval(
                child: Image.network(
                  clientApiController
                              .lawyerBookDetailListData.value.data!.image ==
                          null
                      ? errorHandleImage
                      : clientApiController
                          .lawyerBookDetailListData.value.data!.image
                          .toString(),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const15BoldText(
              "Adv ${clientApiController.lawyerBookDetailListData.value.data?.name?.toString()}"),
          const8Text(
              clientApiController.lawyerBookDetailListData.value.data!.about
                  .toString(),
              textColor: AppColors.white60),
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
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: clientApiController
                        .lawyerBookDetailListData.value.data?.fees?.length,
                    itemBuilder: (context, index) {
                      var servicesOfferData = clientApiController
                          .lawyerBookDetailListData.value.data?.fees?[index];
                      return InkWell(
                        onTap: () {
                          clientBookAppointmentTimeController
                              .clientBookAppointmentPost(
                                  serviceID: servicesOfferData.id,
                                  lawyerID: servicesOfferData.lawyerId);
                          Get.toNamed(ApplicationPages.clientBookAppointment);
                        },
                        child: ListTile(
                          title: const12TextBold(
                              servicesOfferData!.title.toString(),
                              textColor: AppColors.primary),
                          subtitle: const8Text(
                              servicesOfferData.subtitle.toString(),
                              textColor: AppColors.white70),
                          trailing: const10TextBold(
                              servicesOfferData.fee.toString(),
                              textColor: AppColors.success40),
                        ),
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
