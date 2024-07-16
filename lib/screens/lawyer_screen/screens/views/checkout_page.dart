import 'package:flutter/material.dart';
import 'package:likhit/common/widget/custom_app_bar.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Order Summary",
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
