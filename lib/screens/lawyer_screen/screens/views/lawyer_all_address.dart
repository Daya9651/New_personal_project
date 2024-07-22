import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:likhit/common/widget/const_container.dart';
import 'package:likhit/common/widget/const_text_field.dart';
import 'package:likhit/common/widget/const_text_with_styles.dart';
import 'package:likhit/common/widget/custom_app_bar.dart';
import 'package:likhit/routes/routes.dart';
import 'package:likhit/screens/lawyer_screen/screens/controllers/add_address_controller.dart';
import 'package:likhit/screens/lawyer_screen/screens/controllers/lawyer_appointment_controllers.dart';
import 'package:likhit/style/gradients.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../common/widget/const_shimmer_effects.dart';
import '../../../../common/widget/primary_button.dart';
import '../../../../const/const_height.dart';
import '../../../../const/const_width.dart';
import '../../../../const/image_strings.dart';
import '../../../../helpers/string_to_date_function.dart';
import '../../../../style/color.dart';
import '../../../../utils/utils.dart';

class LawyerAllAddress extends GetView<AddAddressController> {
  const LawyerAllAddress({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args = Get.arguments ?? {};
    final bool showSelectionButton = args['showSelectionButton'] ?? false;
    final int planId = args['planId'] ?? 0;
    return Scaffold(
      appBar: CustomAppBar(
        title: "Address",
        actions: [
          constTextContainer("Add Address",color: AppColors.white40,
          onTap: (){
            Get.toNamed(ApplicationPages.addressLawyerAddress);
          }
          )
        ],
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(h50),
            child: ConstTextField(
              controller: controller.searchTransactionController.value,
              onChanged: (value) {
                controller.getAddressList(search: value);
              },
              hintText: "Search Address",
              enableBorderColor: AppColors.white,
              suffixIcon: IconButton(onPressed: (){
                controller.searchTransactionController.value.clear();
                controller.getAddressList();

              }, icon: const Icon(CupertinoIcons.multiply_circle,color: AppColors.white,)),
            )
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:
      showSelectionButton
          ?
      constTextContainer(
        onTap: (){
          controller.checkOut(planId,controller.selectedAddressId.value).then((_){
            _showAddressBottomSheet(context,planId,controller.selectedAddressId.value);

          });
          // controller.buySelectedPlan(planId,controller.selectedAddressId.value);
        },
          "Buy Card"
      )
          : null,

      body:Obx(() {
        if (controller.addressList.value.data == null || controller.isLoading.value) {
          return Center(
            child: Shimmer.fromColors(
              baseColor: baseColor,
                highlightColor: highLightColor,
              child: loadSke(),
            ),
          );
        }

        if (controller.addressList.value.data!.isEmpty) {
          return const Center(child: Text("No transactions found."));
        }

        return ListView.builder(
          itemCount: controller.addressList.value.data!.length,
          itemBuilder: (context, index) {
            var transaction = controller.addressList.value.data![index];

            // bool isSelected = controller.selectedAddressIndex.value == index;

            return Obx(()=> ConstantContainer(
              radiusBorder: w5,
              borderWidth: controller.selectedAddressIndex.value == index ?w1:0.5.w,
              borderColor:controller.selectedAddressIndex.value == index ? AppColors.info80 : AppColors.white50,
              child: ListTile(
                tileColor: controller.selectedAddressIndex.value == index ? Colors.blue.withOpacity(0.1) : Colors.transparent,
                onTap: () {
                  if (showSelectionButton) {

                    controller.selectAddressToBuy(index);
                    controller.selectedAddressId.value = transaction.id ?? 0; // Ensure this triggers UI update
                    debugPrint("ListTile tapped with planId: $planId and selectedAddressId: ${controller.selectedAddressId.value}");
                    debugPrint('address id : ${transaction.id}');
                  }
                },
                  title: const8TextBold("${transaction.name}"),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const6Text(" ${transaction.address} Pincode: ${transaction.pincode}"),
                      const6Text("City: ${transaction.city}"),
                      const6TextBold("${transaction.addressType}"),
                      const6TextBold("State:${transaction.state}\nCountry:${transaction.country}"),
                      const8TextBold("Mobile : ${transaction.mobileNumber}"),

                    ],
                  ),
                trailing: SizedBox(
                  width: w80,
                  child: Row(
                    children: [
                      IconButton(onPressed: (){
                        Get.toNamed(ApplicationPages.addressLawyerAddress,arguments: {
                          "addressId":transaction
                        });


                      }, icon: const Icon(Icons.edit_rounded,color: AppColors.info80,)),
                      IconButton(onPressed: (){

                        askDialogForDelete(
                            context: context,
                            doneText: "Yes",
                            onPressedDone: (){
                              controller.deleteAddress(transaction.id);
                              Navigator.pop(context);

                            }

                        );

                      }, icon: const Icon(Icons.delete_rounded,color: AppColors.hoverColor1,)),
                    ],
                  ),
                ),
              ),
            ));
          },
        );
      }),
    );
  }


   _showAddressBottomSheet(BuildContext context, int planId, int addressId) {
 return   showModalBottomSheet(
 backgroundColor: AppColors.white,
   useSafeArea: true,
      isDismissible:true ,
   isScrollControlled: true,
   context: context,
      builder: (context) {
        // controller.checkOut(planId,addressId);
        return DraggableScrollableSheet(
            expand: true,
            builder: (context, scrollController) {
            return Obx(()=>ListView(
              controller: scrollController,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                constFooterData(
                  "Order Summary","${controller.checkoutData.value.data?.discountAmount}"
                ),
                constFooterData(
                    "Likhit De Premium Plan","${controller.checkoutData.value.data?.planType}"
                ), constFooterData(
                    "Discount (10%)","-${controller.checkoutData.value.data?.discountAmount}"
                ), constFooterData(
                    "GST @ 18%","${controller.checkoutData.value.data?.gstAmount}"
                ),constFooterData(
                    "Coupon ","${controller.checkoutData.value.data?.couponamount}"
                ),constFooterData(
                    "Total Payable","${controller.checkoutData.value.data?.payableAmount}"
                ),
              TextButton(onPressed: (){}, child: const10TextBold("Apply Coupon",textColor: AppColors.info80)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {

                        Navigator.pop(context); // Close the bottom sheet
                      },
                      child: Text('Cancel'),
                    ),
                    constTextContainer(
                      onTap: () {
                        controller.buySelectedPlan(planId, addressId).then((_){
      controller.buyPlanByRazorPay(
        controller.checkoutData.value.data?.payableAmount??0
      ).whenComplete((){Get.offAllNamed(ApplicationPages.myBottomBar);});
                        });
                        Navigator.pop(context); // Close the bottom sheet
                      },
                     'Buy Card',
                    ),
                  ],
                ),
              ],
            ));
          }
        );
      },
    );
  }

Widget constFooterData(text1,text2){
  return ListTile(
    leading: const8Text(text1),
    trailing: const8TextBold(text2),

  );
}
}