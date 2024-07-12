import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../const/const_width.dart';
import '../../const/const_height.dart';
import '../../style/color.dart';
import '../../style/gradients.dart';
import '../../utils/utils.dart';
import 'controller/likhit_drawer_controller.dart';

class LikhitDrawer extends GetWidget<LikhitDrawerController> {
  const LikhitDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.transparent,
      child: Container(
        color: AppColors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            _buildDrawerHeader(),
            _buildDrawerItem(
              icon: Icons.home,
              text: 'Home',
              onTap: () {
                Navigator.pop(context);
              },
            ),
            _buildDrawerItem(
                icon: Icons.control_point,
                text: 'Inventory',
                onTap: () {
                  // Handle cart navigation
                },
                subItems: [
                  _buildDrawerSubItem('Add Category', onTap: () {
                    // Get.toNamed(ApplicationPages.categoryPage);
                  }, icons: Icons.category),
                  _buildDrawerSubItem('Add SubCategory', onTap: () {
                    // Get.toNamed(ApplicationPages.subCategoryPage);
                  }, icons: Icons.category_sharp),
                  _buildDrawerSubItem('Add Brands', onTap: () {
                    // Get.toNamed(ApplicationPages.brandPage);
                  }, icons: Icons.branding_watermark),
                  _buildDrawerSubItem('Add Products', onTap: () {
                    // Get.toNamed(ApplicationPages.productPage);
                  }, icons: Icons.add),
                ]),
            _buildDrawerItem(
              icon: Icons.account_circle,
              text: 'Inventory Verifications',
              onTap: () {
                // Get.toNamed(ApplicationPages.inventoryVerificationPage);
              },
            ),
            _buildDrawerItem(
                icon: Icons.storefront,
                text: 'Sales',
                onTap: () {
                  // Handle cart navigation
                },
                subItems: [
                  _buildDrawerSubItem('B2B CUSTOMER', onTap: () {
                    // Get.toNamed(ApplicationPages.b2bCustomerView);
                  }, icons: Icons.groups),
                  _buildDrawerSubItem('ESTIMATES', onTap: () {
                    // Get.toNamed(ApplicationPages.estimates);
                  }, icons: Icons.menu_book_rounded),
                  _buildDrawerSubItem('INVOICE', onTap: () {
                    // Get.toNamed(ApplicationPages.b2bInvoice);
                  }, icons: Icons.money),
                ]),

            _buildDrawerItem(
              icon: Icons.account_circle,
              text: 'Finance',
              onTap: () {
                // Get.toNamed(/ApplicationPages.accountPage);
              },
            ),
            _buildDrawerItem(
              icon: Icons.support,
              text: 'Support',
              onTap: () {
                // Get.toNamed(ApplicationPages.servicePage);
              },
            ),
            _buildDrawerItem(
              icon: Icons.account_circle,
              text: 'Profile',
              onTap: () {
                // Handle profile navigation
              },
            ),
            constDivider(),
            _buildDrawerItem(
              icon: Icons.settings,
              text: 'Settings',
              onTap: () {
                // Get.toNamed(ApplicationPages.settingPage);
                debugPrint("setting is pressing");
                // Handle settings navigation
              },
            ),
            // _buildDrawerItem(
            //     icon: Icons.exit_to_app,
            //     text: 'Logout',
            //     onTap: () {
            //       debugPrint("logout is pressing");
            //       // controller.
            //       Get.offAllNamed(ApplicationPages.loginScreen);
            //       UserDataService.clearUserData();
            //     }),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerHeader() {
    return DrawerHeader(
      decoration: const BoxDecoration(gradient: primaryGradientColor),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 30.w,
              // child: Hero(
              //   // tag: 'avatar_${userDataController.userName.value}',
              //   child: Image.asset(
              //     ImageString.logo,
              //   ),
              // ),
            ),
            SizedBox(height: 10.w),
            // constText15BoldWhite(userDataController.userName.value),
            // constText15BoldWhite(userDataController.storeMobile.value),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String text,
    VoidCallback? onTap,
    List<Widget>? subItems,
  }) {
    if (subItems != null && subItems.isNotEmpty) {
      return ExpansionTile(
        leading: Icon(icon),
        title: Text(text),
        children: subItems,
      );
    } else {
      return ListTile(leading: Icon(icon), title: Text(text), onTap: onTap);
    }
  }

  Widget _buildDrawerSubItem(String text,
      {VoidCallback? onTap, IconData? icons}) {
    return ListTile(
      visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
      leading: CircleAvatar(
        radius: w15,
        backgroundColor: AppColors.white30,
        child: Icon(
          icons ?? Icons.list,
          size: w10,
          color: AppColors.white100,
        ),
      ),
      title: const Text('Likhit De'),
      onTap: onTap,
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        color: AppColors.white70,
        size: w10,
      ),
    ).paddingSymmetric(vertical: h2);
  }
}
