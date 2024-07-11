import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../style/color.dart';
import '../../style/text_style.dart';

class CustomRadioButton extends StatelessWidget {
  final List<RadioOption> options;
  final Function(int value, String title) onChanged;
  final int groupValue;
  const CustomRadioButton({super.key, required this.options, required this.onChanged, required this.groupValue,});


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...options.map((option) =>
        // Obx(() =>
        RadioListTile(
          dense: true,
          visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
          contentPadding: EdgeInsets.zero,
          activeColor: AppColors.info80,
          title: Text(option.title??'', style: AppTextStyles.kCaption12SemiBoldTextStyle),
          value: option.value,
          groupValue: groupValue,
          secondary: Icon(option.icon),
          onChanged: (value) {
            onChanged(value??0, option.title??'');
          },
        )).toList(),
      ],
    );
  }
}

class RadioOption {
  final int? value;
  final String? title;
  final String? subtitle;
  // final int? groupValue;
  final IconData? icon;

  RadioOption({
    this.value,
    this.title,
    this.subtitle,
    // this.groupValue
    this.icon,
  });
}