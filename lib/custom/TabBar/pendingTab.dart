import 'package:flutter/material.dart';

class TabPending extends StatelessWidget {
  const TabPending({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(child: Text("Pending page")),
      ),
    );
  }
}
