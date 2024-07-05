import 'dart:io';

import 'package:flutter/material.dart';
import 'package:likhit/common/widget/const_container.dart';
import 'package:likhit/const/const_height.dart';
import 'package:likhit/const/const_width.dart';
import 'package:likhit/custom/botton.dart';
import 'package:likhit/screens/book%20appointment/appointment_screen.dart';
import 'package:likhit/screens/bottombar/profile.dart';
import 'package:likhit/screens/payment/payment_history.dart';
import 'package:likhit/screens/profile/bar_association.dart';
import 'package:likhit/screens/profile/contact/contact_page.dart';
import 'package:likhit/screens/profile/banking.dart';
import 'package:likhit/service/model/edit_profile.dart';
import 'package:likhit/style/text_style.dart';

import 'bank details/bank_details_screen.dart';
class ProfileDisplayPage extends StatefulWidget {
  final File? image;
  final String userId;
  final String userName;
  final String userAdd;
  final String userAbout;
  final String university;
  final String qualification;
  final String passingyear;
  final String academic;
  final String acadqualification;
  final String acadpasssing;
  final String adviceprice;
  final String documentprice;
  final String caseprice;
  final String officeName;
  final String position;
  final String barstate;
  final String barid;
  final String baradmission;
  final String servicesOffered;
  final String experience;

  const ProfileDisplayPage({
    super.key,
    required this.image,
    required this.userId,
    required this.userName,
    required this.userAdd,
    required this.userAbout,
    required this.university,
    required this.qualification,
    required this.passingyear,
    required this.academic,
    required this.acadqualification,
    required this.acadpasssing,
    required this.experience,
    required this.adviceprice,
    required this.documentprice,
    required this.barid,
    required this.barstate,
    required this.baradmission,
    required this.caseprice,
    required this.officeName,
    required this.position,
    required this.servicesOffered,

  });

  @override
  State<ProfileDisplayPage> createState() => _ProfileDisplayPageState();
}

class _ProfileDisplayPageState extends State<ProfileDisplayPage> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
    editProfile();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text('Lawyer Profile', style: AppTextStyles.kBody15SemiBoldTextStyle,),
      ),
      body: Padding(
        padding: const EdgeInsets.all(11.0),
        child: ListView(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundImage: widget.image != null ? FileImage(widget.image!) : null,
                      ),
                      // const SizedBox(width: 182,),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: InkWell(
                            onTap:(){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileInputPage()));
                            },child: const Icon(Icons.edit, size: 30,)),
                      ),
                    ],
                  ),
                  SizedBox(height: h5),
                  Text(
                    widget.userId,
                    style: AppTextStyles.kBody15SemiBoldTextStyle,
                  ),
                  SizedBox(height: h8,),
                  Column(
                    children: [
                         Text(
                          widget.userName,
                          style: AppTextStyles.kBody15SemiBoldTextStyle,
                        ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        widget.userAdd,
                        style: AppTextStyles.kBody15RegularTextStyle,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          height: h35,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(15),
                          ),
                            child: CustomButton(text: "BANK DETAILS", color: Colors.black, onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => BankDetailsScreen()));
                            },)),
                      ),
                      SizedBox(width: w3 ,),
                      Expanded(
                        child: Container(
                            height: h35,
                            width: 175,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: CustomButton(text: "CONTACT INFO",color: Colors.black, onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const ContactPage()));
                            },)),
                      ),
                    ],
                  ),
                  SizedBox(height: h5,),
                  Row (
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                            height: h35,
                            width: 150,
                            decoration: BoxDecoration(
                              color: Colors.indigo,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: CustomButton(text: "LAWYER KYC",color: Colors.white,  onPressed: (){},)),
                      ),
                      SizedBox(width: w3 ,),
                      Expanded(
                        child: Container(
                            height: h35,
                            width: 192,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: CustomButton(text: "EDIT PROFILE",color: Colors.black, onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) =>  AppointmentScreen()));
                            },)),
                      ),
                    ],
                  ),
                  SizedBox(height: h5,),
                  Text("About Adv ${widget.userName}", style: AppTextStyles.kBody15SemiBoldTextStyle,),
                  SizedBox(height: h7,),
                  Text(
                    widget.userAbout,
                    style: const TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(height: h10,),
                  Text("Services Offered", style: AppTextStyles.kBody15SemiBoldTextStyle,),
                  SizedBox(height: h8,),
                  Container(
                    height: h75,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.search_sharp, size: 30,),
                        SizedBox(width: w8,),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Legal Advice',
                              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Get professional legal\nadvice for your case.',
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ],
                        ),
                        SizedBox(width: w30,),
                        // Text(
                        //   'Starting at ${widget.adviceprice}',
                        //   style: const TextStyle(fontSize: 20.0),
                        // ),
                      ],
                    ),
                  ),
                  SizedBox(height: h8,),
                  Container(
                    height: h75,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.file_copy_sharp, size: 30,),
                        SizedBox(width: w8,),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Document Review',
                              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Have your legal\ndocumnet reviewed by',
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ],
                        ),
                        SizedBox(width: w30,),
                        // Text(
                        //   'Starting at ${widget.documentprice}',
                        //   style: const TextStyle(fontSize: 20.0),
                        // ),
                      ],
                    ),
                  ),
                  SizedBox(height: h8,),
                  Container(
                    height: h75,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.cases_outlined, size: 30,),
                        SizedBox(width: w8,),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Case Review',
                              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Get your legel case\nthroughly reviewed.',
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ],
                        ),
                        SizedBox(width: w50,),
                        // Text(
                        //   'Starting at ${widget.caseprice}',
                        //   style: const TextStyle(fontSize: 20.0),
                        // ),
                      ],
                    ),
                  ),
                  Text("Education & Credentials", style: AppTextStyles.kBody15SemiBoldTextStyle,),
                  SizedBox(height: h8,),
                  Container(
                    height: h45,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.school_outlined, size: 30,),
                        SizedBox(width: w8,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.university,
                              style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              widget.qualification,
                              style: const TextStyle(fontSize: 16.0),
                            ),
                          ],
                        ),
                        SizedBox(width: w60,),
                        Text(
                          widget.passingyear,
                          style: const TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: h5,),
                  Container(
                    height: h45,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.school_outlined, size: 30,),
                        SizedBox(width: w8,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.academic,
                              style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              widget.acadqualification,
                              style: const TextStyle(fontSize: 16.0),
                            ),
                          ],
                        ),
                        SizedBox(width: w60,),
                        Text(
                          widget.acadpasssing,
                          style: const TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: h7,),
                  Text("Language Spoken", style: AppTextStyles.kBody15SemiBoldTextStyle,),
                  Text("Language Written", style: AppTextStyles.kBody15SemiBoldTextStyle,),
                  Text("Experience", style: AppTextStyles.kBody15SemiBoldTextStyle,),
                  SizedBox(height: h8,),
                  Container(
                    height: h35,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.star_border, size: 30,),
                        SizedBox(width: w8,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.university,
                              style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              widget.qualification,
                              style: const TextStyle(fontSize: 16.0),
                            ),
                          ],
                        ),
                        SizedBox(width: w60,),
                        Text(
                          widget.passingyear,
                          style: const TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: h8,),
                  Container(
                    height: h45,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.star_border, size: 30,),
                        SizedBox(width: w8,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.university,
                              style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              widget.qualification,
                              style: const TextStyle(fontSize: 16.0),
                            ),
                          ],
                        ),
                        SizedBox(width: w60,),
                        Text(
                          widget.passingyear,
                          style: const TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                  ),
                  Text("Client Review", style: AppTextStyles.kBody15SemiBoldTextStyle,),

                  // Text(
                  //   'Education: $education',
                  //   style: TextStyle(fontSize: 18.0),
                  // ),

                  const SizedBox(height: 10.0),
                  ConstantContainer(
                   child:TabBar(
                       indicatorColor: Colors.white,
                       labelColor: Colors.blue,
                       controller: tabController,
                       isScrollable: true,
                       tabs: const[
                         Tab(text: "Banking",),
                         Tab(text: "Bar Association",),
                       ]),

                 ),
                  SizedBox(
                    height: 300,
                    child: TabBarView(
                      controller: tabController,
                      children:  const [
                        Banking(),
                        BarAssociation(
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}