
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../style/color.dart';
import '../../style/text_style.dart';

class ConstWidgets {
  static constTextForTextFields(text, Widget child,
      {bool mandatory = false, double? width}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "  $text ",
                    style: AppTextStyles.kSmall10RegularTextStyle
                        .copyWith(color: AppColors.white100),
                  ),
                  TextSpan(
                    text: mandatory ? '*' : "",
                    style: AppTextStyles.kCaption12SemiBoldTextStyle
                        .copyWith(color: Colors.red),
                  ),
                ],
              ),
            ),
          ],
        ),
        // color: Colors.red.withOpacity(0.2),
        // Debug background color
        SizedBox(
            width: width ??  0.5.sw, child: child),
        // Comment this out for debugging
      ],
    );
  }
}

Widget richText(text1, text2) {
  return RichText(
    text: TextSpan(
      children: [
        TextSpan(
          text: '$text1 : ',
          style: AppTextStyles.kCaption12SemiBoldTextStyle
              .copyWith(color: AppColors.white100),
        ),
        TextSpan(
          text: text2,
          style: AppTextStyles.kCaption12RegularTextStyle
              .copyWith(color: AppColors.white90),
        ),
      ],
    ),
  );
}

Widget richText15(text1, text2) {
  return RichText(
    text: TextSpan(
      children: [
        TextSpan(
          text: '$text1 : ',
          style: AppTextStyles.kBody15SemiBoldTextStyle
              .copyWith(color: AppColors.white100),
        ),
        TextSpan(
          text: text2,
          style: AppTextStyles.kBody15RegularTextStyle
              .copyWith(color: AppColors.white90),
        ),
      ],
    ),
  );
}
