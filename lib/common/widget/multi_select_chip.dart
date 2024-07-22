import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../const/const_width.dart';

class MultiSelectChip extends StatelessWidget {
  final List<String> options;
  final List<String> selectedOptions;
  final Function(String) onSelectionChanged;

  const MultiSelectChip({super.key,
    required this.options,
    required this.selectedOptions,
    required this.onSelectionChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      children: options.map((option) {
        final isSelected = selectedOptions.contains(option);
        return ChoiceChip(
          label: Text(option),
          selected: isSelected,
          onSelected: (selected) {
            onSelectionChanged(option);
          },
        );
      }).toList(),
    );
  }
}

class SingleSelectChip extends StatelessWidget {
  final List<String> options;
  final String selectedOptions;
  final Function(String) onSelectionChanged;

  const SingleSelectChip({super.key,
    required this.options,
    required this.selectedOptions,
    required this.onSelectionChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      children: options.map((option) {
        final isSelected = selectedOptions.contains(option);
        return ChoiceChip(
          padding: EdgeInsets.all(w2),
          label: Text(option),
          selected: isSelected,
          onSelected: (selected) {
            onSelectionChanged(option);
          },
        );
      }).toList(),
    ).paddingSymmetric(horizontal: w6);
  }
}
