import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../style/color.dart';
import '../../style/text_style.dart';

enum CustomAxisDirection  { vertical, horizontal }

class CustomRadioButton extends StatelessWidget {
  final List<RadioOption> options;
  final Function(int value, String title) onChanged;
  final int groupValue;
  final CustomAxisDirection axis;

  const CustomRadioButton({
    super.key,
    required this.options,
    required this.onChanged,
    required this.groupValue,
    this.axis = CustomAxisDirection .vertical, // Default to vertical layout
  });

  @override
  Widget build(BuildContext context) {
    final List<Widget> radioButtons = options.map((option) =>
        RadioListTile(
          dense: true,
          visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
          contentPadding: EdgeInsets.zero,
          activeColor: AppColors.info80,
          title: Text(option.title ?? '', style: AppTextStyles.kSmall10SemiBoldTextStyle),
          value: option.value,
          groupValue: groupValue,
          secondary: Icon(option.icon),
          onChanged: (value) {
            onChanged(value ?? 0, option.title ?? '');
          },
        )).toList();

    return axis == CustomAxisDirection .vertical
        ? Column(children: radioButtons)
        : SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(children: radioButtons),
    );
  }
}

class RadioOption {
  final int? value;
  final String? title;
  final String? subtitle;
  final IconData? icon;

  RadioOption({
    this.value,
    this.title,
    this.subtitle,
    this.icon,
  });
}
