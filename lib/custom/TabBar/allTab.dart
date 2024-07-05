import 'package:flutter/material.dart';

class TabAll extends StatelessWidget {
  const TabAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("All page"),
      ),
    );
  }
}
