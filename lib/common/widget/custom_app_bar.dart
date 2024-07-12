import 'package:flutter/material.dart';

import '../../style/color.dart';
import '../../style/text_style.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String ?title;
  final List<Widget>? actions;
  final Widget? leading;

  const CustomAppBar(
      {super.key,  this.title, this.actions, this.leading});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(
    color:
        AppColors.white
       // Change this color to whatever you want
    ),
      // forceMaterialTransparency: true,
      titleTextStyle: AppTextStyles.kCaption12SemiBoldTextStyle
          .copyWith(color: AppColors.white),
      title: Text(title??""),
      leading: leading,
      // centerTitle: true,

      actions: actions,
      backgroundColor: AppColors.info80,

    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
