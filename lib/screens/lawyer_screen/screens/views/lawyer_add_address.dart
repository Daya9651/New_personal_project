import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:likhit/common/widget/custom_app_bar.dart';
import 'package:likhit/screens/lawyer_screen/screens/controllers/add_address_controller.dart';

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
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const CustomAppBar(
        title: "Add Office Address",
      ),
      body: SingleChildScrollView(
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
              options: const ["India"],
              onChanged: (value) {
                // controller.c.value = value;
              },
            ),
            constText12SemiBold(text: "State"),
            Obx(() => ConstantDropdown(
              options: controller.stateData
                  .map((item) =>
              item.name) // Accessing the 'name' property directly
                  .toList()
                  .toSet()
                  .toList(),
              onChanged: (newValue) {
                var selectedItem = controller.stateData.firstWhere(
                      (item) => item.name == newValue,
                );

                int? stateID = selectedItem
                    .id; // Assuming `id` is the property holding the ID
                controller.state.value = newValue;
                controller.cityGet(stateID);
                // else {
                //   controller.cityGet(null); // Handle case when selectedItem is null
                // }
              },
            )),
            constText12SemiBold(text: "City"),
            Obx(() => ConstantDropdown(
              options: controller.cityData
                  .map((item) => item.name)
                  .toList()
                  .toSet()
                  .toList(),
              onChanged: (newValue) {
                controller.city.value =
                    newValue; // Assuming `city` is an observable in your controller
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
                onChanged: (value, title){
                  controller.setAddressType(value, title);
                },

                groupValue: controller.addressType.value,
              axis: CustomAxisDirection .vertical,


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
                    },
                    color: Colors.grey,
                    text: "Cancel",
                  ),
                  const Text("  "),
                  MyCustomButton(
                    onTap: () {
                      controller.addAddress().then((_){
                        Future.delayed(const Duration(milliseconds: 2), () {
                          Get.back();
                        });
                        controller.getAddressList();
                      });
                    },
                    color: AppColors.info80,
                    text: "Save",
                  ).paddingOnly(right: w10)
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
}
