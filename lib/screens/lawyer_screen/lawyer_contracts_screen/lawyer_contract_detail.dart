import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:likhit/common/widget/const_dropdown.dart';
import 'package:likhit/custom/botton.dart';
import 'package:likhit/routes/routes.dart';
import 'package:likhit/style/color.dart';
import 'package:likhit/style/text_style.dart';

import '../../../const/const_height.dart';

class LawyerContractDetail extends StatelessWidget {
  const LawyerContractDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Icon(
                Icons.car_rental,
                size: h70,
                color: AppColors.info80,
              ),
            ),
            Text(
              'Promise',
              style: AppTextStyles.kBody17SemiBoldTextStyle,
            ).marginOnly(top: h15, bottom: h15),
            ConstantDropdown(
                options: const ['Likhit DE in English '],
                onChanged: (value) {}),
            Text(
              text,
              style: AppTextStyles.kSmall8RegularTextStyle
                  .copyWith(color: Colors.grey),
            ).marginAll(h15),
            SizedBox(
                width: double.maxFinite,
                child: CustomButton(
                  text: 'BEGIN',
                  onPressed: () {
                    Get.toNamed(ApplicationPages.lawyerPromise);
                  },
                  color: AppColors.white,
                ))
          ],
        ).marginAll(h15),
      ),
    );
  }
}

const String text =
    'Section2(b)oftheIndianContractAct,1872definesapromiseas:‘        whenthepersontowhomtheproposalismadesignifieshisassentthereto,t        heproposalbecomesanacceptedproposal.Apropo         salwhenaccepted,becomesapromise’.Apromisetodoorabstainfromdoingsomethingbecomesanagreementwhenitisacceptedbyallthepartiesinvolvedintheagreement.WhatisanAgreement?Anagreementisapromiseorcommitmentgivenbyonepartytoanotherparty.Itincludesanofferthatismadebyonepersonandacceptedbytheotherperson.Insimplewords,anagreementhappenswhenanofferismadebyonepersonandacceptedbyanotherperson.Itconsistsoftwoormoreparties.Itbecomesanagreementonlyiftheessentialingredientsarefulfilled.Theremustbeaconsideration.EssentialsofForminganAgreement';
