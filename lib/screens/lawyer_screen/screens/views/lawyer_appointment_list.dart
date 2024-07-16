// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:likhit/common/widget/const_container.dart';
// import 'package:likhit/common/widget/custom_app_bar.dart';
// import 'package:likhit/common/widget/const_text_field.dart';
// import 'package:likhit/custom/botton.dart';
// import 'package:likhit/style/text_style.dart';
// import '../../../../const/const_width.dart';
// import '../../../../style/color.dart';
// import '../../controller/lawyer_appointment_controller.dart';
//
// class LawyerAppointmentList extends GetWidget<LawyerAppointmentController> {
//   const LawyerAppointmentList({Key ?key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(
//         title: 'Appointment List',
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(
//               width: 300,
//               child: ConstTextField(
//                 // controller: controller.searchSubCategoryController.value,
//                 hintText: "Search Brand",
//                 // onChanged: (value) {
//                 //   controller.getBrands(search: value);
//                 //   controller.filterBrands(value);
//                 // },
//               ),
//             ), // Adjust spacing as needed
//             Expanded(
//               child: ListView.builder(
//                 itemCount: 20,
//                 itemBuilder: (context, index) {
//                   // Replace with your actual list item widget
//                   return ConstantContainer(
//                     color: AppColors.white,
//                     child: Row(
//                       mainAxisAlignment:
//                       MainAxisAlignment.spaceBetween,
//                       children: [
//                         CircleAvatar(radius: 30,
//                           child: Icon(Icons.person_3_sharp),),
//                         Column(
//                           crossAxisAlignment:
//                           CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               'Title',
//                               // '${product.title}',
//                               style: AppTextStyles
//                                   .kSmall10SemiBoldTextStyle
//                                   .copyWith(
//                                   color: AppColors
//                                       .secondary500),
//                             ),
//                             Row(
//                               children: [
//                                 Text('12/05/2024'),
//                                 SizedBox(width: 5,),
//                                 Text('09:54:00'),
//                               ],
//                             )
//                           ],
//                         ),
//                         CustomButton(text:'pendding', onPressed: (){})
//
//                       ],
//                     ).marginAll(w3),
//                   ).paddingAll(w4);
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:likhit/common/widget/const_container.dart';
import 'package:likhit/common/widget/const_text_field.dart';
import 'package:likhit/common/widget/const_text_with_styles.dart';
import 'package:likhit/common/widget/custom_app_bar.dart';
import 'package:likhit/common/widget/primary_button.dart';
import 'package:likhit/screens/lawyer_screen/screens/controllers/lawyer_appointment_controllers.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../common/widget/const_shimmer_effects.dart';
import '../../../../common/widget/custom_date_picker.dart';
import '../../../../const/const_height.dart';
import '../../../../const/const_width.dart';
import '../../../../const/image_strings.dart';
import '../../../../helpers/string_to_date_function.dart';
import '../../../../style/color.dart';
import '../../../../utils/utils.dart';

class LawyerAppointmentList extends GetView<LawyerAppointmentControllers> {
  const LawyerAppointmentList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Appointments",
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(h50),
            child: ConstTextField(
              controller: controller.searchTransactionController.value,
              onChanged: (value) {
                controller.getLawyerAppointment(search: value);
              },
              hintText: "Search Appointments",
              enableBorderColor: AppColors.white,
              suffixIcon: IconButton(onPressed: (){
                controller.searchTransactionController.value.clear();
                controller.getLawyerAppointment();

              }, icon: const Icon(CupertinoIcons.multiply_circle,color: AppColors.white,)),
            )
        ),
      ),
      body:Obx(() {
        if (controller.lawyerAppointmentList.value.data == null) {
          return Center(
            child: Shimmer.fromColors(
              baseColor: baseColor,
              highlightColor: highLightColor,
              child: loadSke(),
            ),
          );
        }

        if (controller.lawyerAppointmentList.value.data!.isEmpty) {
          return const Center(child: Text("No transactions found."));
        }

        return ListView.builder(
          itemCount: controller.lawyerAppointmentList.value.data!.length,
          itemBuilder: (context, index) {
            var transaction = controller.lawyerAppointmentList.value.data![index];

            return ConstantContainer(
              radiusBorder: w5,
              borderColor: AppColors.white50,
              padding: w3,
              color:transaction.paymentStatus!="Paid" ?AppColors.white:AppColors.success10,
              child: ListTile(
                title: const8TextBold("${transaction.name}"),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const6Text(" ${transaction.email} Mob: ${transaction.phoneNo}"),
                    const6Text("Content: ${transaction.content}"),
                    const8TextBold("Time: ${formatDateTime(DateTime.parse(transaction.createdDate??""))}"),
                    const8TextBold("$rS ${transaction.paymentAmount}",textColor: AppColors.success40),

                  ],
                ),
                trailing:transaction.paymentStatus=="Paid"?ElevatedButton(


                  onPressed: transaction.status=="Approved" ? null:(){

                   askDialog(
                     title: "Appointment Status",
                     context: context,
                     doneText:"Accept",
                     cancelText: "Reschedule",
                       onPressedCancel: (){
                         _showReschedule(context,transaction.id);
                       },
                       onPressedDone: (){
                       controller.bookAppointment(transaction.id, "Approved");
                       },

                   );


                  },child: const6Text(transaction.status.toString()),):const6TextBold('${transaction.paymentStatus}',textColor: AppColors.error40)
              ),
            );
          },
        );
      }),
    );
  }

  _showReschedule(BuildContext context,id){
    return showDialog(context: context, builder: (context){

      return SizedBox(
        height: 0.3.sh,
        child: AlertDialog(
          backgroundColor: AppColors.white,
          title: const12TextBold("Appointment Status"),
          content: SingleChildScrollView(
            child: Column(
              children: [
                ConstTextField(
                  hintText: "Select Date",
                  controller: controller.dateController.value,
                  suffixIcon: IconButton(
                      onPressed: () {
                        selectDate(context).then((DateTime? selectedDate) {
                          if (selectedDate != null) {
                            String formatted = formattedDate(selectedDate);
                            controller.dateController.value.text =
                                formatted;
                          }
                        });
                      },
                      icon: const Icon(
                        Icons.calendar_month,
                        color: AppColors.info80,
                      )),
                ),
                ConstTextField(
                  hintText: "Select Time",
                  controller: controller.timeController.value,
                  suffixIcon: IconButton(
                      onPressed: () async {
                        TimeOfDay? selectedTime = await selectTime(context);
            
                          if (selectedTime != null) {
                            String formattedTime = selectedTime.format(context);
                            controller.timeController.value.text =
                                formattedTime;
            
                        }
                      },
                      icon: const Icon(
                        Icons.timer,
                        color: AppColors.info80,
                      )),
                ),
                ConstTextField(
                  hintText: "Reason",
                  maxLine: 5,
                  controller: controller.reasonController.value,
            
                ),
              ],
            ),
          ),
          actions: [
            constTextContainer("Cancel",color: baseColor,
            width: 0.3.sw,
              onTap: () {
                Get.back();
             controller.   clrControllers();
              }
            ),
        Obx(()=>controller.isLoading.value? const Center(child: CircularProgressIndicator(),)  : constTextContainer("Save",
                width: 0.3.sw,
              onTap: (){
              controller.rescheduleAppointment(id);
              }
            )),
          ],
        ),
      );
    });
  }

}
