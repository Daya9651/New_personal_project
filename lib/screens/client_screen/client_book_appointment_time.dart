import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:likhit/screens/client_screen/services/controller/client_api_controller.dart';
import 'package:likhit/screens/client_screen/services/controller/client_book_appointment_time_controller.dart';

import '../../common/widget/const_dropdown.dart';
import '../../common/widget/const_text_field.dart';
import '../../common/widget/custom_app_bar.dart';
import '../../common/widget/custom_date_picker.dart';
import '../../const/const_height.dart';
import '../../style/color.dart';
import '../profile/widget/profile_card.dart';

class ClientBookAppointmentTime
    extends GetView<ClientBookAppointmentTimeController> {
  ClientBookAppointmentTime({super.key});

  ClientApiController clientApiController = Get.put(ClientApiController());

  @override
  Widget build(BuildContext context) {
    debugPrint(
        "inzamam ${controller.clientBookAppointmentPost(serviceID: 36, lawyerID: 16)}");
    return Scaffold(
      appBar: CustomAppBar(
        title: "Book Appointment",
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: h25, right: h25, top: h25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ConstantDropdown(
                options: const ["30 Min Meeting", '60 Min Meeting'],
                onChanged: (value) {
                  controller.timeDuration.value = value;
                  // debugPrint(" gender ${controller.gender.value}");
                },
              ),
              constText12SemiBold(text: "Select Date"),
              ConstTextField(
                controller: controller.dateController.value,
                suffixIcon: IconButton(
                    onPressed: () {
                      selectDate(context).then((DateTime? selectedDate) {
                        if (selectedDate != null) {
                          String formatted = formattedDate(selectedDate);
                          controller.dateController.value.text = formatted;
                        }
                      });
                    },
                    icon: const Icon(
                      Icons.calendar_month,
                      color: AppColors.info80,
                    )),
              ),
              constText12SemiBold(text: "Time"),
              ConstTextField(
                controller: controller.timeController.value,
                suffixIcon: IconButton(
                    onPressed: () {
                      selectTime(context).then((TimeOfDay? selectedTime) {
                        if (selectedTime != null) {
                          // Format the selected time as 12-hour format with AM/PM
                          String formattedTime = formatTime(selectedTime);

                          // Update your controller's value
                          controller.timeController.value.text = formattedTime;
                        }
                      });
                    },
                    icon: const Icon(
                      Icons.lock_clock,
                      color: AppColors.info80,
                    )),
              ),
              constText12SemiBold(text: "Your Name"),
              ConstTextField(
                controller: controller.nameController.value,
                hintText: "Enter Your Name",
              ),
              constText12SemiBold(text: "Email"),
              ConstTextField(
                controller: controller.emailController.value,
                hintText: "Enter Your Email",
              ),
              constText12SemiBold(text: "Phone Number"),
              ConstTextField(
                controller: controller.phoneController.value,
                hintText: "Enter Your Phone",
                inputType: TextInputType.number,
              ),
              constText12SemiBold(text: "What is the call about ?"),
              ConstTextField(
                controller: controller.aboutController.value,
                maxLine: 2,
                hintText: "Brief Description",
              ),
              SizedBox(
                width: double.maxFinite,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MyCustomButton(
                      onTap: () {},
                      color: Colors.grey,
                      text: "Cancel",
                    ),
                    const Text("  "),
                    MyCustomButton(
                      onTap: () {
                        controller.clientBookAppointmentPost(
                            lawyerID: clientApiController
                                .lawyerBookDetailListData.value.data?.id,
                            serviceID: clientApiController
                                .lawyerBookDetailListData
                                .value
                                .data
                                ?.fees?[0]
                                .id);
                        // controller.bookAppointRazorPay();
                      },
                      color: AppColors.info80,
                      text: "Confirm & Pay",
                    )
                  ],
                ),
              ),
              SizedBox(
                height: h25,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
