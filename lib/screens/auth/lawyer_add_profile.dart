import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:likhit/common/widget/custom_date_picker.dart';
import 'package:likhit/screens/auth/controller/account_manage_controller.dart';
import 'package:likhit/screens/auth/services/model/state_model.dart';
import '../../common/widget/const_dropdown.dart';
import '../../common/widget/const_text_field.dart';
import '../../const/const_height.dart';
import '../../helpers/literals.dart';
import '../../style/color.dart';
import '../profile/widget/profile_card.dart';

class LawyerAddProfile extends StatelessWidget {
   LawyerAddProfile({super.key});

  final AccountManageController controller = Get.put(AccountManageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: constText15SemiBold(text: "Lawyer Add Profile"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: h25,right: h25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              constText12SemiBold(text: "Lawyer",imp: true),
              ConstTextField(
                controller: controller.lawyerController.value,
                hintText: "Create Lawyer Id",
              ),
              constText12SemiBold(text: "Name", imp: true),
              ConstTextField(
                controller: controller.nameController.value,
                hintText: "Enter Your Name",
              ),

              constText12SemiBold(text: "Phone", imp: true),
              ConstTextField(
                controller: controller.phoneController.value,
                hintText: "Enter Your Phone",
                inputType: TextInputType.number,
              ),

              constText12SemiBold(text: "Gender"),
              ConstantDropdown(options: const ["Male", 'Female', 'Other'],
                onChanged: (value) {
                controller.gender.value = value;
                debugPrint(" gender ${controller.gender.value}");
                 },),

              constText12SemiBold(text: "Select Speciality",imp: true),

              ConstantDropdown(options:
              specialityLawyer,
               onChanged: (value) {
                //todo tasked
              },),


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

              constText12SemiBold(text: "Country"),
              ConstantDropdown(options: const ["India"], onChanged: (value) {
                controller.country.value = value;
              },),

              constText12SemiBold(text: "State"),
           Obx(()=>   ConstantDropdown(
                options: controller.stateData
                    .map((item) => item.name)  // Accessing the 'name' property directly
                    .toList().toSet().toList(),
                onChanged: (newValue) {
                  var selectedItem = controller.stateData.firstWhere(
                        (item) => item.name == newValue,
                  );

                  int? stateID = selectedItem.id; // Assuming `id` is the property holding the ID
                  controller.state.value = newValue;
                  controller.cityGet(stateID);
                    // else {
                  //   controller.cityGet(null); // Handle case when selectedItem is null
                  // }
                },)),

              constText12SemiBold(text: "City"),
              Obx(() => ConstantDropdown(
                options: controller.cityData
                    .map((item) => item.name)
                    .toList().toSet().toList(),
                onChanged: (newValue) {
                  controller.city.value = newValue; // Assuming `city` is an observable in your controller
                },
              )),


              constText12SemiBold(text: "Address"),
              ConstTextField(
                controller: controller.addressController.value,
                maxLine: 2,
                hintText: "Enter Address",
              ),

              constText12SemiBold(text: "About"),
              ConstTextField(
                controller: controller.aboutController.value,
                maxLine: 3,
                hintText: "Enter About Yourself",
              ),

              constText12SemiBold(text: "Experiences"),
              ConstTextField(
                controller: controller.experienceController.value,
                maxLine: 2,
                hintText: "Enter Your Experience",
              ),

              SizedBox(
                width: double.maxFinite,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MyCustomButton(onTap: (){

                    },color: Colors.grey,text: "Cancel",),
                    const Text("  "),
                    MyCustomButton(onTap: (){
                      controller.confirmUserApi(confirm: "yes");
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
