import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:likhit/screens/bottombar/controllers/bottom_nav_controller.dart';

import '../../drawer/likhit_drawer.dart';

class MyBottomBar extends GetView<BottomNavController> {
  final String ?userName;

  const MyBottomBar({super.key,
     this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // floatingActionButton: FloatingActionButton(onPressed: (){},
      //   child: Icon(Icons.add)),
      appBar: AppBar(

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
              icon: Icon(Icons.inbox),
              label: "Inbox",
              selectedIcon: Icon(Icons.inbox, color: Colors.indigo),
            ),
            NavigationDestination(
              icon: Icon(Icons.person),
              label: "Profile",
              selectedIcon: Icon(Icons.person, color: Colors.indigo),
            ),
          ],
        ),
      )),
      body:Obx(()=> controller.screen.elementAt(controller.selectedIndex.value)),
    );
  }
}