import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:likhit/common/widget/const_shimmer_effects.dart';
import 'package:likhit/common/widget/custom_app_bar.dart';
import 'package:likhit/common/widget/primary_button.dart';
import 'package:likhit/screens/lawyer_screen/screens/controllers/lawyer_profile_controller.dart';
import 'package:shimmer/shimmer.dart';
import 'package:likhit/screens/lawyer_screen/screens/views/profile/models/lawyer_experience_model.dart';
import '../../../../../../common/widget/const_container.dart';
import '../../../../../../common/widget/const_text_field.dart';
import '../../../../../../common/widget/const_text_for_text_fields.dart';
import '../../../../../../common/widget/const_text_with_styles.dart';
import '../../../../../../common/widget/custom_date_picker.dart';
import '../../../../../../const/const_width.dart';
import '../../../../../../style/color.dart';

class LawyerExperiencePage extends GetView<LawyerProfileController> {
  const LawyerExperiencePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Experiences",
        actions: [
          constTextContainer("Add Experience",onTap: (){
            _addService(context);
          })
        ],
      ),
      body:Obx(()=>controller.isLoading.value? Shimmer.fromColors(
        baseColor: baseColor,
        highlightColor: highLightColor,
        child: loadSke(),
      ) :RefreshIndicator(
        onRefresh: controller.getLawyerExperience,
        child: ListView.builder(
            itemCount: controller.lawyerExperienceList.value.data?.length,
            itemBuilder: (context,index)

            {
              var serviceList =   controller.lawyerExperienceList.value.data?[index];
              return
                ConstantContainer(
                  radiusBorder: w5,
                  borderColor: AppColors.white50,
                  padding: w3,
                  child: ListTile(
                      title: const8TextBold("${serviceList?.title}"),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const6Text("${serviceList?.subtitle}",textColor: AppColors.white70),
                          const6Text("${serviceList?.fromDate}-${serviceList?.toDate}",textColor: AppColors.white70),
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
                              icon: const Icon(Icons.edit,color: AppColors.primary,),
                            ),
                            IconButton.filledTonal(onPressed: (){
                              controller.deleteServiceData(serviceList?.id??0);

                            },
                              icon: const Icon(Icons.delete,color: Colors.redAccent,),
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
      controller.subTitleController.value.text = service.subtitle ?? '';
      controller.feesController.value.text = service.fromDate?.toString() ?? '';
      controller.endDateController.value.text = service.toDate?.toString() ?? '';
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
          title: Text(service == null ? "Add Experience" : "Update Experience"),
          content: SizedBox(
            height: 0.7.sh,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ConstWidgets.constTextForTextFields("Title",
                    width: double.maxFinite,
                    ConstTextField(
                      controller: controller.titleController.value,
                    ),
                  ),
                  ConstWidgets.constTextForTextFields("Sub Title",
                    width: double.maxFinite,
                    ConstTextField(
                      controller: controller.subTitleController.value,
                    ),
                  ),
                  ConstWidgets.constTextForTextFields("Starting Year",
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
                  ConstWidgets.constTextForTextFields("Ending Year",
                    width: double.maxFinite,
                    ConstTextField(
                      inputType: TextInputType.number,
                      controller: controller.endDateController.value,
                      suffixIcon: IconButton(
                          onPressed: () {
                            selectDate(context).then((DateTime? selectedDate) {
                              if (selectedDate != null) {
                                String formatted = formattedDate(selectedDate);
                                controller.endDateController.value.text =
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
                    service == null ? "Add Experience" : "Update Experience",
                    onTap: () {
                      if (service == null) {
                        controller.postLawyerExperience();
                      } else {
                        controller.updateLawyerExperience(service.id ?? 0);
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
