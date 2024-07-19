import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:likhit/screens/client_screen/services/controller/client_api_controller.dart';
import 'package:likhit/screens/client_screen/services/controller/client_edit_controller.dart';

import '../../common/widget/const_dropdown.dart';
import '../../common/widget/const_text_field.dart';
import '../../common/widget/custom_app_bar.dart';
import '../../common/widget/custom_date_picker.dart';
import '../../const/const_height.dart';
import '../../const/const_width.dart';
import '../../style/color.dart';
import '../profile/widget/profile_card.dart';

class ClientEditProfile extends GetView<ClientEditController> {
  ClientEditProfile({super.key});

  final ClientApiController clientController = Get.put(ClientApiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Edit Profile",
      ),
      body: Obx(() {
        if (clientController.clientProfile.value.data == null) {
          return Center(child: CircularProgressIndicator());
        } else {
          return SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(left: h25, right: h25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 0.3.sw,
                    child: Stack(
                      children: [
                        Obx(() {
                          return CircleAvatar(
                            backgroundColor: AppColors.white60,
                            radius: w55,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: w50,
                              backgroundImage: controller.profilePic != null
                                  ? FileImage(controller.profilePic!)
                                  : NetworkImage(clientController.clientProfile.value.data?.image ?? ""),
                            ),
                          );
                        }),
                        Positioned(
                          bottom: h10,
                          right: -w1,
                          child: IconButton.outlined(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return SafeArea(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        ListTile(
                                          leading: const Icon(Icons.photo_library),
                                          title: const Text('Choose from gallery'),
                                          onTap: () async {
                                            Navigator.pop(context);
                                            controller.getPic(ImageSource.gallery);
                                            await controller.postProfilePic();
                                          },
                                        ),
                                        ListTile(
                                          leading: const Icon(Icons.camera_alt),
                                          title: const Text('Take a photo'),
                                          onTap: () async {
                                            Navigator.pop(context);
                                            controller.getPic(ImageSource.camera);
                                            await controller.postProfilePic();
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            icon: const Icon(Icons.edit_outlined, color: AppColors.info80),
                          ),
                        ),
                      ],
                    ),
                  ),
                  constText12SemiBold(text: "Name"),
                  ConstTextField(
                    controller: controller.nameController.value,
                    hintText: "Enter Name",
                  ),
                  constText12SemiBold(text: "Phone"),
                  ConstTextField(
                    inputType: TextInputType.number,
                    maxLength: 10,
                    controller: controller.mobileController.value,
                    hintText: "Enter Phone",
                  ),
                  constText12SemiBold(text: "dob"),
                  ConstTextField(
                    readyOnly: true,
                    controller: controller.dobController.value,
                    suffixIcon: IconButton(
                        onPressed: () {
                          selectDate(context).then((DateTime? selectedDate) {
                            if (selectedDate != null) {
                              String formatted = formattedDate(selectedDate);
                              controller.dobController.value.text = formatted;
                            }
                          });
                        },
                        icon: const Icon(
                          Icons.calendar_month,
                          color: AppColors.info80,
                        )),
                  ),
                  constText12SemiBold(text: "Address"),
                  ConstTextField(
                    inputType: TextInputType.streetAddress,
                    controller: controller.addressController.value,
                    maxLine: 2,
                    hintText: "Enter Address",
                  ),
                  SizedBox(
                    width: double.maxFinite,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        MyCustomButton(
                          onTap: () {
                            Get.back();
                          },
                          color: Colors.grey,
                          text: "Cancel",
                        ),
                        const Text("  "),
                        MyCustomButton(
                          onTap: () {
                            controller.patchClientEditProfile();
                            clientController.getClientProfile();
                            Get.back();
                          },
                          color: AppColors.info80,
                          text: "Submit",
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: h25,
                  ),
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}
