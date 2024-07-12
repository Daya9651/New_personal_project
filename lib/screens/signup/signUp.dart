import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:likhit/common/widget/const_text_field.dart';
import 'package:likhit/const/const_height.dart';
import 'package:likhit/custom/botton.dart';
import 'package:likhit/style/color.dart';
import 'package:likhit/style/text_style.dart';
import '../../const/const_width.dart';
import '../../const/image_strings.dart';
import '../../service/loginApi.dart';

class SignInPage extends StatelessWidget {


  SignInPage({super.key});

  final TextEditingController emailController = TextEditingController();
  final EmailService emailService = Get.put(EmailService());

  final _formKey = GlobalKey<FormState>();
  late String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        // title: Text('Sign In'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 35,),
                Image.asset(logo, height: 160, width: 160,),
                const SizedBox(height: 70,),
                 Text(
                  'Log in or sign up to Likhit De',

                  style: AppTextStyles.kBody15SemiBoldTextStyle,
                ),
                const SizedBox(height: 10.0),
               // TextField(
               //    decoration: InputDecoration(
               //      labelText: 'Enter your mail',
               //      border: OutlineInputBorder(
               //        borderSide: BorderSide(color: Colors.grey),
               //        borderRadius: BorderRadius.circular(20),
               //      ),
               //      focusedBorder: OutlineInputBorder(
               //        borderSiget: ^4.6.6de: BorderSide(color: Colors.blue),
               //        borderRadius: BorderRadius.circular(20),// Change focused border color here
               //      ),
               //    ),
               //    keyboardType: TextInputType.emailAddress,
               //  ),
               //  ConstTextField(
               //   hintText: 'Hello',
               //
               //  ),

                ConstTextField(
                  inputType: TextInputType.emailAddress,
                  controller: emailController,
                  labelText: "Enter your mail",
                  height: 50,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!value.contains('@')) {
                      return 'Please Enter Your Valid Email';
                    }
                    // You can add more email validation logic if needed
                    return null;
                  },
                  onSubmitted: (value) {
                    if (email.isNotEmpty) {
                      emailService.sendOtp(email, context); // Assuming emailService is correctly implemented
                      // Clear the email field
                      // Navigate to the VerifyOtpPage after OTP is sent


                    }
                  },
                ),
                SizedBox(height:h5),
                     Container(
                    height: h40,
                      margin: EdgeInsets.all(w2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.indigo
                      ),
                      child: Obx(()=> emailService. isLoading.value? Center(child: const CircularProgressIndicator(color: AppColors.white,).paddingAll(w3)):CustomButton(
                          text: 'Continue',
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              String email = emailController.text.trim();
                              if (email.isNotEmpty) {
                                emailService.sendOtp(email, context); // Assuming emailService is correctly implemented
                                // Clear the email field
                                // Navigate to the VerifyOtpPage after OTP is sent


                          }
                         }
                        }, color: AppColors.white)),),
                SizedBox(height: h20),
                 //todo changes
                Row(
                  children: [
                    Divider(),
                    // Text(
                    //     'Or',
                    //     style: AppTextStyles.kBody15SemiBoldTextStyle
                    // ),
                    Divider(),

                  ],
                ),

                Text(
                    'Or',
                    style: AppTextStyles.kBody15SemiBoldTextStyle,
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: h15),
                  // icon: Icon(Icons.g_translate),
                   Container(
                     padding: EdgeInsets.all(h10),
                     decoration: BoxDecoration(
                       color: AppColors.white101,
                       borderRadius: BorderRadius.circular(15),
                     ),
                       child: CustomButton2(
                         imageHeight: 25,
                         imageWidth: 25,
                         image: "assets/logo/google.png",
                         text: 'Continue with Google', onPressed: () {}, color: Colors.black,)),
                const SizedBox(height: 16.0),
                  // icon: Icon(Icons.apple),
                  Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: CustomButton2(
                        imageHeight: 50,
                        imageWidth: 50,
                        image: "assets/logo/apple.png",
                        text: 'Continue with Apple', onPressed: (){}, color: Colors.white,)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
