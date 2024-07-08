import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:likhit/common/widget/const_dropdown.dart';
import 'package:likhit/screens/profile/widget/profile_card.dart';

import '../../common/widget/const_text_field.dart';
import '../../const/const_height.dart';
import '../../style/color.dart';
import 'controller/lawyer_profile_controller.dart';

// const color = Color('#F0F2F5');

class LawyerEditProfile extends StatelessWidget {
   LawyerEditProfile({super.key});

  LawyerProfileController controller = Get.put(LawyerProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: constText15SemiBold(text: "Upload Profile"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: h25,right: h25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              constText12SemiBold(text: "Name"),
              ConstTextField(
                controller: controller.nameController.value,
                hintText: "Aara Technologies",
              ),
              constText12SemiBold(text: "Phone"),
              ConstTextField(
                controller: controller.phoneController.value,
                hintText: "120101201",
              ),

              constText12SemiBold(text: "Address"),
              ConstTextField(
                controller: controller.addressController.value,
                maxLine: 2,
                hintText: "Indra nager aara technolgy",
              ),
              constText12SemiBold(text: "Gender"),
              ConstantDropdown(options: ["Male", 'Female', 'Other'], onChanged: (value) {  },),

              constText12SemiBold(text: "Select Speciality"),
              ConstantDropdown(options: ["Child Support",
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
              ], onChanged: (value) {  },),

              constText12SemiBold(text: "dob"),
              ConstantDropdown(options: ["Male", 'Female', 'Other'], onChanged: (value) {  },),

              constText12SemiBold(text: "Written Language"),
              ConstantDropdown(options: ["English", 'Bhojpuri', 'Marathi', 'Gujrati'], onChanged: (value) {  },),

              constText12SemiBold(text: "Spoken Language"),
              ConstantDropdown(options: ["English", 'Bhojpuri', 'Marathi', 'Gujrati'], onChanged: (value) {  },),

              constText12SemiBold(text: "Website URL"),
              ConstTextField(
                controller: controller.websiteURLController.value,
                hintText: "www.LikhitDe.com",
              ),

              constText12SemiBold(text: "About"),
              ConstTextField(
                controller: controller.aboutController.value,
                maxLine: 3,
                hintText: "These steps sould help you resolve the issue. if te problem persisits.providing",
              ),

              constText12SemiBold(text: "Experiences"),
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
                    MyCustomButton(onTap: (){},color: Colors.grey,text: "Cancel",),
                    const Text("  "),
                    MyCustomButton(onTap: (){},color: AppColors.info80,text: "Save",)
                  ],
                ),
              ),
              SizedBox(height: h25,),
            ],
          ),
        ),
      ),
    );
  }
}
