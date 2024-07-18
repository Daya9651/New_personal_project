import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:likhit/common/widget/const_dropdown.dart';
import 'package:likhit/common/widget/const_shimmer_effects.dart';
import 'package:likhit/common/widget/const_text_with_styles.dart';
import 'package:likhit/common/widget/custom_app_bar.dart';
import 'package:likhit/screens/profile/widget/profile_card.dart';
import 'package:shimmer/shimmer.dart';

import '../../common/widget/const_text_field.dart';
import '../../common/widget/custom_date_picker.dart';
import '../../common/widget/multi_select_chip.dart';
import '../../const/const_height.dart';
import '../../const/const_width.dart';
import '../../style/color.dart';
import 'controller/lawyer_profile_controller_inside.dart';

// const color = Color('#F0F2F5');

class LawyerEditProfile extends StatefulWidget {
  LawyerEditProfile({super.key});

  @override
  State<LawyerEditProfile> createState() => _LawyerEditProfileState();
}

class _LawyerEditProfileState extends State<LawyerEditProfile> {
  LawyerProfileControllerInside controller = Get.put(LawyerProfileControllerInside());
@override
  void initState() {
    // TODO: implement initState
    super.initState();
controller.getUpdatedProfile();
controller.preFillData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title:  "Update Profile",
      ),
      body: SingleChildScrollView(
        child:Obx(()=>controller.isLoading.value?Shimmer.fromColors(
          baseColor: baseColor,
          highlightColor: highLightColor,
          child: loadSke(),
        ) :Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const8TextBold( "Name"),
            ConstTextField(

              controller: controller.nameController.value,

            ),
            const8TextBold( "Phone"),
            ConstTextField(
              maxLength: 10,
              controller: controller.phoneController.value,
              hintText: "120101201",
              inputType: TextInputType.number,
            ),

            const8TextBold( "Address"),
            ConstTextField(
              controller: controller.addressController.value,
              maxLine: 3,

            ),
            // const8TextBold( "Gender"),
            // ConstantDropdown(options: const ["Male", 'Female', 'Other'], onChanged: (value) {
            //   controller.gender.value = value;
            // },),

            const8TextBold( "Select Speciality"),
            Obx(()=>     MultiSelectChip(
              options: const ["Child Support",
                'Domestic Voilence',
                'DUI/DWI',
                'Trafic Ticket',
                'Wrongful Death',
                "Wils and Trusts",
                'Landlord-Tenant',
                'Family Law',
                'Criminal Law',
                'Divorce',
                'Property Law',
                'Contracts','Corprate Law'
              ],
              selectedOptions: controller.specialities.value,
              onSelectionChanged: (value) {
                controller.toggleSpecialities(value);
              },
            )),

            const8TextBold( "dob"),
            ConstTextField(
              inputType: TextInputType.number,
              hintText: "00/00/0000",
              controller: controller.dobController.value,
              suffixIcon: IconButton(
                  onPressed: () {
                    selectDate(context).then((DateTime? selectedDate) {
                      if (selectedDate != null) {
                        String formatted = formattedDate(selectedDate);
                        controller.dobController.value.text =
                            formatted;
                      }
                    });
                  },
                  icon: const Icon(
                    Icons.calendar_month,
                    color: AppColors.info80,
                  )),
            ),

            const8TextBold("Written Language"),
            Obx(()=>     MultiSelectChip(
              options: const ["English", 'Bhojpuri', 'Marathi', 'Gujarati'],
              selectedOptions: controller.writtenLanguages.value,
              onSelectionChanged: (value) {
                controller.toggleWrittenLanguage(value);
              },
            )),
            const8TextBold("Spoken Language"),
        Obx(()=>    MultiSelectChip(
              options: const ["English", 'Bhojpuri', 'Marathi', 'Gujarati'],
              selectedOptions: controller.spokenLanguages.value,
              onSelectionChanged: (value) {
                controller.toggleSpokenLanguage(value);
              },
            )),
            const8TextBold( "Website URL"),
            ConstTextField(
              controller: controller.websiteURLController.value,
              hintText: "www.LikhitDe.com",
            ),

            const8TextBold( "About"),
            ConstTextField(
              controller: controller.aboutController.value,
              maxLine: 3,
              hintText: "These steps sould help you resolve the issue. if te problem persisits.providing",
            ),

            const8TextBold( "Experiences"),
            ConstTextField(
              controller: controller.experienceController.value,
              maxLine: 2,
              hintText: "These steps sould help you resolve the issue. if te problem persisits.providing",
            ),

            SizedBox(
              width: double.maxFinite,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MyCustomButton(onTap: (){
                    Get.back();
                  },color: Colors.grey,text: "Cancel",),
                  const Text("  "),
                  MyCustomButton(onTap: (){
                 controller.updateLawyerProfile();
                 controller.profileController.onInit();
                  },color: AppColors.info80,text: "Save",)
                ],
              ),
            ),
            SizedBox(height: h25,),
          ],
        ).paddingAll(w4)),
      ),
    );
  }
}
