// import 'package:flutter/material.dart';
// import 'package:dropdown_search/dropdown_search.dart';
//
// class CustomDropdown extends StatelessWidget {
//   final List<String> ?items;
//   final String ?selectedItem;
//   final ValueChanged onChanged;
//
//   const CustomDropdown({
//     Key? key,
//     this.items,
//     this.selectedItem,
//    required this.onChanged,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return DropdownSearch(
//       mode: Mode.MENU,
//       showSelectedItem: true,
//       items: items??[],
//       label: "Select an item",
//       hint: "Select an item",
//       selectedItem: selectedItem,
//       onChanged: onChanged,
//       dropdownBuilder: _customDropDownExample,
//       popupItemBuilder: _customPopupItemBuilderExample,
//     );
//   }
//
//   Widget _customDropDownExample(BuildContext context, String item, String itemDesignation) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       child: Text(
//         item,
//         style: TextStyle(fontSize: 16),
//       ),
//     );
//   }
//
//   Widget _customPopupItemBuilderExample(BuildContext context, String item, bool isSelected) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       color: isSelected ? Theme.of(context).canvasColor.withOpacity(0.7) : null,
//       child: Text(
//         item,
//         style: TextStyle(fontSize: 16),
//       ),
//     );
//   }
// }
