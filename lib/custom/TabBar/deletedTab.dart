import 'package:flutter/material.dart';

class TabDeleted extends StatelessWidget {
  const TabDeleted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
            child: Text("Deleted page")),
      ),
    );
  }
}
