import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:likhit/service/loginApi.dart';
import 'package:likhit/style/text_style.dart';

class Banking extends StatefulWidget {
  const Banking({super.key});

  @override
  State<Banking> createState() => _BankingState();
}
class _BankingState extends State<Banking> {
  @override
  void initState() {
    // EmailService().bankDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: 1, // Number of items in your list
        itemBuilder: (BuildContext context, int index,) {
          return Column(
              children: [
                SizedBox(
                  height: Get.height / 1.9,
                  width: Get.width,
                  // width: 370,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("lawyer", style: AppTextStyles.kBody20SemiBoldTextStyle,),
                            // Text( "",style: AppTextStyles.kBody20SemiBoldTextStyle,),
                            Text('Bank: union bank of india', style: AppTextStyles.kCaption12RegularTextStyle,),
                            Text('Ac.No:63226255',style: AppTextStyles.kCaption12RegularTextStyle,)
                          ],
                        ),
                        const SizedBox(height: 2,),
                        Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("lawyer", style: AppTextStyles.kBody20SemiBoldTextStyle,),
                            Text('Bank: HDFC ', style: AppTextStyles.kCaption12RegularTextStyle,),
                            Text('Ac.No:123456789',style: AppTextStyles.kCaption12RegularTextStyle,)
                          ],
                        ),
                        Container(
                          height: 190,
                          color: Colors.indigo,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Let's agree to Likhit De", style: AppTextStyles.kBody20SemiBoldTextStyle.copyWith(color: Colors.white),),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
        },
      ),
    );
  }
}
