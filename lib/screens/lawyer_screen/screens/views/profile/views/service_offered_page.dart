import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:likhit/common/widget/const_shimmer_effects.dart';
import 'package:likhit/common/widget/custom_app_bar.dart';
import 'package:likhit/common/widget/primary_button.dart';
import 'package:likhit/const/image_strings.dart';
import 'package:likhit/screens/lawyer_screen/screens/controllers/lawyer_profile_controller.dart';
import 'package:likhit/screens/lawyer_screen/screens/views/profile/models/lawyer_service_model.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../common/widget/const_container.dart';
import '../../../../../../common/widget/const_text_field.dart';
import '../../../../../../common/widget/const_text_for_text_fields.dart';
import '../../../../../../common/widget/const_text_with_styles.dart';
import '../../../../../../const/const_width.dart';
import '../../../../../../style/color.dart';
import '../../../../../../utils/utils.dart';

class ServiceOfferedPage extends GetView<LawyerProfileController> {
  const ServiceOfferedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Service Offered",
        actions: [
          constTextContainer("Add Service",onTap: (){
            _addService(context);
          })
        ],
      ),
          body:Obx(()=>controller.isLoading.value? Shimmer.fromColors(
            baseColor: baseColor,
            highlightColor: highLightColor,
            child: loadSke(),
          ) :ListView.builder(
        itemCount: controller.lawyerServiceList.value.data?.length,
        itemBuilder: (context,index)

        {
          var serviceList =   controller.lawyerServiceList.value.data?[index];
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
                    ],
                  ),
                  trailing: SizedBox(
                    width: w80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton.filledTonal(onPressed: (){
_addService(context,service: serviceList);
                        },
                          icon: const Icon(Icons.edit,color: AppColors.primary,),
                        ),
                        IconButton.filledTonal(onPressed: (){

                          askDialogForDelete(
                              context: context,
                              doneText: "Yes",
                              onPressedDone: (){
                                controller.deleteServiceData(serviceList?.id??0);

                                Navigator.pop(context);

                              }

                          );


                        },
                          icon: const Icon(Icons.delete,color: Colors.redAccent,),
                        ),
                      ],
                    ),
                  )
              ),
            );
        })),

    );
  }

  void _addService(BuildContext context, {Data? service}) {
    // Initialize controllers with empty values or service data if editing
    if (service != null) {
      controller.titleController.value.text = service.title ?? '';
      controller.subTitleController.value.text = service.subtitle ?? '';
      controller.feesController.value.text = service.fee?.toString() ?? '';
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
          title: Text(service == null ? "Add Services" : "Update Service"),
          content: SizedBox(
            height: 0.5.sh,
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
                  ConstWidgets.constTextForTextFields("Fees",
                    width: double.maxFinite,
                    ConstTextField(
                      inputType: TextInputType.number,
                      hintText: "Enter Fees",
                      controller: controller.feesController.value,
                    ),
                  ),
                  constTextContainer(
                    service == null ? "Add Service" : "Update Service",
                    onTap: () {
                      if (service == null) {
                        controller.postServiceData();
                      } else {
                        controller.updateServiceData(service.id ?? 0);
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
