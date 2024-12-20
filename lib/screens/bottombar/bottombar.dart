import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:likhit/common/widget/const_text_with_styles.dart';
import 'package:likhit/common/widget/custom_app_bar.dart';
import 'package:likhit/screens/bottombar/controllers/bottom_nav_controller.dart';

import '../drawer/likhit_drawer.dart';

class MyBottomBar extends GetView<BottomNavController> {
  final String ?userName;

  const MyBottomBar({super.key,
     this.userName});

  @override
  Widget build(BuildContext context) {
    // final initialIndex = Get.arguments['initialIndex'] ?? 0;
    controller.getUserType();
    // Set the initial selected index
    // controller.selectedIndex.value = initialIndex;
    return  Scaffold(
      backgroundColor: Colors.white,
      // floatingActionButton: FloatingActionButton(onPressed: (){},
      //   child: Icon(Icons.add)),
      appBar:CustomAppBar(
        textWidget:Obx(()=> Text(controller.titleNames[controller.selectedIndex.value])),
      ),
      drawer: LikhitDrawer(),
      bottomNavigationBar:Obx(()=> NavigationBarTheme(
        data: NavigationBarThemeData(
            labelTextStyle: WidgetStateProperty.resolveWith<TextStyle?>(
                  (Set<WidgetState> states) {
                if (states.contains(WidgetState.selected)) {
                  return const TextStyle(
                      color: Colors.indigo, fontWeight: FontWeight.bold);
                }
                return const TextStyle(color: Colors.grey);
              },
            ),
            indicatorColor: Colors.transparent),
        child: NavigationBar(

          backgroundColor: Colors.white,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          animationDuration: const Duration(seconds: 1),
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) {
            controller.selectedIndex.value = index;
            controller.onItemTapped;
          },          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_filled),
              label: "Home",
              selectedIcon: Icon(
                Icons.home_filled,
                color: Colors.indigo,
              ),
            ),
            NavigationDestination(
              icon: Icon(Icons.chat),
              label: "Contracts",
              selectedIcon: Icon(Icons.chat, color: Colors.indigo),
            ),
            NavigationDestination(
              icon: Icon(Icons.receipt_long_outlined,),
              label: "Transactions",
              selectedIcon: Icon(Icons.receipt_long, color: Colors.indigo),
            ),
            NavigationDestination(
              icon: Icon(Icons.person),
              label: "Profile",
              selectedIcon: Icon(Icons.person, color: Colors.indigo),
            ),
          ],
        ),
      )),
      body:Obx(()=>
      RefreshIndicator(
      onRefresh: () async {
        // Trigger a refresh based on user type
        if (controller.userType.value == "Lawyer") {
        await controller.lawyerProfileController.getProfileData();
        }
        // Add additional refresh logic if needed
        },


    child:   controller.userType.value =="Lawyer"? controller.lawyerScreen.elementAt(controller.selectedIndex.value):controller.clientScreen.elementAt(controller.selectedIndex.value)),
    ));
  }
}