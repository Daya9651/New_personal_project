import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:likhit/common/widget/const_dropdown.dart';
import 'package:likhit/common/widget/const_shimmer_effects.dart';
import 'package:likhit/common/widget/const_text_field.dart';
import 'package:likhit/common/widget/const_text_for_text_fields.dart';
import 'package:likhit/common/widget/const_text_with_styles.dart';
import 'package:likhit/common/widget/custom_app_bar.dart';
import 'package:likhit/common/widget/primary_button.dart';
import 'package:likhit/screens/lawyer_screen/screens/views/profile/controllers/lawyer_bank_controller.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../common/widget/const_container.dart';
import '../../../../const/const_width.dart';
import '../../../../style/color.dart';

class BankDetailsPage extends GetView<LawyerBankController> {
  const BankDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  CustomAppBar(
        title: "Bank Details",
        actions: [
          constTextContainer("Add Bank",onTap: (){
            Get.to(const AddBankPage());
          })
        ],
      ),
      body:Obx(()=>controller.isLoading.value?Shimmer.fromColors(
        baseColor: baseColor,
        highlightColor: highLightColor,
        child: loadSke(),
      ):ListView.builder(

        itemCount: controller.lawyerBankList.value.data?.length,

          itemBuilder: (context,index){

          var bankList = controller.lawyerBankList.value.data?[index];
          return  ConstantContainer(
            radiusBorder: w5,
            borderColor: AppColors.white50,
            padding: w3,
            child: ListTile(
                    title: const6TextBold("${bankList?.accountHolderName.toString().toUpperCase()}"),
                    subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const6Text("A/C:${bankList?.accountNumber}"),
              const6Text("IFSC:${bankList?.ifscCode}"),
            ],
                    ),



                trailing:    SizedBox(
                  width: w70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton.filledTonal(onPressed: (){
                        Get.to(AddBankPage(
                          id: bankList?.id,
                          accountNumber: bankList?.accountNumber.toString(),
                          accountHolderName: bankList?.accountHolderName,
                          qrImage: bankList?.qrCode,
                          ifscCode: bankList?.ifscCode,
                          accountType: bankList?.accountType,
                          bankName: bankList?.bankName,
                          micrCode: bankList?.micrCode.toString(),
                          upiId: bankList?.upiId.toString(),


                        ));
                      },
                        icon: Icon(Icons.edit,color: AppColors.primary,),
                      ),
                      IconButton.filledTonal(onPressed: (){
                        controller.deleteBank(bankList?.id??0);

                      },
                        icon: Icon(Icons.delete,color: Colors.redAccent,),
                      ),
                    ],
                  ),
                )
                  ),
          );})),
    );
  }
}
class AddBankPage extends GetView<LawyerBankController> {
  final int? id;
  final String? accountHolderName;
  final String? bankName;
  final String? accountNumber;
  final String? ifscCode;
  final String? accountType;
  final String? micrCode;
  final String? upiId;
  final String? qrImage;
  const AddBankPage({
    super.key,
    this.id,
    this.accountHolderName,
    this.bankName,
    this.accountNumber,
    this.ifscCode,
    this.accountType,
    this.micrCode,
    this.upiId,
    this.qrImage,
  });

  @override
  Widget build(BuildContext context) {
    if (id != null) {
      controller.nameController.value.text = accountHolderName ?? "";
      controller.bankNameController.value.text = bankName ?? "";
      controller.accNoController.value.text = accountNumber ?? "";
      controller.ifscController.value.text = ifscCode ?? "";
      controller.isSelectAccType.value = accountType ?? "";
      controller.micrController.value.text = micrCode ?? "";
      controller.upiController.value.text = upiId ?? "";
      // controller.qrImageFile = qrImage ?? "";
    }

    return Scaffold(
      appBar:  const CustomAppBar(
        title: "Bank Details",
      
      ),
      body:Obx(()=> controller.isLoading.value? Center(child: Shimmer.fromColors(
        baseColor: baseColor,
        highlightColor: highLightColor,
        child: loadSke(),
      ),): ListView(
        children: [
          ConstWidgets.constTextForTextFields("Account Holder Name",

              width: double.maxFinite,
              ConstTextField(

            controller: controller.nameController.value,

          )),
          ConstWidgets.constTextForTextFields("Bank Name",
              width: double.maxFinite,ConstTextField(
            controller: controller.bankNameController.value,
            width: double.maxFinite,
          )),
          ConstWidgets.constTextForTextFields("Account Number",
              width: double.maxFinite,ConstTextField(
            controller: controller.accNoController.value,
            inputType: TextInputType.number,

          )),
          ConstWidgets.constTextForTextFields("IFSC Code",
              width: double.maxFinite,ConstTextField(
            controller: controller.ifscController.value,

          )),
          ConstWidgets.constTextForTextFields("Account Type",
              width: double.maxFinite,ConstantDropdown(
          options: const [
            "Current",
            "Savings",
            "Other",
          ],
            onChanged: (value){
              controller.isSelectAccType.value = value;
            },

          )),
          ConstWidgets.constTextForTextFields("MICR Code",
              width: double.maxFinite,ConstTextField(
                inputType: TextInputType.number,
            controller: controller.micrController.value,

          )),
          ConstWidgets.constTextForTextFields("UPI Id",
              width: double.maxFinite,ConstTextField(
            controller: controller.upiController.value,

          )), ConstWidgets.constTextForTextFields("QR Image",
              width: double.maxFinite,ConstTextField(
            onTap: (){
              controller.getQrImage();
            },
            readyOnly: true,
            controller: TextEditingController(text: controller.qrImage.toString()),

          )),
          constTextContainer(
              id != null ? "Update Bank" : "Add Bank",
              onTap: () {
                if (id != null) {
                  controller.updateBankDetails(id??0);
                } else {
                  controller.addBankLawyer();
                }
              })
        ],
      ))
    );
  }
}
