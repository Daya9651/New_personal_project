import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:likhit/common/widget/const_text_with_styles.dart';
import 'package:likhit/screens/auth/save_auth_data.dart';
import 'package:likhit/screens/lawyer_screen/screens/controllers/lawyer_profile_controller.dart';

import '../../lawyer_screen/screens/views/lawyer_profile.dart';
import '../contracts.dart';
import '../homepage.dart';
import '../lawyer_transactions.dart';

class BottomNavController extends GetxController {
  final LawyerProfileController lawyerProfileController = Get.find();

  RxInt selectedIndex = 0.obs;
  RxString userType = "".obs;

  final lawyerScreen = [
    const HomePage(),
    const Contracts(),
    const LawyerTransactionPage(),
    LawyerProfile(),
  ];
  final clientScreen = [
    Center(child: const12TextBold("Coming Soon")),
    Center(child: const12TextBold("Coming Soon")),
    Center(child: const12TextBold("Coming Soon")),
    Center(child: const12TextBold("Coming Soon")),
  ];

  List<String> titleNames = [
    "Home",
    "Appointments",
    "Transactions",
    "Profile",
  ];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getUserType();
    lawyerProfileController.getProfileData();
  }

  void onItemTapped(int index) {
    selectedIndex.value = index;
    if (index == 3) {
      lawyerProfileController.onInit();
    }
    debugPrint('selectedIndex.value ${selectedIndex.value}');
  }

  Future getUserType() async {
    userType.value = await UserDataService.getUserType() ?? "";
    update();
  }
}
