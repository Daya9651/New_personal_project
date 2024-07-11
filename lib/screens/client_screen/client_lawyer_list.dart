import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:likhit/screens/client_screen/widget/clients_widgets.dart';
import 'package:likhit/style/color.dart';

import '../profile/widget/profile_card.dart';
import 'client_booking_appointment.dart';

class ClientLawyerList extends StatelessWidget {
  const ClientLawyerList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: constText15SemiBold(text: "Lawyer List"),
      ),
      body: Container(
          child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      // Get.to();
                    },
                    child: lawyerProfileDetailCard(
                        onTap: () {
                          Get.to(ClientBookingAppointment());
                        },
                        title: 'Sheryansh Tripathi',
                        languageText: 'Domestic violence, DUI/DWI +3 More',
                        expText: 'Marathi',
                        locationText: '10 Yrs Exp',
                        workspaceText: 'Bashkari Ambedker Nager'));
              })),
    );
  }
}
