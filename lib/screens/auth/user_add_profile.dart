import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/widget/const_dropdown.dart';
import '../../common/widget/const_text_field.dart';
import '../../common/widget/custom_date_picker.dart';
import '../../const/const_height.dart';
import '../../style/color.dart';
import '../profile/widget/profile_card.dart';
import 'controller/account_manage_controller.dart';

class UserAddProfile extends StatelessWidget {
   UserAddProfile({super.key});

  final AccountManageController controller = Get.put(AccountManageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: constText15SemiBold(text: "Client Add Profile"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: h25,right: h25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              constText12SemiBold(text: "Name",imp: true),
              ConstTextField(
                controller: controller.nameController.value,
                hintText: "Enter Name",
              ),
              constText12SemiBold(text: "Phone", imp: true),
              ConstTextField(
                controller: controller.phoneController.value,
                hintText: "Enter Phone",
              ),

              constText12SemiBold(text: "dob"),
              ConstTextField(
                controller: controller.dateAndTimeController.value,
                suffixIcon: IconButton(onPressed: (){
                  selectDate(context)
                      .then((DateTime? selectedDate) {
                    if (selectedDate != null) {
                      String formatted =
                      formattedDate(selectedDate);
                      controller.dateAndTimeController.value.text = formatted;
                    }
                  });
                },icon: const Icon(Icons.calendar_month, color: AppColors.info80,)),
              ),

              constText12SemiBold(text: "Gender", imp: true),
              ConstantDropdown(options: const ["Male", 'Female', 'Other'],
                onChanged: (value) { controller.gender.value = value; },),

              constText12SemiBold(text: "Address"),
              ConstTextField(
                controller: controller.addressController.value,
                maxLine: 2,
                hintText: "Enter Address",
              ),

              SizedBox(
                width: double.maxFinite,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MyCustomButton(onTap: (){},color: Colors.grey,text: "Cancel",),
                    const Text("  "),
                    MyCustomButton(onTap: (){

                      controller.confirmUserApi();
                    },color: AppColors.info80,text: "Save",)
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
