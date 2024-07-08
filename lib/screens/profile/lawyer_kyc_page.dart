import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:likhit/common/widget/const_container.dart';
import 'package:likhit/common/widget/const_text_field.dart';
import 'package:likhit/screens/profile/controller/lawyer_profile_controller.dart';
import 'package:likhit/screens/profile/widget/profile_card.dart';

import '../../const/const_height.dart';
import '../../custom/botton.dart';
import '../../style/color.dart';
import '../../style/text_style.dart';

class LawyerKycPage extends StatefulWidget {
  const LawyerKycPage({super.key});

  @override
  State<LawyerKycPage> createState() => _LawyerKycPageState();
}

class _LawyerKycPageState extends State<LawyerKycPage> with SingleTickerProviderStateMixin{
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }
  late TabController tabController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          // iconTheme: const IconThemeData(color: AppColors.white),
          backgroundColor: AppColors.white,
          title: Text("Lawyer Kyc",
              style: AppTextStyles.kSmall10SemiBoldTextStyle),

          bottom: TabBar(
              indicatorColor: AppColors.info80,
              labelColor: AppColors.info80,
              controller: tabController,
              tabs: const [
                Tab(text: "IDENTIFICATION",),
                Tab(text: "VERIFICATION",),
              ]),

        ),
        body: TabBarView(
          controller: tabController,
          children: [
            const Identification(),
            Verification()
          ],
        )
    );
  }
}

class Identification extends StatelessWidget {
  const Identification({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}

class Verification extends StatelessWidget {
   Verification({super.key});

  LawyerProfileController controller = Get.put(LawyerProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: h25,right: h25),
          child: Obx(() => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              constText15SemiBold(text: "Documentation Upload"),
        
              constText12SemiBold(text: "Adhar Card Number"),
              ConstTextField(
                controller: controller.aadharController.value,
                hintText: "Adhar Card Number",
              ),
              constText12SemiBold(text: "Adhar Card Image"),
              chooseFileContainer(onTap: ()async{
                await controller.getAdharCardImage();
                debugPrint(' imageFile1 ${controller.adharCardImage.toString()}');
              },
                imageText: controller.adharCardImage.toString()
              ),
        
              constText12SemiBold(text: "PAN Card"),
              ConstTextField(
                controller: controller.panCardController.value,
                hintText: "PAN Card Number",
              ),
              constText12SemiBold(text: "PAN Image"),
              chooseFileContainer(onTap: ()async{
                await controller.getPanCardImage();
                debugPrint(' imageFile2 ${controller.image.toString()}');
              },
                  imageText: controller.panCardImage.toString()
              ),
        
              constText12SemiBold(text: "Lawyer License"),
              ConstTextField(
                controller: controller.lawyerLicenseController.value,
                hintText: "License Number",
              ),
              constText12SemiBold(text: "License Image"),
              chooseFileContainer(onTap: ()async{
                await controller.getLicenseImage();
                debugPrint(' imageFile3 ${controller.image.toString()}');
              },
                  imageText: controller.licenseImage.toString()
              ),
              SizedBox(height: h25,),

           Obx(()=>controller.isLoading.value? const Center(child: CircularProgressIndicator()) : SizedBox(
                height: h50,
                width: double.maxFinite,
                  child: MyCustomButton(onTap: (){
                    // controller.uploadLawyerDoc();
                    controller.updateLawyerProfile();
                  },color: AppColors.info80,text: "Save",))),
              SizedBox(height: h25,),
            ],
          )),
        ),
      ),
    );
  }
}


