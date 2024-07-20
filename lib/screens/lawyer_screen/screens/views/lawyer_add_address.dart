import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:likhit/common/widget/const_shimmer_effects.dart';
import 'package:likhit/common/widget/custom_app_bar.dart';
import 'package:likhit/screens/lawyer_screen/screens/controllers/add_address_controller.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../common/widget/const_dropdown.dart';
import '../../../../common/widget/const_radio_button.dart';
import '../../../../common/widget/const_text_field.dart';
import '../../../../const/const_height.dart';
import '../../../../const/const_width.dart';
import '../../../../style/color.dart';
import '../../../profile/widget/profile_card.dart';

class LawyerAddAddress extends GetView<AddAddressController> {
  const LawyerAddAddress({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args = Get.arguments ?? {};
    final dynamic transaction = args['addressId'];
    final bool isUpdate = transaction != null;

    if (isUpdate) {
      // Populate the controllers with the passed data
      controller.nameController.value.text = transaction.name ?? '';
      controller.phoneController.value.text = transaction.mobileNumber ?? '';
      controller.state.value = transaction.state ?? '';
      controller.city.value = transaction.city ?? '';
      controller.pinController.value.text = transaction.pincode ?? '';
      controller.addressType.value = controller.getAddressType(transaction.addressType);
      controller.addressController.value.text = transaction.address ?? '';
      controller.state.value = transaction.state;
      controller.city.value = transaction.city;

      // Fetch state and city data based on the selected state
      // controller.cityGet(transaction.stateId);
    }

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        title: !isUpdate ? "Add Office Address" : "Update Office Address",
      ),
      body:Obx(()=>controller.isLoading.value?Shimmer.fromColors(
        baseColor: baseColor,
        highlightColor: highLightColor,
        child: loadSke(),
      ) :SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            constText12SemiBold(text: "Name", imp: true),
            ConstTextField(
              controller: controller.nameController.value,
              hintText: "Enter Name",
            ),
            constText12SemiBold(text: "Phone", imp: true),
            ConstTextField(
              controller: controller.phoneController.value,
              hintText: "Enter Your Phone",
              inputType: TextInputType.number,
              maxLength: 10,
            ),
            constText12SemiBold(text: "Country"),
            ConstantDropdown(
           hint: "India",
              options: const ["India"],
              onChanged: (value) {},
            ),
            constText12SemiBold(text: "State"),
            Obx(() => ConstantDropdown(
              options: controller.stateData
                  .map((item) => item.name)
                  .toList()
                  .toSet()
                  .toList(),
              value: controller.state.value,
              onChanged: (newValue) {
                var selectedItem = controller.stateData.firstWhere(
                      (item) => item.name == newValue,
                );
                int? stateID = selectedItem.id;
                controller.state.value = newValue;
                controller.cityGet(stateID);
              },
            )),
            constText12SemiBold(text: "City"),
            Obx(() => ConstantDropdown(
              options: controller.cityData
                  .map((item) => item.name)
                  .toList()
                  .toSet()
                  .toList(),
              value: controller.city.value,
              onChanged: (newValue) {
                controller.city.value = newValue;
              },
            )),
            constText12SemiBold(text: "Pincode", imp: true),
            ConstTextField(
              controller: controller.pinController.value,
              maxLength: 6,
              inputType: TextInputType.number,
              hintText: "Enter Pincode",
            ),
            Obx(() => CustomRadioButton(
              options: [
                RadioOption(value: 1, title: "Home"),
                RadioOption(value: 2, title: "Office"),
                RadioOption(value: 3, title: "Other"),
              ],
              onChanged: (value, title) {
                controller.setAddressType(value, title);
              },
              groupValue: controller.addressType.value,
              axis: CustomAxisDirection.vertical,
            )),
            constText12SemiBold(text: "Address"),
            ConstTextField(
              controller: controller.addressController.value,
              maxLine: 4,
              hintText: "Enter Full Address",
            ),
            SizedBox(
              width: double.maxFinite,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MyCustomButton(
                    onTap: () {
                      controller.clrControllers();
                      Get.back();
                    },
                    color: Colors.grey,
                    text: "Cancel",
                  ),
                  const Text("  "),
                  MyCustomButton(
                    onTap: () {
                      if (!isUpdate) {
                        controller.addAddress().then((_) {
                          // Future.delayed(const Duration(milliseconds: 2), () {
                          //   Get.back();
                          // });
                          controller.getAddressList();
                        });
                      } else {
                        controller.updateAddress(transaction.id).then((_) {
                          // Future.delayed(const Duration(milliseconds: 2), () {
                          //   Get.back();
                          // });
                          controller.getAddressList();
                        });
                      }
                    },
                    color: AppColors.info80,
                    text:!isUpdate? "Save":"Update",
                  ).paddingOnly(right: w10),
                ],
              ),
            ),
            SizedBox(height: h25),
          ],
        ),
      )),
    );
  }
}

