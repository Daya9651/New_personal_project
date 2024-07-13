import 'package:flutter/material.dart';
import 'package:likhit/common/widget/const_text_with_styles.dart';

import '../common/decorations/shape_decorations.dart';
import '../const/const_width.dart';
import '../style/color.dart';

constDivider() {
  return const Divider(
    color: AppColors.white80,
    thickness: 0.8,
  );
}
askDialog(
    {required BuildContext context,
      required String title,
      required String doneText,
      required String cancelText,
      required void Function()? onPressedDone,
      required void Function()? onPressedCancel}) {
  return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: constShapeBorder(),

        title: const12TextBold(title),
        // content: const12TextBold(title),
        actions: [
         TextButton( child: const8Text(doneText),
            onPressed: onPressedDone,
          ),
          SizedBox(
            width:  w10,
          ),
          TextButton( child: const8Text(cancelText),
            onPressed: onPressedCancel,
          ),
        ],
      ));
}