import 'package:flutter/material.dart';

class GenericAutocomplete<T extends Object> extends StatelessWidget {
  const GenericAutocomplete({
    super.key,
    required this.optionsBuilder,
    required this.onSelected,
    required this.fieldViewBuilder,
    required this.optionsViewBuilder,
  });

  final AutocompleteOptionsBuilder<T> optionsBuilder;
  final AutocompleteOnSelected<T> onSelected;
  final AutocompleteFieldViewBuilder fieldViewBuilder;
  final AutocompleteOptionsViewBuilder<T> optionsViewBuilder;

  @override
  Widget build(BuildContext context) {
    return Autocomplete<T>(
      optionsBuilder: optionsBuilder,
      onSelected: onSelected,
      fieldViewBuilder: fieldViewBuilder,
      optionsViewBuilder: optionsViewBuilder,
    );
  }
}
