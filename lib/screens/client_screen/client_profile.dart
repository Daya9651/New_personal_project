import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:likhit/common/widget/const_text_with_styles.dart';
import 'package:likhit/screens/client_screen/services/controller/client_api_controller.dart';
import 'package:likhit/style/color.dart';

import '../../common/widget/custom_app_bar.dart';
import '../../const/const_height.dart';
import '../../const/const_width.dart';
import '../../routes/routes.dart';

class ClientProfile extends GetView<ClientApiController> {
  const ClientProfile({super.key});

  @override
  Widget build(BuildContext context) {

    // var controller.clientProfile.value.data = controller.clientProfile.value.data;
    return Scaffold(
        appBar: CustomAppBar(
          title: "Profile",
          actions: [
            IconButton(
                onPressed: () {
                  Get.toNamed(ApplicationPages.clientEditProfile);
                },
                icon: const Icon(
                  Icons.edit,
                  color: AppColors.white,
                ))
          ],
        ),
        body: Obx(() => Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: w50,
                    backgroundColor: Colors.transparent,
                    // Ensure CircleAvatar is transparent
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: ClipOval(
                        child: Image.network(
                          "${controller.clientProfile.value.data?.image.toString()}",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: h20,
                  ),
                  const10TextBold(
                      "Name :  ${controller.clientProfile.value.data?.name.toString().toUpperCase()}"),
                  const10TextBold(
                      "Phone : ${controller.clientProfile.value.data?.mobile}"),
                  const10TextBold(
                      "DOB : ${controller.clientProfile.value.data?.dob}"),
                  const10TextBold(
                      "Gender : ${controller.clientProfile.value.data?.gender}"),
                  const10TextBold(
                      "Address : ${controller.clientProfile.value.data?.address}"),
                ],
              ),
            )).marginAll(h15));
  }
}
