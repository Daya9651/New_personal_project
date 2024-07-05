import 'package:flutter/material.dart';

class TabActive extends StatelessWidget {
  const TabActive({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Active page"),
      ),
    );
  }
}
