import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class ContactInformationController extends GetxController{

  var phoneNumberController = TextEditingController().obs;
  // todo for email
  var emailController = TextEditingController().obs;
  //todo for url
  var urlController = TextEditingController().obs;

  RxString selectPlatform = ''.obs;


  // todo for radio button
  RxInt selectedValue = 1.obs;
  var selectedTitle = 'Mobile-Number'.obs;

  void setRadiobutton(int value, String title){
    selectedValue.value = value;
    selectedTitle.value = title;
  }
}