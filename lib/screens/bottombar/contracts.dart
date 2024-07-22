import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:likhit/routes/routes.dart';
import 'package:likhit/style/color.dart';
import 'package:likhit/style/text_style.dart';

import '../../const/const_height.dart';

class Contracts extends StatefulWidget {
  const Contracts({super.key});

  @override
  State<Contracts> createState() => _ContractsState();
}

class _ContractsState extends State<Contracts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.info80,
        onPressed: () {
          Get.toNamed(ApplicationPages.clientContract);
        },
        child: const Icon(
          Icons.add,
          color: AppColors.white,
        ),
      ),
      backgroundColor: AppColors.info10,
      body: SafeArea(
        child: GridView.builder(
          itemCount: 4,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (context, index) {
            return contractGridCard(text: 'Promise', date: '22 July 2024');
          },
        ),
      ),
    );
  }
}

Widget contractGridCard({String? text, String? date}) {
  return Card(
    margin: EdgeInsets.all(h5),
    color: AppColors.white,
    child: Padding(
      padding: EdgeInsets.all(h8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text ?? '',
            style: AppTextStyles.kCaption12SemiBoldTextStyle,
          ),
          Text(
            date ?? '',
            style: AppTextStyles.kSmall8RegularTextStyle,
          ),
          const Spacer(),
          Row(
            children: [
              Container(
                height: h45,
                decoration: BoxDecoration(
                    color: AppColors.info80,
                    borderRadius: BorderRadius.circular(h25)),
                child: Center(
                  child: Text(
                    'You',
                    style: AppTextStyles.kSmall8RegularTextStyle
                        .copyWith(color: AppColors.white),
                  ).marginAll(h8),
                ),
              ),
              Card(
                color: AppColors.warning20,
                child: Text(
                  'Pending',
                  style: AppTextStyles.kSmall8RegularTextStyle
                      .copyWith(color: AppColors.white),
                ).marginAll(h5),
              )
            ],
          ).marginAll(h5)
        ],
      ),
    ),
  );
}
