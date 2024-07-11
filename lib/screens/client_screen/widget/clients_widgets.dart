import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:likhit/style/color.dart';
import 'package:likhit/style/text_style.dart';

import '../../../const/const_height.dart';

Widget lawyerProfileDetailCard(
    {String? title,
    String? workspaceText,
    String? languageText,
    String? expText,
    String? locationText,
    Function()? onTap}) {
  return Card(
    color: AppColors.white,
    elevation: 3,
    shadowColor: AppColors.info80,
    child: InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.all(h10),
            height: h80,
            width: h80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(h50),
                //todo selected image
                color: AppColors.info80),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sheryansh Tripathi',
                  style: AppTextStyles.kCaption12SemiBoldTextStyle,
                ),
                Row(
                  children: [
                    Icon(Icons.workspace_premium),
                    Expanded(
                      child: Text(' Domestic violence, DUI/DWI +3 More',
                          style: AppTextStyles.kSmall10RegularTextStyle),
                    ),
                  ],
                ).marginAll(h5),
                Row(
                  children: [
                    Icon(Icons.g_translate),
                    Text(' Marathi',
                        style: AppTextStyles.kSmall10RegularTextStyle),
                  ],
                ).marginAll(h5),
                Row(
                  children: [
                    Icon(Icons.school_outlined),
                    Text(' 10 Yrs Exp',
                        style: AppTextStyles.kSmall10RegularTextStyle),
                  ],
                ).marginAll(h5),
                Row(
                  children: [
                    Icon(Icons.location_on_outlined),
                    Expanded(
                      child: Text(' Bashkari Ambedker Nager',
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
