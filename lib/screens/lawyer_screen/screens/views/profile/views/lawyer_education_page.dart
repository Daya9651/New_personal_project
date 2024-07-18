import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:likhit/common/widget/const_shimmer_effects.dart';
import 'package:likhit/common/widget/custom_app_bar.dart';
import 'package:likhit/common/widget/primary_button.dart';
import 'package:likhit/screens/lawyer_screen/screens/controllers/lawyer_profile_controller.dart';
import 'package:shimmer/shimmer.dart';
import 'package:likhit/screens/lawyer_screen/screens/views/profile/models/lawyer_education_model.dart';
import '../../../../../../common/widget/const_container.dart';
import '../../../../../../common/widget/const_text_field.dart';
import '../../../../../../common/widget/const_text_for_text_fields.dart';
import '../../../../../../common/widget/const_text_with_styles.dart';
import '../../../../../../common/widget/custom_date_picker.dart';
import '../../../../../../const/const_width.dart';
import '../../../../../../style/color.dart';

class LawyerEducationPage extends GetView<LawyerProfileController> {
  const LawyerEducationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Education",
        actions: [
          constTextContainer("Add Education Details",onTap: (){
            _addService(context);
          })
        ],
      ),
      body:Obx(()=>controller.isLoading.value? Shimmer.fromColors(
        baseColor: baseColor,
        highlightColor: highLightColor,
        child: loadSke(),
      ) :RefreshIndicator(
        onRefresh: controller.getLawyerEducationData,
        child: ListView.builder(
            itemCount: controller.lawyerEducationList.value.data?.length,
            itemBuilder: (context,index)

            {
              var serviceList =   controller.lawyerEducationList.value.data?[index];
              return
                ConstantContainer(
                  radiusBorder: w5,
                  borderColor: AppColors.white50,
                  padding: w3,
                  child: ListTile(
                      title: const8TextBold("${serviceList?.name}"),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const6Text("${serviceList?.title}",textColor: AppColors.white70),
                          const6Text("${serviceList?.year}",textColor: AppColors.white70),
                        ],
                      ),
                      trailing: SizedBox(
                        width: w70,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton.filledTonal(onPressed: (){
                              _addService(context,service: serviceList);
                            },
                              icon: Icon(Icons.edit,color: AppColors.primary,),
                            ),
                            IconButton.filledTonal(onPressed: (){
                              controller.deleteServiceData(serviceList?.id??0);

                            },
                              icon: Icon(Icons.delete,color: Colors.redAccent,),
                            ),
                          ],
                        ),
                      )
                  ),
                );
            }),
      )),

    );
  }

  void _addService(BuildContext context, {Data? service}) {
    // Initialize controllers with empty values or service data if editing
    if (service != null) {
      controller.titleController.value.text = service.title ?? '';
      controller.subTitleController.value.text = service.name ?? '';
      controller.feesController.value.text = service.year?.toString() ?? '';
    } else {
      // Clear controllers if adding new service
      controller.titleController.value.clear();
      controller.subTitleController.value.clear();
      controller.feesController.value.clear();
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.white,
          title: Text(service == null ? "Add Education Details" : "Update Education Details"),
          content: SizedBox(
            height: 0.5.sh,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ConstWidgets.constTextForTextFields("University",
                    width: double.maxFinite,
                    ConstTextField(
                      controller: controller.titleController.value,
                    ),
                  ),
                  ConstWidgets.constTextForTextFields("Course",
                    width: double.maxFinite,
                    ConstTextField(
                      controller: controller.subTitleController.value,
                    ),
                  ),
                  ConstWidgets.constTextForTextFields("Years",
                    width: double.maxFinite,
                    ConstTextField(
                      inputType: TextInputType.number,
                      hintText: "Enter Years",
                      controller: controller.feesController.value,
                      suffixIcon: IconButton(
                          onPressed: () {
                            selectDate(context).then((DateTime? selectedDate) {
                              if (selectedDate != null) {
                                String formatted = formattedDate(selectedDate);
                                controller.feesController.value.text =
                                    formatted;
                              }
                            });
                          },
                          icon: const Icon(
                            Icons.calendar_month,
                            color: AppColors.info80,
                          )),
                    ),
                  ),
                  constTextContainer(
                    service == null ? "Add Education Details" : "Update Education Details",
                    onTap: () {
                      if (service == null) {
                        controller.postLawyerEducation();
                      } else {
                        controller.updateLawyerEducation(service.id ?? 0);
                      }
                      Get.back(); // Close the dialog after adding/updating
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

}
