import 'package:flutter/material.dart';
import 'package:likhit/style/text_style.dart';

class ContactInfoScreen extends StatefulWidget {
  const ContactInfoScreen({super.key});

  @override
  State<ContactInfoScreen> createState() => _ContactInfoScreenState();
}

class _ContactInfoScreenState extends State<ContactInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Contact Information", style: AppTextStyles.kBody17SemiBoldTextStyle,),
      ),
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
            ListTile(
            title: Text("List item $index"))
              ],
            );
          }),
    );
  }
}
