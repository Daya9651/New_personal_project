import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:likhit/screens/client_screen/services/controller/client_api_controller.dart';
import 'package:likhit/screens/client_screen/widget/clients_widgets.dart';
import 'package:likhit/style/color.dart';

import '../../common/widget/const_text_field.dart';
import '../../common/widget/custom_app_bar.dart';
import '../../const/const_height.dart';
import 'client_booking_appointment.dart';

class ClientLawyerList extends StatelessWidget {
  ClientLawyerList({super.key});

  ClientApiController controller = Get.put(ClientApiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: CustomAppBar(
          title: "Lawyer List",
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(h50),
              child: ConstTextField(
                // controller: controller.searchTransactionController.value,
                // onChanged: (value) {
                //   controller.clientAppointmentDetailFetch(search: value);
                // },
                hintText: "search for legal expert",
                enableBorderColor: AppColors.white,
                suffixIcon: IconButton(
                    onPressed: () {
                      // controller.searchTransactionController.value.clear();
                      // controller.getLawyerAppointment();
                    },
                    icon: const Icon(
                      CupertinoIcons.multiply_circle,
                      color: AppColors.white,
                    )),
              )),
        ),
        body: Obx(() {
          if (controller.lawyerListData.value.data == null) {
            return Center(child: CircularProgressIndicator());
          }

          if (controller.lawyerListData.value.data!.isEmpty) {
            return Center(child: Text("No transactions found."));
          }

          return ListView.builder(
              itemCount: controller.lawyerListData.value.count,
              // itemCount: 5,
              itemBuilder: (context, index) {
                var listData = controller.lawyerListData.value.data?[index];
                // var specialtiesList = [];
                // for(var i =0;i<listData.specialties!.length;i++){
                //
                //   specialtiesList.addAll(listData.specialties);
                // }
                //
                if (controller.lawyerListData.value.data!.isEmpty) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: AppColors.info80,
                    ),
                  );
                } else {
                  return lawyerProfileDetailCard(
                      onTap: () {
                        controller.lawyerBookDetailFetch(id: listData?.id);
                        Get.to(ClientBookingAppointment());
                      },
                      image: listData?.image.toString() ?? '',
                      title: listData?.name.toString() ?? '',
                      workspaceText: listData?.specialties.toString() ?? '',
                      languageText: listData?.languageSpoken.toString() ?? '',
                      expText: listData?.experience.toString() ?? '',
                      locationText: listData?.address.toString() ?? '');
                }
              });
        }));
  }
}
