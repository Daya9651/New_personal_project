// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:likhit/common/widget/const_container.dart';
// import 'package:likhit/const/const_height.dart';
// import 'package:likhit/const/const_width.dart';
// import 'package:likhit/custom/botton.dart';
// import 'package:likhit/screens/bottombar/profile.dart';
// import 'package:likhit/screens/payment/payment_history.dart';
// import 'package:likhit/screens/profile/banking.dart';
// import 'package:likhit/screens/profile/bar_association.dart';
// import 'package:likhit/screens/profile/contact/contact_page.dart';
// import 'package:likhit/screens/profile/controller/lawyer_profile_controller_inside.dart';
// import 'package:likhit/screens/profile/widget/profile_card.dart';
// import 'package:likhit/service/model/edit_profile.dart';
// import 'package:likhit/style/color.dart';
// import 'package:likhit/style/text_style.dart';
//
// import '../../common/widget/const_text_field.dart';
// import 'lawyer_edit_profile.dart';
// import 'lawyer_kyc_page.dart';
//
// class ProfileDisplayPage extends StatefulWidget {
//
//
//   const ProfileDisplayPage({
//     super.key,
//
//   });
//
//   @override
//   State<ProfileDisplayPage> createState() => _ProfileDisplayPageState();
// }
//
// class _ProfileDisplayPageState extends State<ProfileDisplayPage>
//     with SingleTickerProviderStateMixin {
//   late TabController tabController;
//
//   LawyerProfileController controller = Get.put(LawyerProfileController());
//
//   @override
//   void initState() {
//     tabController = TabController(length: 2, vsync: this);
//     super.initState();
//     editProfile();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         automaticallyImplyLeading: false,
//         title: Text(
//           'Lawyer Profile',
//           style: AppTextStyles.kBody17SemiBoldTextStyle,
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(11.0),
//         child: ListView(
//           children: [
//             SingleChildScrollView(
//               scrollDirection: Axis.vertical,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     children: [
//                       CircleAvatar(
//                         radius: 60,
//                         backgroundImage: widget.image != null
//                             ? FileImage(widget.image!)
//                             : null,
//                       ),
//                       const SizedBox(
//                         width: 182,
//                       ),
//                       InkWell(
//                           onTap: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => ProfileInputPage()));
//                           },
//                           child: const Icon(
//                             Icons.edit,
//                             size: 35,
//                           ))
//                     ],
//                   ),
//                   SizedBox(height: h5),
//                   Text(
//                     widget.userId,
//                     style: AppTextStyles.kBody15SemiBoldTextStyle,
//                   ),
//                   SizedBox(
//                     height: h8,
//                   ),
//                   Column(
//                     children: [
//                       Text(
//                         widget.userName,
//                         style: AppTextStyles.kBody15SemiBoldTextStyle,
//                       ),
//                     ],
//                   ),
//                   Column(
//                     children: [
//                       Text(
//                         widget.userAdd,
//                         style: AppTextStyles.kBody15RegularTextStyle,
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 10.0),
//                   Row(
//                     children: [
//                       Expanded(
//                         child: Container(
//                             height: h35,
//                             width: 150,
//                             decoration: BoxDecoration(
//                               color: AppColors.white101,
//                               borderRadius: BorderRadius.circular(15),
//                             ),
//                             child: CustomButton(
//                               text: "BANK DETAILS",
//                               color: Colors.black,
//                               onPressed: () {
//                                 Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) =>
//                                             const PaymentHistory()));
//                               },
//                             )),
//                       ),
//                       SizedBox(
//                         width: w3,
//                       ),
//                       Expanded(
//                         child: Container(
//                             height: h35,
//                             width: 175,
//                             decoration: BoxDecoration(
//                               color: AppColors.white101,
//                               borderRadius: BorderRadius.circular(15),
//                             ),
//                             child: CustomButton(
//                               text: "CONTACT INFO",
//                               color: Colors.black,
//                               onPressed: () {
//                                 Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) =>
//                                             const ContactPage()));
//                               },
//                             )),
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: h5,
//                   ),
//                   Row(
//                     children: [
//                       Expanded(
//                         child: Container(
//                             height: h35,
//                             width: 150,
//                             decoration: BoxDecoration(
//                               color: Colors.indigo,
//                               borderRadius: BorderRadius.circular(15),
//                             ),
//                             child: CustomButton(
//                               text: "LAWYER KYC",
//                               color: Colors.white,
//                               onPressed: () {
//                                 Get.to(LawyerKycPage());
//                               },
//                             )),
//                       ),
//                       SizedBox(
//                         width: w3,
//                       ),
//                       Expanded(
//                         child: Container(
//                             height: h35,
//                             width: 192,
//                             decoration: BoxDecoration(
//                               color: AppColors.white101,
//                               borderRadius: BorderRadius.circular(15),
//                             ),
//                             child: CustomButton(
//                               text: "EDIT PROFILE",
//                               color: Colors.black,
//                               onPressed: () {
//                                 Get.to(LawyerEditProfile());
//                               },
//                             )),
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: h5,
//                   ),
//                   Text(
//                     "About Adv ${widget.userName}",
//                     style: AppTextStyles.kBody15SemiBoldTextStyle,
//                   ),
//                   SizedBox(
//                     height: h7,
//                   ),
//                   Text(
//                     widget.userAbout,
//                     style: const TextStyle(fontSize: 18.0),
//                   ),
//                   SizedBox(
//                     height: h10,
//                   ),
//                   ListTile(
//                     title: constText15SemiBold(text: "Services Offered"),
//                     trailing: IconButton(
//                         onPressed: () {
//                           showDialog(
//                               context: context,
//                               builder: (BuildContext context) {
//                                 return AlertDialog(
//                                   contentPadding: EdgeInsets.zero,
//                                   title: Center(
//                                     child: Text(
//                                       'Add Services',
//                                       style: AppTextStyles
//                                           .kBody15SemiBoldTextStyle,
//                                     ),
//                                   ),
//                                   actions: [
//                                     Container(
//                                       child: Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           Divider(),
//                                           constText12SemiBold(text: "Name"),
//                                           ConstTextField(
//                                             controller: controller
//                                                 .titleController.value,
//                                             hintText: "Enter Title",
//                                           ),
//                                           constText12SemiBold(
//                                               text: "Sub Title"),
//                                           ConstTextField(
//                                             controller: controller
//                                                 .subtitleController.value,
//                                             hintText: "Enter Sub Title",
//                                           ),
//                                           constText12SemiBold(text: "Fees"),
//                                           ConstTextField(
//                                             controller:
//                                                 controller.feesController.value,
//                                             hintText: "Enter Fees",
//                                           ),
//                                           Divider(),
//                                           SizedBox(
//                                             width: double.maxFinite,
//                                             child: Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.end,
//                                               children: [
//                                                 MyCustomButton(
//                                                   onTap: () {
//                                                     Get.back();
//                                                   },
//                                                   color: Colors.grey,
//                                                   text: "Cancel",
//                                                 ),
//                                                 const Text("  "),
//                                                 MyCustomButton(
//                                                   onTap: () {},
//                                                   color: AppColors.info80,
//                                                   text: "Save",
//                                                 )
//                                               ],
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     )
//                                   ],
//                                 );
//                               });
//                         },
//                         icon: Icon(
//                           Icons.edit,
//                         )),
//                   ),
//
//                   ListView.builder(
//                       physics: const NeverScrollableScrollPhysics(),
//                       shrinkWrap: true,
//                       itemCount: 6,
//                       itemBuilder: (context, index) {
//                         // return servicesOffer();
//                         return servicesOffer();
//                       }),
//                   constText15SemiBold(text: "Specialities"),
//                   Container(
//                     child: GridView.builder(
//                         shrinkWrap: true,
//                         physics: NeverScrollableScrollPhysics(),
//                         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                             crossAxisCount: 2,
//                             mainAxisExtent: h40,
//                             crossAxisSpacing: w8,
//                             mainAxisSpacing: w5),
//                         itemCount: 5,
//                         itemBuilder: (context, index) {
//                           return specialitiesCard();
//                         }),
//                   ),
//
//                   // todo education 5 july
//                   ListTile(
//                     title: constText15SemiBold(text: "Education & Credentials"),
//                     trailing: IconButton(
//                         onPressed: () {
//                           showDialog(
//                               context: context,
//                               builder: (BuildContext context) {
//                                 return AlertDialog(
//                                   contentPadding: EdgeInsets.zero,
//                                   title: Center(
//                                     child: Text(
//                                       'Add Education',
//                                       style: AppTextStyles
//                                           .kBody15SemiBoldTextStyle,
//                                     ),
//                                   ),
//                                   actions: [
//                                     Container(
//                                       child: Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           Divider(),
//                                           constText12SemiBold(
//                                               text: "University/Collage"),
//                                           ConstTextField(
//                                             hintText: "Enter Your University",
//                                           ),
//                                           constText12SemiBold(text: " Course"),
//                                           ConstTextField(
//                                             hintText: "Enter Course",
//                                           ),
//                                           constText12SemiBold(text: "Years"),
//                                           ConstTextField(),
//                                           Divider(),
//                                           SizedBox(
//                                             width: double.maxFinite,
//                                             child: Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.end,
//                                               children: [
//                                                 MyCustomButton(
//                                                   onTap: () {
//                                                     Get.back();
//                                                   },
//                                                   color: Colors.grey,
//                                                   text: "Cancel",
//                                                 ),
//                                                 const Text("  "),
//                                                 MyCustomButton(
//                                                   onTap: () {},
//                                                   color: AppColors.info80,
//                                                   text: "Save",
//                                                 )
//                                               ],
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     )
//                                   ],
//                                 );
//                               });
//                         },
//                         icon: Icon(
//                           Icons.edit,
//                         )),
//                   ),
//                   SizedBox(
//                       child: ListView.builder(
//                           itemCount: 2,
//                           physics: NeverScrollableScrollPhysics(),
//                           shrinkWrap: true,
//                           itemBuilder: (context, index) {
//                             return customListTile(
//                                 title: 'Lucknow University',
//                                 subtitle: "B.Tech",
//                                 date: "2024",
//                                 icon: Icons.school,
//                                 onTap: () {});
//                           })),
//                   SizedBox(
//                     child: customListTile(
//                         title: 'IIT Kanpur',
//                         subtitle: "M.Tech",
//                         date: "2024",
//                         icon: Icons.school,
//                         onTap: () {}),
//                   ),
//
//                   //todo language spoken 5 july
//                   constText15SemiBold(text: "Language Spoken"),
//                   Container(
//                     child: GridView.builder(
//                         shrinkWrap: true,
//                         physics: NeverScrollableScrollPhysics(),
//                         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                             crossAxisCount: 2,
//                             mainAxisExtent: h40,
//                             crossAxisSpacing: w8,
//                             mainAxisSpacing: w5),
//                         itemCount: 3,
//                         itemBuilder: (context, index) {
//                           return specialitiesCard();
//                         }),
//                   ),
//                   constText15SemiBold(text: "Written Language"),
//                   Container(
//                     child: GridView.builder(
//                         shrinkWrap: true,
//                         physics: NeverScrollableScrollPhysics(),
//                         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                             crossAxisCount: 2,
//                             mainAxisExtent: h40,
//                             crossAxisSpacing: w8,
//                             mainAxisSpacing: w5),
//                         itemCount: 4,
//                         itemBuilder: (context, index) {
//                           return specialitiesCard(text: 'English');
//                         }),
//                   ),
//
//                   //todo experience 5 july
//                   constText15SemiBold(text: "Experience"),
//                   SizedBox(
//                       child: ListView.builder(
//                           itemCount: 2,
//                           physics: NeverScrollableScrollPhysics(),
//                           shrinkWrap: true,
//                           itemBuilder: (context, index) {
//                             return customListTile(
//                                 title: 'Criminal Experience',
//                                 subtitle: "Best Criminal lawyer Experience",
//                                 date: "2022 - Present",
//                                 icon: Icons.star_border,
//                                 onTap: () {});
//                           })),
//                   SizedBox(
//                     child: customListTile(
//                         title: 'Criminal Experience',
//                         subtitle: "Best Criminal lawyer Experience",
//                         date: "2022 - Present",
//                         icon: Icons.star_border,
//                         onTap: () {}),
//                   ),
//                   SizedBox(
//                     child: customListTile(
//                         title: 'XYX',
//                         subtitle: "Handle Company Cases ",
//                         date: "2024 - Present",
//                         icon: Icons.star_border,
//                         onTap: () {}),
//                   ),
//
//                   constText15SemiBold(text: "Client Review"),
//                   ListView.builder(
//                       shrinkWrap: true,
//                       physics: NeverScrollableScrollPhysics(),
//                       itemCount: 3,
//                       itemBuilder: (context, index) {
//                         return clientReview();
//                       }),
//
//                   // Text(
//                   //   'Education: $education',
//                   //   style: TextStyle(fontSize: 18.0),
//                   // ),
//
//                   const SizedBox(height: 10.0),
//                   ConstantContainer(
//                     child: TabBar(
//                         indicatorColor: Colors.white,
//                         labelColor: Colors.blue,
//                         controller: tabController,
//                         isScrollable: true,
//                         tabs: const [
//                           Tab(
//                             text: "Banking",
//                           ),
//                           Tab(
//                             text: "Bar Association",
//                           ),
//                         ]),
//                   ),
//                   SizedBox(
//                     height: 300,
//                     child: TabBarView(
//                       controller: tabController,
//                       children: const [
//                         Banking(),
//                         BarAssociation(),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
