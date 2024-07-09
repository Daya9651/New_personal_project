import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class LawyerProfileController extends GetxController{

   //todo for lawyer kyc verification
  var aadharController = TextEditingController().obs;
  var panCardController = TextEditingController().obs;
  var lawyerLicenseController = TextEditingController().obs;

  //todo upload profile
  var nameController = TextEditingController().obs;
  var phoneController = TextEditingController().obs;
  var addressController = TextEditingController().obs;
  var websiteURLController = TextEditingController().obs;
  var aboutController = TextEditingController().obs;
  var experienceController = TextEditingController().obs;

  final Rx<File?> _image = Rx<File?>(null);

  File? get image => _image.value;

  Future<void> getImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _image.value = File(pickedFile.path);
    } else {
      _image.value = "No file choose" as File?;
    }
  }

  //todo for Services offered Controller
  var titleController = TextEditingController().obs;
  var subtitleController = TextEditingController().obs;
  var feesController = TextEditingController().obs;

}