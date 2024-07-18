import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:likhit/common/widget/const_container.dart';
import 'package:likhit/common/widget/const_text_with_styles.dart';
import 'package:likhit/common/widget/primary_button.dart';
import 'package:likhit/routes/routes.dart';
import 'package:likhit/screens/lawyer_screen/screens/controllers/lawyer_profile_controller.dart';
import 'package:likhit/screens/lawyer_screen/screens/views/profile/views/lawyer_education_page.dart';
import 'package:likhit/screens/lawyer_screen/screens/views/profile/views/lawyer_experience_page.dart';
import 'package:likhit/screens/lawyer_screen/screens/views/profile/views/service_offered_page.dart';
import 'package:likhit/utils/utils.dart';

import '../../../../common/widget/const_rating_page.dart';
import '../../../../const/const_height.dart';
import '../../../../const/const_width.dart';
import '../../../../style/color.dart';
import '../../../profile/lawyer_edit_profile.dart';
import '../../../profile/lawyer_kyc_page.dart';

class LawyerProfile extends GetView<LawyerProfileController> {
  const LawyerProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
backgroundColor: AppColors.white10,
      body: SingleChildScrollView(
        child:Obx(()=> Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 0.3.sw,
                  child: Stack(
                    children: [
                      CircleAvatar(
                        backgroundColor: AppColors.white60,
                        radius: w55,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: w50,
                          backgroundImage: controller.profilePic != null
                              ? FileImage(controller.profilePic!)
                              : NetworkImage(controller.profileData.value.data?.image ?? ""),
                        ),
                      ),
                      Positioned(
                        bottom: h10,
                        right: -w1,
                        child: IconButton.outlined(
                          onPressed: () {
                            // Show options to select image from gallery or camera
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
                Column(
        
                  children: [
                const8Text("${controller.profileData.value.data?.lawyerid}"),
                const10TextBold("${controller.profileData.value.data?.name.toString().toUpperCase()}",textColor: AppColors.info80),
                const8Text("${controller.profileData.value.data?.address}"),
                const8Text("NFC ID: ${controller.profileData.value.data?.nfcid}"),
                // const8Text("Written Lang: ${controller.profileData.value.data?.languageWritten}"),
                // const8Text("Spoken Lang: ${controller.profileData.value.data?.languageSpoken}"),
                    InkWell(
                      onTap: () async {
                        controller.getReviews(int.parse(controller.profileData.value.data!.id.toString()));
                        await Get.toNamed(ApplicationPages.reviewPage,arguments: {"lawyerId":controller.profileData.value.data?.id});
                      },
                      child: RatingBarWidget(
                        initialRating: double.tryParse('${controller.profileData.value.data?.rating}')??0 ,
        
                      ),
                    ),
                  ],
                )
              ],
            ),
            const10TextBold("About Adv ${controller.profileData.value.data?.name.toString().toUpperCase()}"),
            const6Text("${controller.profileData.value.data?.about}"),

            Wrap(
              children: [
                constTextContainer("Bank Details",onTap: (){
                  Get.toNamed(ApplicationPages.lawyerBankPage);
                },width: 0.2.sh),
                constTextContainer("Contact Info",onTap: (){
                  Get.toNamed(ApplicationPages.lawyerContactInfoPage);

                },width: 0.2.sh),
                constTextContainer("Lawyer Kyc",onTap:controller.profileData.value.kyc==true? null:(){
                  Get.to(const LawyerKycPage());
                },width: 0.2.sh,color: controller.profileData.value.kyc ==true?AppColors.white60:AppColors.info80),
                constTextContainer("Edit Profile",onTap: (){
                  Get.to(LawyerEditProfile());
                },width: 0.2.sh),
              ],
            ),
          constDivider(),
            GestureDetector(
              onTap: (){
                Get.to(const ServiceOfferedPage());
                // Get.to(LawyerEducationPage());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const8TextBold("Services Offered"),
                  const6Text("View More"),

                ],
              )
            ),
            ConstantContainer(
              radiusBorder: w5,
              margin: 0,
              borderColor: AppColors.white60,
              // height: 0.2.sh,
              color: AppColors.white,
              child:Obx(()=> ListView.builder(
                shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: min(3, controller.lawyerServiceList.value.data!.length),
                  itemBuilder: (context,index){
                    var serviceList = controller.lawyerServiceList.value.data?[index];
                return ListTile(
                  dense: true,
                  visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
                  title: const6TextBold('${serviceList?.title}'),
                  subtitle: const6Text('${serviceList?.subtitle}',textColor: AppColors.white60),
        
                );
              })),
              
            ),
            SizedBox(height: h10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const8TextBold("Specialities"),
                // const6Text("View More"),
        
              ],
            ),
            ConstantContainer(
              radiusBorder: w5,
              margin: 0,
              borderColor: AppColors.white60,
              // height: 0.2.sh,
              color: AppColors.white,
              child:Obx(()=> ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: min(3, controller.profileData.value.data!.specialties!.length),
                  itemBuilder: (context,index){
                    var specialtiesList = controller.profileData.value.data!.specialties?[index];
                    return ListTile(
                      dense: true,
                      visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
                      title: const6TextBold('$specialtiesList'),
        
                    );
                  })),
        
            ),
            SizedBox(height: h10,),
            GestureDetector(
              onTap: (){
                Get.to(const LawyerEducationPage());

              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const8TextBold("Education & Credentials"),
                  const6Text("View More"),

                ],
              ),
            ),
            ConstantContainer(
              radiusBorder: w5,
              margin: 0,
              borderColor: AppColors.white60,
              // height: 0.2.sh,
              color: AppColors.white,
              child:Obx(()=> ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: min(3, controller.lawyerEducationList.value.data?.length??0),
                  itemBuilder: (context,index){
                    var specialtiesList = controller.lawyerEducationList.value.data?[index];
                    return ListTile(
                      dense: true,
                      visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
                      title: const6TextBold('${specialtiesList?.name}'),
                      subtitle: const6Text('${specialtiesList?.title}'),

                    );
                  })),

            ),   SizedBox(height: h10,),
            GestureDetector(
              onTap: (){

                Get.to(const LawyerExperiencePage());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const8TextBold("Experience"),
                  const6Text("View More"),

                ],
              ),
            ),
            ConstantContainer(
              radiusBorder: w5,
              margin: 0,
              borderColor: AppColors.white60,
              // height: 0.2.sh,
              color: AppColors.white,
              child:Obx(()=> ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: min(3, controller.lawyerExperienceList.value.data?.length??0),
                  itemBuilder: (context,index){
                    var specialtiesList = controller.lawyerExperienceList.value.data?[index];
                    return ListTile(
                      dense: true,
                      visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
                      title: const6TextBold('${specialtiesList?.title}'),
                      subtitle: const6Text('${specialtiesList?.subtitle}'),

                    );
                  })),

            ),
          ],
        )).paddingAll(w3),
      ),
    );
  }
}
