import 'package:flutter/material.dart';
import 'package:likhit/screens/payment/payLawyer.dart';

class PaymentHistory extends StatefulWidget {
  const PaymentHistory({super.key});

  @override
  State<PaymentHistory> createState() => _InboxState();
}

class _InboxState extends State<PaymentHistory> {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              Center(
                child: Text("Payment history",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
              ),
              SizedBox(width: 170,),
              InkWell(onTap:(){},child: Icon(Icons.settings)),
            ],
          ),
        ),
        body: Container(
          child: Column(
            children: [
              Column(
                children: [
                  Container(
                    height: 80,
                    width: 370,
                    decoration: BoxDecoration(
                      color: Colors.white54,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Invoice 1. 24/7/23 . Paid',
                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                Row(
                                  children: [
                                    Icon(Icons.currency_rupee,size: 18,),
                                    Text('500 . Paid . Lawyer1 - Name & User ID', style: TextStyle(fontSize: 18,),),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 25,),
                          Icon(Icons.circle, color: Colors.green, size: 14,),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 2,),
                  Container(
                    height: 80,
                    width: 370,
                    decoration: BoxDecoration(
                      color: Colors.white54,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Invoice 1. 24/7/23 . Paid',
                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                Row(
                                  children: [
                                    Icon(Icons.currency_rupee,size: 18,),
                                    Text('500 . Paid . Lawyer1 - Name & User ID', style: TextStyle(fontSize: 18,),),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 25,),
                          Icon(Icons.circle, color: Colors.green, size: 14,),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 2,),
                  Container(
                    height: 80,
                    width: 370,
                    decoration: BoxDecoration(
                      color: Colors.white54,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Invoice 1. 24/7/23 . Paid',
                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                Row(
                                  children: [
                                    Icon(Icons.currency_rupee,size: 18,),
                                    Text('500 . Paid . Lawyer1 - Name & User ID', style: TextStyle(fontSize: 18,),),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 25,),
                          Icon(Icons.circle, color: Colors.green, size: 14,),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    InkWell(onTap:(){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PayLawyer()),
                      );
                    },
                      child: Container(
                          height: 40, width: 370,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(15)
                          ),
                          child: Center(child: Text('New Payment',
                            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),))),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
  }
}
