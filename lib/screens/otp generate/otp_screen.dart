import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../const/const_height.dart';
import '../../custom/botton.dart';
import '../../style/text_style.dart';
import '../splash/splash_screen.dart';

class VerifyOtpPage extends StatefulWidget {
  final String email;
  final String verifyByOtp;

  const VerifyOtpPage({required this.email, required this.verifyByOtp});

  @override
  _VerifyOtpPageState createState() => _VerifyOtpPageState();
}

class _VerifyOtpPageState extends State<VerifyOtpPage> {
  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('OTP Verification'),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/logo/likhitlogo.png', height: 160, width: 160,),
              const SizedBox(height: 80),
               Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                   Text(
                     'Enter OTP sent to ${widget.verifyByOtp}',
                     style: TextStyle(fontSize: 18),
                   ),
                 ],
               ),
              const SizedBox(height: 3,),
              PinCodeTextField(
                appContext: context,
                length: 6, // Length of the OTP. Change according to your requirement.
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
                  // When user completes entering OTP
                  String enteredOTP = value.trim();
                  // Perform OTP verification (replace with your actual logic)
                  if (enteredOTP == otpController) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SplashScreen(), // Replace with your next page widget
                      ),
                    );
                  } else {
                    // Handle incorrect OTP scenario
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Invalid OTP'),
                        content: const Text('Please enter the correct OTP.'),
                        actions: [
                          TextButton(
                            child: const Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Didn't Receive code?", style: AppTextStyles.kBody15SemiBoldTextStyle,),
                  const SizedBox(width: 2,),
                  TextButton(onPressed: () {  },
                  child: Text("Resend", style: AppTextStyles.kBody15SemiBoldTextStyle.copyWith(color: Colors.orange.shade400),)),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                height: h40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.indigo
                ),
                child: CustomButton(
                  color: Colors.white,
                  text: 'Continue',
                  onPressed: () {
                    // Manual verification button if needed
                    String enteredOTP = otpController.text.trim();
                    // Perform OTP verification (replace with your actual logic)
                    if (enteredOTP == otpController.text) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SplashScreen(), // Replace with your next page widget
                        ),
                      );
                    } else {
                      // Handle incorrect OTP scenario
                      // showDialog(
                      //   context: context,
                      //   builder: (context) => AlertDialog(
                      //     title: const Text('Invalid OTP'),
                      //     content: const Text('Please enter the correct OTP.'),
                      //     actions: <Widget>[
                      //       TextButton(
                      //         child: const Text('OK'),
                      //         onPressed: () {
                      //           Navigator.of(context).pop();
                      //         },
                      //       ),
                      //     ],
                      //   ),
                      // );
                    }
                  },
                ),
              ),
              const SizedBox(height: 150,)
            ],
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
