import 'package:flutter/material.dart';
import 'package:likhit/custom/card.dart';
import 'package:likhit/custom/tab_bar.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      backgroundColor: Colors.white,
       appBar: AppBar(
         automaticallyImplyLeading: false,
         toolbarHeight: 180,

         title: const PreferredSize(
           preferredSize: Size.fromHeight(100),
             child: CardHome()),
       ),
      body: const CompanyReportPage(),
    );
  }
}
