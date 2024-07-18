import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:likhit/common/widget/const_shimmer_effects.dart';
import 'package:likhit/common/widget/const_text_with_styles.dart';
import 'package:likhit/common/widget/custom_app_bar.dart';
import 'package:likhit/screens/lawyer_screen/screens/views/profile/controllers/lawyer_contact_info_controller.dart';
import 'package:likhit/style/color.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../common/widget/const_container.dart';
import '../../../../../../common/widget/const_radio_button.dart';
import '../../../../../../common/widget/const_text_field.dart';
import '../../../../../../common/widget/const_text_for_text_fields.dart';
import '../../../../../../common/widget/primary_button.dart';
import '../../../../../../const/const_height.dart';
import '../../../../../../const/const_width.dart';

class ContactInformationPage extends GetView<LawyerContactInfoController> {
  const ContactInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  CustomAppBar(
        title: "Contact Information",
        actions: [
          constTextContainer("Add Contact",onTap: (){
            Get.to(const AddContactInfo());
          })
        ],
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(h100),
            child: ConstTextField(
              controller: controller.searchTransactionController.value,
              onChanged: (value) {
                controller.getAllContacts(search: value);
              },
              hintText: "Search Contacts",
              enableBorderColor: AppColors.white,
              suffixIcon: IconButton(onPressed: (){
                controller.searchTransactionController.value.clear();
                controller.getAllContacts();

              }, icon: const Icon(CupertinoIcons.multiply_circle,color: AppColors.white,)),
            )
        ),

      ),
      body:Obx(()=>controller.isLoading.value?Shimmer.fromColors(
        baseColor: baseColor,
        highlightColor: highLightColor,
        child: loadSke(),
      ):ListView.builder(
        itemCount: controller.contactList.value.data?.length,
          itemBuilder: (context,index)

          {
         var contactList =   controller.contactList.value.data?[index];
          return
            ConstantContainer(
              radiusBorder: w5,
              borderColor: AppColors.white50,
              padding: w3,
        child: ListTile(
          title: const8TextBold("${contactList?.number}"),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const6Text("${contactList?.title}",textColor: AppColors.white70),
            ],
          ),
          trailing: IconButton(onPressed: (){
            controller.deleteContact(contactList?.id??0);

          },
          icon: Icon(Icons.delete,color: Colors.redAccent,),
          )
        ),
      );
      })),
    );
  }
}
class AddContactInfo extends GetView<LawyerContactInfoController> {
  const AddContactInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:  const CustomAppBar(
          title: "Contact Details",

        ),
        body:Obx(()=> controller.isLoading.value? Shimmer.fromColors(
          baseColor: baseColor,
          highlightColor: highLightColor,
          child: loadSke(),
        ): ListView(
          children: [
            ConstWidgets.constTextForTextFields("Mobile",

                width: double.maxFinite,
                ConstTextField(

                  controller: controller.mobileController.value,

                )),
            Obx(() => CustomRadioButton(
              options: [
                RadioOption(value: 1, title: "Land-line"),
                RadioOption(value: 2, title: "Mobile-Number"),
                RadioOption(value: 3, title: "Toll-Free-Number"),
              ],
              onChanged: (value, title){
                controller.setMobileType(value, title);
              },

              groupValue: controller.mobileType.value,
              axis: CustomAxisDirection .vertical,


            )),
            constTextContainer(
                "Add Contact",onTap: (){
              controller.addContact();
            }
            )
          ],
        ))
    );
  }
}