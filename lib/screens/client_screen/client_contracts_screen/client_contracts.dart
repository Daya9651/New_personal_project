import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:likhit/common/widget/custom_app_bar.dart';
import 'package:likhit/routes/routes.dart';
import 'package:likhit/style/color.dart';
import 'package:likhit/style/text_style.dart';

import '../../../const/const_height.dart';

class ClientContracts extends StatelessWidget {
  const ClientContracts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Choose Your Contract',
      ),
      body: SafeArea(
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Get.toNamed(ApplicationPages.clientContractDetail);
                },
                child: contractCard(
                    title: 'Promise',
                    subTitle: 'An official pledge to myself with a signature',
                    time: '2 min'),
              );
            }),
      ),
    );
  }
}

Widget contractCard({
  String? title,
  String? subTitle,
  String? time,
}) {
  return Card(
    margin: EdgeInsets.all(h10),
    color: AppColors.info10,
    child: Padding(
      padding: EdgeInsets.all(h10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title ?? '',
                style: AppTextStyles.kBody15SemiBoldTextStyle
                    .copyWith(color: AppColors.info80),
              ),
              Icon(
                Icons.car_rental,
                color: AppColors.info80,
                size: h50,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  width: 0.6.sw,
                  child: Text(
                    subTitle ?? '',
                    style: AppTextStyles.kSmall8RegularTextStyle
                        .copyWith(color: AppColors.info40),
                  )),
              Row(
                children: [
                  Icon(
                    Icons.timelapse_sharp,
                    color: AppColors.info80,
                    size: h20,
                  ),
                  SizedBox(
                    width: h3,
                  ),
                  Text(
                    time ?? '',
                    style: AppTextStyles.kSmall6RegularTextStyle,
                  )
                ],
              )
            ],
          ),
        ],
      ),
    ),
  );
}
