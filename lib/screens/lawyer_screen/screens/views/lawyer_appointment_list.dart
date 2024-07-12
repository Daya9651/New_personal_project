
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:likhit/common/widget/const_container.dart';
import 'package:likhit/common/widget/const_text_field.dart';
import 'package:likhit/common/widget/const_text_with_styles.dart';
import 'package:likhit/common/widget/custom_app_bar.dart';
import 'package:likhit/screens/lawyer_screen/screens/controllers/lawyer_appointment_controllers.dart';

import '../../../../const/const_height.dart';
import '../../../../const/const_width.dart';
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
          return const Center(child: CircularProgressIndicator());
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
              color:transaction.status=="Pending  " ?AppColors.white:AppColors.success10,
              child: ListTile(
                title: const8TextBold("${transaction.name}"),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const6Text(" ${transaction.email} Mob: ${transaction.phoneNo}"),
                    const6Text("Content: ${transaction.content}"),
                    const8TextBold("Time: ${formatDateTime(DateTime.parse(transaction.createdDate??""))}"),

                  ],
                ),
                trailing:ElevatedButton(


                  onPressed: transaction.status=="Approved" ? null:(){

                   askDialog(
                     title: "Appointment Status",
                     context: context,
                     doneText:"Accept",
                     cancelText: "Reschedule",
                       onPressedCancel: (){

                       },
                       onPressedDone: (){
                       controller.bookAppointment(transaction.id, "Approved");
                       },

                   );


                  },child: const6Text(transaction.status.toString()),)
              ),
            );
          },
        );
      }),
    );
  }


}
