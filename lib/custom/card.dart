import 'package:flutter/material.dart';
import 'package:likhit/style/text_style.dart';

class CardHome extends StatelessWidget {
  final Color? color;
  const CardHome({this.color,
    super.key, Padding? child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      width: double.maxFinite,
      child: Padding(
        padding: const EdgeInsets.all(0.0),
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
                        Image.asset('assets/logo/ailogo.png', ),
                        SizedBox(width: 1,),
                        Column(
                          children: [
                            Text('AI Contracts Likhit',
                              style: AppTextStyles.kBody15RegularTextStyle,
                            ),
                            Text('Lorem ipsum is placeholder.' ,
                              style: AppTextStyles.kBody15RegularTextStyle,
                            ),
                          ],
                        ),
                        // SizedBox(width: 5,),
                        // Center(
                        //   child: InkWell(onTap: (){},
                        //     child: Expanded(
                        //       child: Container(
                        //           height: 30,
                        //           width: 55,
                        //           decoration: BoxDecoration(
                        //             color: Colors.indigo,
                        //             borderRadius: BorderRadius.circular(10),
                        //           ),
                        //
                        //           child: Center(child: Text('Try AI',
                        //             style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold ),)),
                        //       ),
                        //     ),
                        //   ),
                        // )
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
      ),
    );
  }
}
