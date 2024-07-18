import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:likhit/screens/client_screen/services/controller/client_api_controller.dart';

import '../../common/widget/custom_app_bar.dart';
import '../../const/const_height.dart';
import '../../const/const_width.dart';
import '../profile/widget/profile_card.dart';

class ClientProfile extends GetView<ClientApiController> {
  const ClientProfile({super.key});

  @override
  Widget build(BuildContext context) {
    // var controller.clientProfile.value.data = controller.clientProfile.value.data;
    return Scaffold(
        appBar: const CustomAppBar(
          title: "Profile",
        ),
        body: Obx(() => Column(
              children: [
                CircleAvatar(
                  radius: w50,
                  backgroundColor: Colors.transparent,
                  // Ensure CircleAvatar is transparent
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: ClipOval(
                      child: Image.network(
                          "${controller.clientProfile.value.data?.image.toString()}"),
                    ),
                  ),
                ),
                constText12SemiBold(
                    text:
                        "Name :  ${controller.clientProfile.value.data?.name}"),
                constText12SemiBold(
                    text:
                        "Phone : ${controller.clientProfile.value.data?.mobile}"),
                constText12SemiBold(
                    text:
                        "Email : ${controller.clientProfile.value.data?.email}"),
                constText12SemiBold(
                    text: "DOB : ${controller.clientProfile.value.data?.dob}"),
                constText12SemiBold(
                    text:
                        "Gender : ${controller.clientProfile.value.data?.gender}"),
                constText12SemiBold(
                    text:
                        "Address : ${controller.clientProfile.value.data?.address}"),
              ],
            )).marginAll(h15));
  }
}
