import 'package:flutter/material.dart';

import '../../const/const_width.dart';
import '../../style/color.dart';
import '../../style/text_style.dart';

class ConstantDropdown extends StatefulWidget {
  final List options;

  // final ValueChanged onChanged;
  final ValueChanged onChanged;
  final Color? iconColor;
  final Color? dropdownColor;
  final Color? textColor;
  final String? hint;
  final String? value;
  final FocusNode? focusNode;

  const ConstantDropdown({
    super.key,
    required this.options,
    required this.onChanged,
    this.iconColor,
    this.dropdownColor,
    this.textColor,
    this.hint,
    this.focusNode, this.value,
  });

  @override
  State<ConstantDropdown> createState() => _ConstantDropdownState();
}

class _ConstantDropdownState extends State<ConstantDropdown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: 50,
        minHeight: 50,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: w3, horizontal: w9),
        child: DropdownButtonHideUnderline(
          child: DropdownButtonFormField<String>(
            focusNode: widget.focusNode,
            hint: Text(widget.hint ?? "Select",
                style: AppTextStyles.kSmall10RegularTextStyle
                    .copyWith(color: AppColors.white50)),
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 8),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide(color: AppColors.white100, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide(color: AppColors.info80, width: 1),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.white100),
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide(color: Color(0xFFF65054)),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide(color: Color(0xFFF65054)),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please select value';
              }
              return null;
            },
            dropdownColor: widget.dropdownColor ?? AppColors.white,
            value:widget.value?? null,
            // value: widget.options.isNotEmpty ? widget.options.first : null,
            // Set default value to "Cash"
            onChanged: widget.onChanged,
            // icon: const Icon(CupertinoIcons.chevron_down),
            // iconSize: 15,
            iconEnabledColor: widget.iconColor ?? AppColors.white100,
            items: widget.options.map<DropdownMenuItem<String>>((value) {
              return DropdownMenuItem(
                value: value,
                child: Text(
                  value,
                  style: AppTextStyles.kCaption12RegularTextStyle
                      .copyWith(color: widget.textColor ?? AppColors.white100),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
