import 'package:flutter/material.dart';
import 'package:likhit/screens/drawer/likhit_drawer.dart';
// import 'package:likhit/screens/drawer/likhit_drawer.dart';

class TestingPurpose extends StatelessWidget {
  const TestingPurpose({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: LikhitDrawer(),
      appBar: AppBar(
        title: Text('TestingPurpose'),
      ),
    );
  }
}
