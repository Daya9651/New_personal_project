import 'package:flutter/material.dart';
import 'package:likhit/style/text_style.dart';

import '../const/const_width.dart';

class CardHome extends StatelessWidget {
  final Color? color;
  const CardHome({this.color,
    super.key, Padding? child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      width: double.maxFinite,
      child: Card(
        color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset('assets/logo/ailogo.png',width: w30, ),
                      Text('AI Contracts Likhit \nLorem ipsum is placeholder.',
                        style: AppTextStyles.kCaption12RegularTextStyle,
                      ),
                    ],
                  ),
                ),
                // SizedBox(width: 50),
                Expanded(
                  // flex: 2,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text('Active',
                            style: TextStyle(fontSize: 16, color: Colors.green),),
                          Text('0', style: TextStyle(fontSize: 24),),
                        ],
                      ),
                      Column(
                        children: [
                          Text('Pending',
                            style: TextStyle(fontSize: 16, color: Colors.orange),),
                          Text('0', style: TextStyle(fontSize: 24),),
                        ],
                      ),
                      Column(
                        children: [
                          Text('Rejected',
                            style: TextStyle(fontSize: 16, color: Colors.red),),
                          Text('0', style: TextStyle(fontSize: 24),),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }
}
