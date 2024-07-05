import 'package:flutter/material.dart';

class BankDetailsControllers {
  final TextEditingController accountHolderNameController = TextEditingController();
  final TextEditingController bankNameController = TextEditingController();
  final TextEditingController accountNumberController = TextEditingController();
  final TextEditingController ifscCodeController = TextEditingController();
  final TextEditingController selectTypeController = TextEditingController();
  final TextEditingController microCodeController = TextEditingController();
  final TextEditingController upiIdController = TextEditingController();

  void dispose() {
    accountHolderNameController.dispose();
    bankNameController.dispose();
    accountNumberController.dispose();
    ifscCodeController.dispose();
    selectTypeController.dispose();
    microCodeController.dispose();
    upiIdController.dispose();
  }
}
