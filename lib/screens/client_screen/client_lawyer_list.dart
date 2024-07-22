import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:likhit/const/image_strings.dart';
import 'package:likhit/screens/client_screen/services/controller/client_api_controller.dart';
import 'package:likhit/screens/client_screen/widget/clients_widgets.dart';
import 'package:likhit/style/color.dart';
import 'package:shimmer/shimmer.dart';

import '../../common/widget/const_shimmer_effects.dart';
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
                controller: controller.searchLawyerListController.value,
                onChanged: (value) {
                  controller.getLawyerListFetch(search: value);
                },
                hintText: "search for legal expert",
                enableBorderColor: AppColors.white,
                suffixIcon: IconButton(
                    onPressed: () {
                      controller.searchLawyerListController.value.clear();
                      controller.getLawyerListFetch();
                    },
                    icon: const Icon(
                      CupertinoIcons.multiply_circle,
                      color: AppColors.white,
                    )),
              )),
        ),
        body: Obx(() {
          if (controller.lawyerListData.value.data == null) {
            return Shimmer.fromColors(baseColor: baseColor, highlightColor: highLightColor, child: loadSke());
          }

          if (controller.lawyerListData.value.data!.isEmpty) {
            return const Center(child: Text("No transactions found."));
          }

          return ListView.builder(
              itemCount: controller.lawyerListData.value.count,
              // itemCount: 5,
              itemBuilder: (context, index) {
                var listData = controller.lawyerListData.value.data?[index];
                if (controller.lawyerListData.value.data!.isEmpty) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.info80,
                    ),
                  );
                } else {
                  return lawyerProfileDetailCard(
                      onTap: () {
                        controller.lawyerBookDetailFetch(id: listData?.id);
                        Get.to(const ClientBookingAppointment());
                      },
                      image: listData?.image == null
                          ? errorHandleImage
                          : listData?.image.toString() ?? '',
                      title: listData?.name.toString() ?? '',
                      workspaceText: listData?.specialties?.join(', ') ?? '',
                      languageText: listData?.languageSpoken?.join(', ') ?? '',
                      expText: '${listData?.experience.toString()} Year' ?? '',
                      locationText: listData?.address.toString() ?? '');
                }
              });
        }));
  }
}
