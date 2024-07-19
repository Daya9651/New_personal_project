import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:likhit/common/widget/const_text_with_styles.dart';
import 'package:likhit/style/color.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../common/widget/custom_app_bar.dart';
import '../../const/const_height.dart';
import '../../const/image_strings.dart';
import '../../custom/botton.dart';
import '../../service/loginApi.dart';

class VerifyOtpPage extends StatefulWidget {
  final String email;

  // final String ?verifyByOtp;

  const VerifyOtpPage({
    required this.email,
  });

  @override
  _VerifyOtpPageState createState() => _VerifyOtpPageState();
}

class _VerifyOtpPageState extends State<VerifyOtpPage> {
  TextEditingController otpController = TextEditingController();
  final EmailService emailService = EmailService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const CustomAppBar(title: 'OTP Verification'),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  logo,
                  height: 160,
                  width: 160,
                ),
                SizedBox(height: h30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const12Text(
                      'Enter OTP sent to ${widget.email}',
                    ).marginOnly(
                      bottom: h20,
                    ),
                  ],
                ),
                SizedBox(
                  height: h3,
                ),
                PinCodeTextField(
                  controller: otpController,
                  appContext: context,
                  length: 6,
                  // Length of the OTP. Change according to your requirement.
                  onChanged: (value) {
                    // Handle OTP change if needed
                  },
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 40,
                    activeColor: Colors.indigo,
                    inactiveColor: Colors.grey,
                  ),
                  // controller: otpController,
                  keyboardType: TextInputType.number,
                  onCompleted: (value) {
                    emailService.verifyByOtp(
                        widget.email ?? "", otpController.text, context);
                  },
                  // onCompleted: (value) {
                  //   // When user completes entering OTP
                  //   String enteredOTP = value.trim();
                  //   // Perform OTP verification (replace with your actual logic)
                  //   if (enteredOTP == otpController.text.length) {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (context) => const SplashScreen(), // Replace with your next page widget
                  //       ),
                  //     );
                  //   } else {
                  //     // Handle incorrect OTP scenario
                  //     showDialog(
                  //       context: context,
                  //       builder: (context) => AlertDialog(
                  //         title: const Text('Invalid OTP'),
                  //         content: const Text('Please enter the correct OTP.'),
                  //         actions: [
                  //           TextButton(
                  //             child: const Text('OK'),
                  //             onPressed: () {
                  //               Navigator.of(context).pop();
                  //             },
                  //           ),
                  //         ],
                  //       ),
                  //     );
                  //   }
                  // },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const12Text(
                      "Didn't Receive code?",
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    TextButton(
                        onPressed: () {
                          emailService.sendOtp(widget.email, context);
                        },
                        child: const12TextBold("Resend",
                            textColor: AppColors.warning40)),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  height: h50,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(h10),
                      color: Colors.indigo),
                  child: CustomButton(
                    color: Colors.white,
                    text: 'Continue',
                    onPressed: () {
                      debugPrint(
                          "sending otp : ${widget.email} ,${otpController.text}");
                      emailService.verifyByOtp(
                          widget.email ?? "", otpController.text, context);
                      // Manual verification button if needed
                      //   String enteredOTP = otpController.text.trim();
                      //   // Perform OTP verification (replace with your actual logic)
                      //   if (enteredOTP == otpController.text.length) {
                      //     Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //         builder: (context) => const SplashScreen(), // Replace with your next page widget
                      //       ),
                      //     );
                      //   } else if(enteredOTP == otpController.text.isEmpty) {
                      // ConstToast.to.showError("Please enter the correct OTP.");
                      //   } else {
                      //     // Handle incorrect OTP scenario
                      //     ConstToast.to.showError("Please enter the correct OTP.");
                      //   }
                    },
                  ),
                ),
                const SizedBox(
                  height: 150,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//
// import 'package:flutter/material.dart';
// import 'package:likhit/screens/splash/splash_screen.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';
//
// import '../../custom/botton.dart';
//
// class VerifyOtpPage extends StatefulWidget {
//   final String email;
//   final String verifyByOtp;
//
//   VerifyOtpPage({required this.email, required this.verifyByOtp});
//
//   @override
//   _VerifyOtpPageState createState() => _VerifyOtpPageState();
// }
//
// class _VerifyOtpPageState extends State<VerifyOtpPage> {
//   TextEditingController otpController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Verify OTP'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'Enter OTP sent to ${widget.email}',
//               style: TextStyle(fontSize: 18),
//             ),
//             SizedBox(height: 20),
//             // Use PinCodeTextField for OTP input
//             PinCodeTextField(
//               appContext: context,
//               length: 6, // Length of the OTP. Change according to your requirement.
//               onChanged: (value) {
//                 // Handle OTP change if needed
//               },
//               pinTheme: PinTheme(
//                 shape: PinCodeFieldShape.box,
//                 borderRadius: BorderRadius.circular(5),
//                 fieldHeight: 50,
//                 fieldWidth: 40,
//                 activeColor: Colors.indigo,
//                 inactiveColor: Colors.grey,
//               ),
//               controller: otpController,
//               keyboardType: TextInputType.number,
//               onCompleted: (value) {
//                 // When user completes entering OTP
//                 String enteredOTP = value.trim();
//                 // Perform OTP verification (replace with your actual logic)
//                 if (enteredOTP == otpController.text) {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => SplashScreen(), // Replace with your next page widget
//                     ),
//                   );
//                 } else {
//                   // Handle incorrect OTP scenario
//                   showDialog(
//                     context: context,
//                     builder: (context) => AlertDialog(
//                       title: Text('Invalid OTP'),
//                       content: Text('Please enter the correct OTP.'),
//                       actions: <Widget>[
//                         TextButton(
//                           child: Text('OK'),
//                           onPressed: () {
//                             Navigator.of(context).pop();
//                           },
//                         ),
//                       ],
//                     ),
//                   );
//                 }
//               },
//             ),
//             SizedBox(height: 20),
//             CustomButton(
//               text: 'Verify OTP',
//               onPressed: () {
//                 // Manual verification button if needed
//                 String enteredOTP = otpController.text.trim();
//                 // Perform OTP verification (replace with your actual logic)
//                 if (enteredOTP == otpController.text) {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => SplashScreen(), // Replace with your next page widget
//                     ),
//                   );
//                 } else {
//                   // Handle incorrect OTP scenario
//                   showDialog(
//                     context: context,
//                     builder: (context) => AlertDialog(
//                       title: Text('Invalid OTP'),
//                       content: Text('Please enter the correct OTP.'),
//                       actions: <Widget>[
//                         TextButton(
//                           child: Text('OK'),
//                           onPressed: () {
//                             Navigator.of(context).pop();
//                           },
//                         ),
//                       ],
//                     ),
//                   );
//                 }
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
