import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:likhit/screens/auth/controller/account_manage_controller.dart';
import 'package:likhit/screens/auth/lawyer_add_profile.dart';
import 'package:likhit/screens/auth/user_add_profile.dart';
import 'package:likhit/screens/auth/widget/choose_card.dart';
import 'package:likhit/style/color.dart';

import '../../custom/botton.dart';

class ChoosePage extends StatefulWidget {
  const ChoosePage({super.key});

  @override
  State<ChoosePage> createState() => _ChoosePageState();
}

class _ChoosePageState extends State<ChoosePage> {

  AccountManageController controller = Get.put(AccountManageController());

  int choose = 0;
  bool choose1 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: Container(
                  margin: const EdgeInsets.only(left: 40,right: 40,top: 40),
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.height * 0.5,
                  child: Image.asset('assets/logo/likhitlogo.png'),
                ),
              ),
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 15),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Choose Account Type",style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700
                        ),),
                      ],
                    ),
                  ),
                  Container(
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ChooseCard(image: 'assets/logo/lawyer.png', language: "Lawyer",color: choose == 0?AppColors.info80:Colors.white,
                          onTap: (){
                            setState(() {
                              choose = 0;
                            });
                          },),
                        ChooseCard(image: 'assets/logo/client.webp', language: "Client",color: choose == 1? AppColors.info80:Colors.white,
                          onTap: (){
                            setState(() {
                              choose = 1;
                            });
                          },),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12,right: 12,bottom: 12),
                child: SizedBox(
                    width: double.maxFinite,
                    child: CustomButton(color: AppColors.white, text: "Continue",
                      onPressed: (){
                      choose == 0 ? Get.to(LawyerAddProfile()) : Get.to(UserAddProfile());
                      },)),
              )
            ],
          ),
        ),
      ),
    );
  }
}