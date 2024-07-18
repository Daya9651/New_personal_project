import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:likhit/screens/auth/save_auth_data.dart';
import 'package:likhit/screens/lawyer_screen/screens/controllers/lawyer_profile_controller.dart';
import 'package:likhit/screens/lawyer_screen/screens/views/client_transaction.dart';

import '../../lawyer_screen/screens/views/lawyer_profile.dart';
import '../contracts.dart';
import '../homepage.dart';
import '../inbox.dart';
import '../lawyer_transactions.dart';
import '../profile.dart';

class BottomNavController extends GetxController{
  final LawyerProfileController lawyerProfileController = Get.find();

  RxInt selectedIndex = 0.obs;
  RxString userType = "".obs;

  final screen = [
    const HomePage(),
    const Contracts(),
    const LawyerTransactionPage(),
    LawyerProfile(),
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
    if(index == 3){
      lawyerProfileController.onInit();
    }
    debugPrint('selectedIndex.value ${selectedIndex.value}');
  }
  Future getUserType()async{

    userType.value = await UserDataService.getUserType()??"";
    update();

  }





}