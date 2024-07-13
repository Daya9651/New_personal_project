import 'package:flutter/material.dart';
import 'package:likhit/common/widget/custom_app_bar.dart';
import 'package:likhit/const/image_strings.dart';
import 'package:likhit/style/text_style.dart';

class Invoicing extends StatelessWidget {
  const Invoicing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Invoices',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Image.asset(logo, width: 70,),
                    Text('LikhitDe', style: AppTextStyles.kBody15SemiBoldTextStyle,),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('City : Lucknow'),
                    Text('State : Uttar Pradesh'),
                    Text('Country : India'),
                    Text('Currency : INR'),
                    Text('Mob No : 1234567890'),
                    Text('Area : Indra Nagar'),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('Payment Invoice', style: AppTextStyles.kBody15SemiBoldTextStyle,),
                    const Text('order number')
                  ],
                )
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Bill To', style: AppTextStyles.kBody15SemiBoldTextStyle,),
                    const Text('Lawyer :'),
                    const Text('Mobile :'),
                    const Text('Area :'),
                    const Text('City :'),
                    const Text('State :'),
                    const Text('Country :'),
                  ],
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Invoice Date :',),
                    Text('02-07-2024 :: 05:49:56'),
                    Text('Reference# :'),
                    Text('order_OTlGYdE61xJGRX')
                  ],
                )
              ],
            ),
            const Divider(),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Service'),
                Column(
                  children: [
                    Text('Price'),
                    Divider(),
                    Text('Discount')
                  ],
                ),
                Text('Status'),
                Text('Payment \nMethod'),
                Text('Total Amount'),
              ],
            ),
            const Divider(),
            const Text(
              'Notes',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('Please make payment within 30 days.'),
          ],
        ),
      ),
    );
  }
}
