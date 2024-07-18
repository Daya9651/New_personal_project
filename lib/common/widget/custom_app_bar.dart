import 'package:flutter/material.dart';

import '../../style/color.dart';
import '../../style/text_style.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;
  final Widget? leading;
  final Widget? textWidget;
  final PreferredSizeWidget? bottom; // Add this property

  const CustomAppBar({
    super.key,
    this.title,
    this.actions,
    this.textWidget,
    this.leading,
    this.bottom, // Initialize it in the constructor
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(
        color: AppColors.white, // Change this color to whatever you want
      ),
      titleTextStyle: AppTextStyles.kCaption12SemiBoldTextStyle
          .copyWith(color: AppColors.white),
      title: textWidget??Text(title ?? ""),
      leading: leading,
      actions: actions,
      backgroundColor: AppColors.info80,
      bottom: bottom, // Add the bottom property to the AppBar
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
    kToolbarHeight + (bottom?.preferredSize.height ?? 0.0), // Adjust height based on bottom's preferred size
  );
}
