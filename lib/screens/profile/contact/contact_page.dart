import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:likhit/common/widget/const_radio_button.dart';
import 'package:likhit/common/widget/const_text_field.dart';
import 'package:likhit/screens/profile/controller/contact_information_controller.dart';
import 'package:likhit/screens/profile/services/api/contact_information_services.dart';
import 'package:likhit/style/text_style.dart';

import '../../../common/widget/const_dropdown.dart';
import '../../../style/color.dart';
import '../widget/profile_card.dart';
class ContactPage extends StatefulWidget {
  const ContactPage({super.key});
  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
   late GoogleMapController mapController;

   ContactInformationController controller = Get.put(ContactInformationController());
   ContactInformationServices services = Get.put(ContactInformationServices());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Contact Information", style: AppTextStyles.kBody15SemiBoldTextStyle,),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // constText15SemiBold(text: "Contact Information"),
              //todo Add phone number
              ListTile(
                title: constText12SemiBold(text: "Add phone number"),
                trailing: IconButton(onPressed: (){
                  showDialog(context: context,
                      builder: (BuildContext context){
                        return AlertDialog(
                          backgroundColor: AppColors.white,
                          contentPadding: EdgeInsets.zero,
                          title: Center(child: Text('Add Phone',style: AppTextStyles.kBody15SemiBoldTextStyle,),),
                          actions: [
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Divider(),
                                  constText12SemiBold(text: "Phone Type"),
                                  Obx(() => CustomRadioButton(
                                      options: [
                                        RadioOption(value: 1, title: "Mobile-Number"),
                                        RadioOption(value: 2, title: "Land-line"),
                                        RadioOption(value: 3, title: "Toll-free-Number"),
                                      ],
                                      onChanged: (value, title){
                                        controller.setRadiobutton(value, title);
                                      },
                                      groupValue: controller.selectedValue.value)),

                                  constText12SemiBold(text: "Phone"),
                                  ConstTextField(
                                    controller: controller.phoneNumberController.value,
                                    hintText: "Phone",
                                    inputType: TextInputType.number,
                                  ),
                                  const Divider(),
          
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
                                          services.addPhoneNumberPost(
                                              controller.selectedTitle.value.toString(),
                                              controller.phoneNumberController.value.text);
                                          Get.back();
                                        },color: AppColors.info80,text: "Save",)
                                      ],
                                    ),
                                  ),
          
                                ],
                              ),
                            )
                          ],
          
                        );
                      });
                }, icon: Icon(Icons.edit,)),
              ),
              Obx(() => ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                  itemCount: services.addPhoneNumberData.length,
                  itemBuilder: (context,index){
                    return customListTile(title: services.addPhoneNumberData[index].title.toString(),
                        subtitle: services.addPhoneNumberData[index].number.toString(),
                        visibility: false);
                  })),
          
              //todo add email
              ListTile(
                title: constText12SemiBold(text: "Add email"),
                trailing: IconButton(onPressed: (){
                  showDialog(context: context,
                      builder: (BuildContext context){
                        return AlertDialog(
                          contentPadding: EdgeInsets.zero,
                          title: Center(child: Text('Add Email',style: AppTextStyles.kBody15SemiBoldTextStyle,),),
                          actions: [
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Divider(),
                                  constText12SemiBold(text: "Email"),
                                  ConstTextField(
                                    hintText: "Enter Your Email",
                                    controller: controller.emailController.value,
                                  ),
                                  const Divider(),
          
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
                                          services.addEmailPost(controller.emailController.value.text);
                                          Get.back();
                                        },color: AppColors.info80,text: "Save",)
                                      ],
                                    ),
                                  ),
          
                                ],
                              ),
                            )
                          ],
          
                        );
                      });
                }, icon: Icon(Icons.edit,)),
              ),
              Obx(() => ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: services.addEmailData.length,
                  itemBuilder: (context,index){
                    return customListTile(title: 'Email',
                        subtitle: services.addEmailData[index].email.toString(),
                        visibility: false);
                  })),
          
              //todo add social media profiles
              ListTile(
                title: constText12SemiBold(text: "Add social media"),
                trailing: IconButton(onPressed: (){
                  showDialog(context: context,
                      builder: (BuildContext context){
                        return AlertDialog(
                          backgroundColor: AppColors.white,
                          contentPadding: EdgeInsets.zero,
                          title: Center(child: Text('Add Social Media',style: AppTextStyles.kBody15SemiBoldTextStyle,),),
                          actions: [
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Divider(),
                                  constText12SemiBold(text: "Social Media"),
                                  ConstantDropdown(options: const ["Linkedin", 'Facebook',
                                    'Instagram', 'Twitter', 'YouTube', 'Pinterest', 'WhatsApp'],
                                    onChanged: (value) {
                                    controller.selectPlatform.value = value;
                                    },),
                                  constText12SemiBold(text: "URL"),
                                  ConstTextField(
                                    controller: controller.urlController.value,
                                    hintText: "Enter Social Medial URL",
                                  ),
                                  Divider(),
          
                                  SizedBox(
                                    width: double.maxFinite,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        MyCustomButton(onTap: (){
                                          Get.back();
                                        },color: Colors.grey,text: "Cancel",),
                                        const Text("  "),
                                     Obx(()=> services.  isLoading.value? CircularProgressIndicator() :MyCustomButton(onTap: (){
                                          services.addSocialMediaPost(
                                              controller.selectPlatform.value,
                                              controller.urlController.value.text
                                          ).whenComplete(()=>Get.back());
                                        },color: AppColors.info80,text: "Save",))
                                      ],
                                    ),
                                  ),
          
                                ],
                              ),
                            )
                          ],
          
                        );
                      });
                }, icon: Icon(Icons.edit,)),
              ),
           Obx(()=>   ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: services.addSocialMediaData.value.length,
                  itemBuilder: (context,index){
                    return customListTile(title: services.addSocialMediaData[index].platform.toString(),
                        subtitle: services.addSocialMediaData[index].url.toString(),
                        visibility: false);
                  })),
          
              //todo add website
          constText12SemiBold(text: "Add website"),
          customListTile(title: 'www.LikhitDe.com',visibility: false),


              //todo map
              Container(
                height: 180.h,
                color: Colors.indigo,
              ),

              //todo office location
              ListTile(
                title: constText12SemiBold(text: "Office Location"),
                trailing: IconButton(onPressed: (){
                  showDialog(context: context,
                      builder: (BuildContext context){
                        return SingleChildScrollView(
                          child: AlertDialog(
                            backgroundColor: AppColors.white,
                            contentPadding: EdgeInsets.zero,
                            title: Center(child: Text('Add Services',style: AppTextStyles.kBody15SemiBoldTextStyle,),),
                            actions: [
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Divider(),
                                    constText12SemiBold(text: "Country"),
                                    ConstantDropdown(options: const ["India"], onChanged: (value) {  },),
                                    constText12SemiBold(text: "State"),
                                    ConstantDropdown(options: const ["Andra Pradesh", 'Assam', 'UP', 'Bihar'], onChanged: (value) {  },),
                                    constText12SemiBold(text: "City"),
                                    ConstantDropdown(options: const ["Delhi", 'Lucknow', 'Muradabaad', 'Bhopaal'], onChanged: (value) {  },),
                                    constText12SemiBold(text: "Street"),
                                    ConstTextField(
                                      hintText: "Street",
                                    ),
                                    constText12SemiBold(text: "Apartment"),
                                    ConstTextField(
                                      hintText: "Apartment",
                                    ),
                                    constText12SemiBold(text: "Pin code"),
                                    ConstTextField(
                                      hintText: "Pin code",
                                    ),
                                    Divider(),
                          
                                    SizedBox(
                                      width: double.maxFinite,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          MyCustomButton(onTap: (){
                                            Get.back();
                                          },color: Colors.grey,text: "Cancel",),
                                          const Text("  "),
                                          MyCustomButton(onTap: (){},color: AppColors.info80,text: "Save",)
                                        ],
                                      ),
                                    ),
                          
                                  ],
                                ),
                              )
                            ],
                          
                          ),
                        );
                      });
                }, icon: Icon(Icons.edit,)),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 1,
                  itemBuilder: (context,index){
                    return customListTile(title: 'indira nagar lucknow loco colony under the constructor company',visibility: false);
                  }),

              //todo opening hours
              ListTile(
                title: constText12SemiBold(text: "Opening Hours"),
                trailing: IconButton(onPressed: (){
                  showDialog(context: context,
                      builder: (BuildContext context){
                        return AlertDialog(
                          contentPadding: EdgeInsets.zero,
                          title: Center(child: Text('Add Services',style: AppTextStyles.kBody15SemiBoldTextStyle,),),
                          actions: [
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Divider(),
                                  constText12SemiBold(text: "Name"),
                                  ConstTextField(
                                    hintText: "Enter Title",
                                  ),
                                  constText12SemiBold(text: "Sub Title"),
                                  ConstTextField(

                                    hintText: "Enter Sub Title",
                                  ),
                                  constText12SemiBold(text: "Fees"),
                                  ConstTextField(
                                    hintText: "Enter Fees",
                                  ),
                                  Divider(),

                                  SizedBox(
                                    width: double.maxFinite,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        MyCustomButton(onTap: (){
                                          Get.back();
                                        },color: Colors.grey,text: "Cancel",),
                                        const Text("  "),
                                        MyCustomButton(onTap: (){},color: AppColors.info80,text: "Save",)
                                      ],
                                    ),
                                  ),

                                ],
                              ),
                            )
                          ],

                        );
                      });
                }, icon: Icon(Icons.edit,)),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (context,index){
                    return customListTile(title: 'Sunday',visibility: false);
                  }),
            ],
          ),
        ),
      )
    );
  }
}
