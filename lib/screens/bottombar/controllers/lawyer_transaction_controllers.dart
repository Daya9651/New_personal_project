import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LawyerTransactionControllers extends GetxController{



  late PageController _pageController;
  final currentIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    // fetchDataAndStore();
    _pageController = PageController(initialPage: currentIndex.value);
  }




}