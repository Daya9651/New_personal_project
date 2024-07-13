import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:likhit/screens/client_screen/services/controller/client_api_controller.dart';
import 'package:likhit/screens/client_screen/widget/clients_widgets.dart';
import 'package:likhit/style/color.dart';

import '../profile/widget/profile_card.dart';
import 'client_booking_appointment.dart';

class ClientLawyerList extends StatelessWidget {
  ClientLawyerList({super.key});

  ClientApiController controller = Get.put(ClientApiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: constText15SemiBold(text: "Lawyer List"),
      ),
      body: Container(
          child: Obx(() => ListView.builder(
              itemCount: controller.lawyerListData.length,
              itemBuilder: (context, index) {
                var listData = controller.lawyerListData[index];
                // var specialtiesList = [];
                // for(var i =0;i<listData.specialties!.length;i++){
                //
                //   specialtiesList.addAll(listData.specialties);
                // }
                //
                return lawyerProfileDetailCard(
                    onTap: () {
                      controller.lawyerBookDetailFetch(
                          id: listData.id?.toInt());
                      Get.to(ClientBookingAppointment());
                    },
                    image: listData.image.toString(),
                    title: listData.name.toString(),
                    workspaceText: listData.specialties.toString(),
                    languageText: listData.languageSpoken.toString(),
                    expText: listData.experience.toString(),
                    locationText: listData.address.toString());
              }))),
    );
  }
}
