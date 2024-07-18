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
    color: AppColors.info10,
    elevation: 3,
    shadowColor: AppColors.info80,
    child: InkWell(
      onTap: onTap,
      child: Row(
        children: [
          CircleAvatar(
            radius: w35,
            backgroundColor: Colors.transparent,
            // Ensure CircleAvatar is transparent
            child: AspectRatio(
              aspectRatio: 1,
              child: ClipOval(
                child: Image.network(
                  image ?? '',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title ?? '',
                  style: AppTextStyles.kCaption12SemiBoldTextStyle
                      .copyWith(fontSize: h18),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.workspace_premium,
                      size: h20,
                    ),
                    Expanded(
                      child: Text(' ${workspaceText ?? ''}',
                          style: AppTextStyles.kSmall10RegularTextStyle
                              .copyWith(fontSize: h12)),
                    ),
                  ],
                ).marginAll(h5),
                Row(
                  children: [
                    Icon(
                      Icons.g_translate,
                      size: h20,
                    ),
                    Expanded(
                      child: Text(' ${languageText ?? ''}',
                          style: AppTextStyles.kSmall10RegularTextStyle
                              .copyWith(fontSize: h12)),
                    ),
                  ],
                ).marginAll(h5),
                Row(
                  children: [
                    Icon(
                      Icons.school_outlined,
                      size: h20,
                    ),
                    Expanded(
                      child: Text(' ${expText ?? ''} Yrs Exp',
                          style: AppTextStyles.kSmall10RegularTextStyle
                              .copyWith(fontSize: h12)),
                    ),
                  ],
                ).marginAll(h5),
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: h20,
                    ),
                    Expanded(
                      child: Text(' ${locationText ?? ''}',
                          style: AppTextStyles.kSmall10RegularTextStyle
                              .copyWith(fontSize: h12)),
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
