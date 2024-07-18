import 'package:flutter/material.dart';

class ConstMultipleCheckButton extends StatefulWidget {
  const ConstMultipleCheckButton({super.key});

  @override
  State<ConstMultipleCheckButton> createState() =>
      _ConstMultipleCheckButtonState();
}

class _ConstMultipleCheckButtonState extends State<ConstMultipleCheckButton> {
  List multipleSelected = [];
  List checkListItems = [
    {'id': 0, 'value': false, 'title': 'Sunday'},
    {'id': 1, 'value': false, 'title': 'Monday'},
    {'id': 2, 'value': false, 'title': 'Tuesday'},
    {'id': 3, 'value': false, 'title': 'Wednesday'},
    {'id': 4, 'value': false, 'title': 'Thursday'},
    {'id': 5, 'value': false, 'title': 'Friday'},
    {'id': 6, 'value': false, 'title': 'Saturday'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: List.generate(checkListItems.length, (index) {
          return CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            title: Text(
              checkListItems[index]['title'],
            ),
            value: checkListItems[index]['value'],
            onChanged: (value) {
              setState(() {
                checkListItems[index]['value'] = value;
                if (multipleSelected.contains(checkListItems[index])) {
                  multipleSelected.remove(checkListItems[index]);
                } else {
                  multipleSelected.add(checkListItems[index]);
                }
              });
            },
          );
        }),
      ),
    );
  }
}
