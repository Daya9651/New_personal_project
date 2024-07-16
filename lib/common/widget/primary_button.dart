import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:likhit/common/widget/const_text_with_styles.dart';
import 'package:likhit/style/color.dart';

import '../../const/const_width.dart';
import '../../style/gradients.dart';
import 'const_container.dart';

constTextContainer(
    text, {
      VoidCallback? onTap,
      double? width,
      Color?color
    }) {
  return InkWell(
    onTap: onTap,
    child: ConstantContainer(
      // constraints: constraintsMinWidthButton(),
      radiusBorder: w5,
      height: 0.05.sh,
      width: width,
      // ?? (isDesktop() ? 200.w : 0.4.sw),
      // gradient: primaryGradientColor,
      color:color?? AppColors.info80,
      child: Center(child: const10TextBold("  $text  ",textColor: AppColors.white)),
    ),
  );
}