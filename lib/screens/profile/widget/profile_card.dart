import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:likhit/const/const_height.dart';
import 'package:likhit/style/color.dart';

import '../../../style/text_style.dart';

Widget specialitiesCard(){
  return Card(
    color: AppColors.white101,
    child: Center(child: Text('English')),
  );
}

Widget customListTile({
  String? title,
  String? subtitle,
  String? date,
  IconData? icon,
  Function()? onTap,
  bool? visibility ,

}){
  return ListTile(
    contentPadding: EdgeInsets.only(left: h5),
    leading: Visibility(
      visible: visibility ?? true,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(h5),
          color: AppColors.white101
        ),
        child: IconButton(onPressed: onTap, icon: Icon(icon, color: AppColors.white100,)).marginAll(h2),),
    ),
    title: Container(child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title??'',style: AppTextStyles.kCaption12RegularTextStyle,),
        Text(subtitle??'', style: AppTextStyles.kSmall8RegularTextStyle.copyWith(fontSize: h10, color: Colors.grey.shade800),),
      ],
    ),),
    trailing: Container(child: Text(date??'',style: AppTextStyles.kSmall10RegularTextStyle,),),
  );
}

Widget chooseFileContainer(
{Function()? onTap,
  String? imageText
}
    ){
  return Container(
    margin: EdgeInsets.only(left: h5,right: h5),
    padding: EdgeInsets.only(top: h10,bottom: h10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(h5),
      border: Border.all(color: Colors.black)
    ),
   child: Row(children: [
     InkWell(
       onTap: onTap,
       child: Container(
         margin: EdgeInsets.only(left: h8, right: h8),
         padding: EdgeInsets.all(h5),
         decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(h5),
           border: Border.all(color: Colors.black),
           color: Colors.grey.shade300
         ),
         child: Text("Choose file"),
       ),
     ),
     Expanded(
       child: Text(imageText??'',
       maxLines: 1,
       softWrap: true,
       overflow: TextOverflow.ellipsis,),
     )
   ],),
  );
}

Widget constText15SemiBold({String? text}){
  return Container(
    margin: EdgeInsets.only(top: h8, bottom: h8, ),
    child: Text(text??'', style: AppTextStyles.kBody15SemiBoldTextStyle,),
  );
}

Widget constText12SemiBold({String? text}){
  return Container(
    margin: EdgeInsets.only(top: h8, left: h5 ),
    child: Text(text??'', style: AppTextStyles.kCaption12SemiBoldTextStyle,),
  );
}

Widget servicesOffer(){
  return Container(
    child: ListTile(
      title: SizedBox(
        width: h50,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Legal Documentation',style: AppTextStyles.kCaption12RegularTextStyle,),
            Text('best lawyer in the word',style: AppTextStyles.kSmall8RegularTextStyle,)
          ],
        ),
      ),
      trailing: Column(
        children: [
          Text('Starting at '),
          Text('Rs. 500'),
        ],
      ),
    ),
  );
}

Widget clientReview(){
  return Container(
    // width: Get.width * 0.05,
    // width: 200,
    margin: EdgeInsets.only(bottom: h20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Client@gmail.com'),
        Text('Jun 4, 2024'),
        Row(
          children: [
            Icon(Icons.star),
            Icon(Icons.star),
            Icon(Icons.star),
            Icon(Icons.star),
            Icon(Icons.star_border),
          ],
        ),
        Text('Deffersx'),
        Row(
          children: [
          Icon(Icons.thumb_up_alt_outlined),
          SizedBox(width: h30,),
          Icon(Icons.thumb_down_alt_outlined),
        ],)
      ],
    ),
  );
}


class MyCustomButton extends StatelessWidget {
  final Color color;
  final VoidCallback onTap;
  final String text;
  const MyCustomButton({super.key, required this.color, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(color)),
        child: Text(text,style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
        ),));
  }
}
