import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:likhit/style/color.dart';
import 'package:likhit/style/text_style.dart';

import '../../../const/const_height.dart';
import '../../../const/const_width.dart';

Widget lawyerProfileDetailCard(
    {String? title,
    String? workspaceText,
    String? languageText,
    String? expText,
    String? locationText,
    String? image,
    Function()? onTap}) {
  return Card(
    color: AppColors.white,
    elevation: 3,
    shadowColor: AppColors.info80,
    child: InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Hero(
            tag: image ?? '',
            child: CircleAvatar(
              radius: w50,
              child: Image.network(
                image ?? '',
                fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title ?? '',
                  style: AppTextStyles.kCaption12SemiBoldTextStyle,
                ),
                Row(
                  children: [
                    Icon(Icons.workspace_premium),
                    Expanded(
                      child: Text(' ${workspaceText ?? ''}',
                          style: AppTextStyles.kSmall10RegularTextStyle),
                    ),
                  ],
                ).marginAll(h5),
                Row(
                  children: [
                    Icon(Icons.g_translate),
                    Expanded(
                      child: Text(' ${languageText ?? ''}',
                          style: AppTextStyles.kSmall10RegularTextStyle),
                    ),
                  ],
                ).marginAll(h5),
                Row(
                  children: [
                    Icon(Icons.school_outlined),
                    Expanded(
                      child: Text(' ${expText ?? ''} Yrs Exp',
                          style: AppTextStyles.kSmall10RegularTextStyle),
                    ),
                  ],
                ).marginAll(h5),
                Row(
                  children: [
                    Icon(Icons.location_on_outlined),
                    Expanded(
                      child: Text(' ${locationText ?? ''}',
                          style: AppTextStyles.kSmall10RegularTextStyle),
                    ),
                  ],
                ).marginAll(h5),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
