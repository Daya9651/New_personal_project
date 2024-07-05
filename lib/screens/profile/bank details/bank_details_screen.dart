import 'package:flutter/material.dart';
import 'package:likhit/common/widget/const_container.dart';
import 'package:likhit/common/widget/const_text_field.dart';
import 'package:likhit/screens/payment/payment_dropdown.dart';
import 'package:likhit/style/color.dart';
import 'package:likhit/style/text_style.dart';
import 'bank_details_controller.dart';
// Import the confirmation screen

class BankDetailsScreen extends StatelessWidget {
  final BankDetailsControllers controllers = BankDetailsControllers();

  @override
  void dispose() {
    controllers.dispose();
    // super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bank Account Details',
          style: AppTextStyles.kBody17SemiBoldTextStyle,
        ),
        automaticallyImplyLeading: false, // Disable back button
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Account Holder Name', style: AppTextStyles.kBody15RegularTextStyle),
                  ConstantContainer(
                    height: 55,
                    child: ConstTextField(
                      controller: controllers.accountHolderNameController,
                      labelText: 'Account Holder Name',
                    ),
                  ),
                  Text('Bank Name', style: AppTextStyles.kBody15RegularTextStyle),
                  ConstantContainer(
                    height: 55,
                    child: ConstTextField(
                      controller: controllers.bankNameController,
                      labelText: 'Bank Name',
                    ),
                  ),
                  Text('Account Number', style: AppTextStyles.kBody15RegularTextStyle),
                  ConstantContainer(
                    height: 55,
                    child: ConstTextField(
                      controller: controllers.accountNumberController,
                      labelText: 'Account Number',
                    ),
                  ),
                  Text('IFSC Code', style: AppTextStyles.kBody15RegularTextStyle),
                  ConstantContainer(
                    height: 55,
                    child: ConstTextField(
                      controller: controllers.ifscCodeController,
                      labelText: 'IFSC Code',
                    ),
                  ),
                  Text('Select Type', style: AppTextStyles.kBody15RegularTextStyle),
                  ConstantContainer(
                    height: 40,
                    child: SizedBox(
                      width: 320,
                      child: ConstantDropdown(
                        options: const ['Current Account', 'Saving Account', 'Other'],
                        onChanged: (value) {},
                      ),
                    ),
                  ),
                  Text('Micro Code', style: AppTextStyles.kBody15RegularTextStyle),
                  ConstantContainer(
                    height: 55,
                    child: ConstTextField(
                      controller: controllers.microCodeController,
                      hintText: 'MICRO CODE',
                    ),
                  ),
                  Text('UPI ID', style: AppTextStyles.kBody15RegularTextStyle),
                  ConstantContainer(
                    height: 55,
                    child: ConstTextField(
                      controller: controllers.upiIdController,
                      labelText: 'UPI ID',
                    ),
                  ),
                  Text('UPI ID', style: AppTextStyles.kBody15RegularTextStyle),
                  ConstantContainer(
                    height: 55,
                    child: ConstTextField(
                      controller: controllers.upiIdController,
                      labelText: 'UPI ID',
                    ),
                  ),
                  SizedBox(height: 10),
                  InkWell(
                    onTap: () {
                      // Navigate to confirmation screen on button tap
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => (
                      //       // Pass any necessary data to the confirmation screen
                      //       accountHolderName: controllers.accountHolderNameController.text,
                      //       bankName: controllers.bankNameController.text,
                      //       // Add more data as needed
                      //     ),
                      //   ),
                      // );
                    },
                    child: ConstantContainer(
                      color: AppColors.info80,
                      radiusBorder: 10,
                      child: TextButton(
                        onPressed: () {
                          // Handle adding bank logic here if needed
                        },
                        child: Text(
                          'ADD BANK',
                          style: AppTextStyles.kBody15RegularTextStyle.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
