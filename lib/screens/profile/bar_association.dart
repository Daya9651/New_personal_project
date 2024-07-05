
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:likhit/style/text_style.dart';

import '../../service/api_url.dart';

class BarAssociation extends StatefulWidget {


    const BarAssociation({super.key,

  });

  @override
  State<BarAssociation> createState() => _BarAssociationState();
}

class _BarAssociationState extends State<BarAssociation> {
  @override
  void initState() {
    // EmailService().barAssociation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   title: Text("Bar Association"),
      // ),
      body: ListView.builder(
        itemCount: 1, // Number of items in your list
        itemBuilder: (BuildContext context, int index,) {
          return Column(
            children: [
              SizedBox(
                height: Get.height / 2.1,
                width: Get.width,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(Icons.shopping_bag, size: 30,),
                        const SizedBox(width: 20,),
                        Column(
                          children: [
                            Text('Bar Id',style: AppTextStyles.kBody15SemiBoldTextStyle,),
                            Text('12345',style: AppTextStyles.kCaption12RegularTextStyle,),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(Icons.network_cell, size: 30,),
                        const SizedBox(width: 20,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Preferred Court',style: AppTextStyles.kBody15SemiBoldTextStyle,),
                            const SizedBox(width: 20,),
                            Text('High Court',style: AppTextStyles.kCaption12RegularTextStyle,),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(Icons.ballot_rounded, size: 30,),
                        const SizedBox(width: 20,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Bar Association',style: AppTextStyles.kBody15SemiBoldTextStyle,),
                            Text('Maharashtra Bar Association ',style: AppTextStyles.kCaption12RegularTextStyle,),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 15,),
                    Container(
                      height: 180,
                      color: Colors.indigo,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Let's agree to Likhit De", style: AppTextStyles.kBody20SemiBoldTextStyle.copyWith(color: Colors.white),),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

