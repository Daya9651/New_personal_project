import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:likhit/common/widget/const_container.dart';
import 'package:likhit/common/widget/const_dropdown.dart';
import 'package:likhit/common/widget/const_text_field.dart';
import 'package:likhit/custom/datePicker.dart';
import 'package:likhit/style/text_style.dart';

import '../contact info/contact_info_screen.dart';
class ContactPage extends StatefulWidget {
  const ContactPage({super.key});
  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
   late GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Contact Information", style: AppTextStyles.kBody15SemiBoldTextStyle,),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Add phone number ', style: AppTextStyles.kBody15RegularTextStyle,),
              const ConstTextField(hintText: '   91252035XX',),
              Text('Add email ', style: AppTextStyles.kBody15RegularTextStyle,),
              const ConstTextField(hintText: 'harveysector@gmail.com',),
              Text('Add social media profiles', style: AppTextStyles.kBody15RegularTextStyle,),
              const ConstTextField(hintText: 'LinkedIn:/harveyspecter123',),
              const ConstTextField(hintText: 'instagram:/harveyspecter123',),
              const ConstTextField(hintText: 'facebook:/harveyspecter123',),
              Text('Add website ', style: AppTextStyles.kBody15RegularTextStyle,),
              const ConstTextField(hintText: 'User will see your website if you have it set to visible ',),
              Text('Office Location', style: AppTextStyles.kBody17SemiBoldTextStyle,),
              Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
                child: Text('The Regal Theatre, Bombay High Court, Fort Mumbai Maharstra 400032  ',
                style: AppTextStyles.kBody15RegularTextStyle,),
              ),
              // Container(
              //   height: 500,
              //   child: GoogleMap(
              //     onMapCreated: (GoogleMapController controller) {
              //       mapController = controller;
              //     },
              //     initialCameraPosition: CameraPosition(
              //       target: LatLng(37.7749, -122.4194), // San Francisco, CA coordinates
              //       zoom: 12.0,
              //     ),
              //   ),
              Text('Birthday Date', style: AppTextStyles.kBody15RegularTextStyle,),
              CustomDatePicker(
                initialDate: DateTime.now(),
                onDateSelected: (DateTime selectedDate) {
                },
              ),
              Text('Gender', style: AppTextStyles.kBody17SemiBoldTextStyle,),
              ConstantDropdown(options: const ['Male', 'Female'], onChanged: (value) {  },),
              Text('Operating Hours', style: AppTextStyles.kBody17SemiBoldTextStyle,),
              Container(
                width: 365,
                height: 100,
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.only(left: 12,),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
                child: Text('Monday - Friday: 8AM - 5PM.\n Saturday & Sundat : Close',
                  style: AppTextStyles.kBody15RegularTextStyle,),
              ),
              SizedBox(height: 10,),
              ConstantContainer(
                color: Colors.indigo,
                  radiusBorder: 25,
                  child: TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => ContactInfoScreen()),
                    );}, child: Text('Save',
                    style: AppTextStyles.kBody15RegularTextStyle.copyWith(color: Colors.white),))),
            ],
          ),
        ),
      )
    );
  }
}
