import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:likhit/common/widget/const_text_with_styles.dart';
import 'package:likhit/screens/auth/save_auth_data.dart';
import 'package:likhit/screens/client_screen/services/controller/client_api_controller.dart';

import '../../../const/const_width.dart';
import '../../routes/routes.dart';
import '../../style/color.dart';
import '../../utils/utils.dart';
import 'controller/likhit_drawer_controller.dart';

class LikhitDrawer extends GetView<LikhitDrawerController> {
  LikhitDrawer({super.key});

  final LikhitDrawerController controller = Get.put(LikhitDrawerController());
  final ClientApiController clientController = Get.put(ClientApiController());

  @override
  Widget build(BuildContext context) {
    return controller.bottomNavController.userType.value == "Lawyer"
        ? Drawer(
            backgroundColor: Colors.transparent,
            child: Container(
              color: AppColors.white,
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  _buildDrawerHeader(),
                  _buildDrawerItem(
                    icon: Icons.home,
                    text: 'Profile',
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  _buildDrawerItem(
                    icon: Icons.account_circle,
                    text: 'Appointment List',
                    onTap: () {
                      Get.toNamed(ApplicationPages.lawyerAppointmentList);
                    },
                  ),
                  _buildDrawerItem(
                    icon: Icons.account_circle,
                    text: 'Client Transaction',
                    onTap: () {
                      Get.toNamed(ApplicationPages.clientTransaction);
                    },
                  ),
                  _buildDrawerItem(
                    icon: Icons.account_circle,
                    text: 'My Transaction',
                    onTap: () {
                      Get.toNamed(ApplicationPages.lawyerMyTransaction);
                    },
                  ),
                  _buildDrawerItem(
                    icon: Icons.account_circle,
                    text: 'Plans',
                    onTap: () {
                      // Get.toNamed(ApplicationPages.lawyerAppointmentList);
                    },
                  ),
                  _buildDrawerItem(
                    icon: Icons.account_circle,
                    text: 'Payment Request',
                    onTap: () {
                      // Get.toNamed(ApplicationPages.clientLawyerList);
                    },
                  ),
                  constDivider(),
                  _buildDrawerItem(
                    icon: Icons.logout,
                    text: 'Logout',
                    onTap: () {
                      UserDataService.removeUser().then((_) {
                        Get.offAllNamed(ApplicationPages.signUpPage);
                      });
                      // Get.toNamed(ApplicationPages.settingPage);
                      // Handle settings navigation
                    },
                  ),
                ],
              ),
            ),
          )
        : Drawer(
            backgroundColor: Colors.transparent,
            child: Container(
              color: AppColors.white,
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  _buildDrawerHeader(),
                  _buildDrawerItem(
                    icon: Icons.home,
                    text: 'Profile',
                    onTap: () {
                      Get.toNamed(ApplicationPages.clientProfile);
                    },
                  ),
                  _buildDrawerItem(
                    icon: Icons.account_circle,
                    text: 'Lawyer List ',
                    onTap: () {
                      Get.toNamed(ApplicationPages.clientLawyerList);
                    },
                  ),
                  _buildDrawerItem(
                    icon: Icons.account_circle,
                    text: 'Appointment List',
                    onTap: () {
                      Get.toNamed(ApplicationPages.clientAppointmentList);
                    },
                  ),
                  _buildDrawerItem(
                    icon: Icons.account_circle,
                    text: 'Transaction List',
                    onTap: () {
                      // Get.toNamed(ApplicationPages.clientLawyerList);
                    },
                  ),
                  constDivider(),
                  _buildDrawerItem(
                    icon: Icons.logout,
                    text: 'Logout',
                    onTap: () {
                      UserDataService.removeUser().then((_) {
                        Get.offAllNamed(ApplicationPages.signUpPage);
                      });
                      // Get.toNamed(ApplicationPages.settingPage);
                      debugPrint("setting is pressing");
                      // Handle settings navigation
                    },
                  ),
                ],
              ),
            ),
          );
  }

  Widget _buildDrawerHeader() {
    return SizedBox(
      height: 0.35.sh,
      child: DrawerHeader(
        // decoration: const BoxDecoration(gradient: primaryGradientColor),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: w52,
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: w50,
                  backgroundImage: NetworkImage(
                      clientController.clientProfile.value.data?.image ?? ""),
                ),
              ),
              SizedBox(height: 10.w),
              const10TextBold(
                  "${clientController.clientProfile.value.data?.name.toString().toUpperCase()}"),
              const10TextBold(
                  "${clientController.clientProfile.value.data?.email}"),
              // const12TextBold("satyam@gmail.com"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String text,
    VoidCallback? onTap,
  }) {
    return ListTile(
        leading: Container(
            padding: EdgeInsets.all(w8),
            decoration: const BoxDecoration(
              color: AppColors.info80,
              shape: BoxShape.circle,
              // gradient: primaryGradientColor
            ),
            child: Icon(
              icon,
              color: AppColors.white,
            )),
        title: Text(text),
        onTap: onTap);
  }
}
