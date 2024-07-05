import 'package:flutter/material.dart';

class TabRejected extends StatelessWidget {
  const TabRejected({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(child: Text("Rejected page")),
      ),
    );
  }
}
