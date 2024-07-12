import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:likhit/custom/botton.dart';
import 'package:likhit/routes/routes.dart';
import 'package:likhit/style/color.dart';

import '../../common/widget/const_container.dart';
import '../../const/const_height.dart';
import '../../const/const_width.dart';
import '../../const/image_strings.dart';
import '../profile/widget/profile_card.dart';

class ClientBookingAppointment extends StatefulWidget {
  const ClientBookingAppointment({super.key});

  @override
  State<ClientBookingAppointment> createState() =>
      _ClientBookingAppointmentState();
}

class _ClientBookingAppointmentState extends State<ClientBookingAppointment>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: constText15SemiBold(text: "Book Appointment"),
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
                  Hero(
                    tag: 'clientLogo',
                    child: CircleAvatar(
                      radius: w70
                      ,
                      child: Image.asset(clientLogo),
                    ),
                  ),
                  constText12SemiBold(text: "05/08/2024"),
                  constText12SemiBold(text: "NFC id 56789120"),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      constText12SemiBold(text: 'Shreyansh Tripathi'),
                      SizedBox(
                        height: h15,
                      ),
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(h15),
                          ),
                          child: CustomButton(
                            backgroundFalse: true,
                            backgroundColor: AppColors.white101,
                            text: "BOOK APPOINTMENT",
                            color: Colors.white,
                            onPressed: () {
                              //todo
                              Get.toNamed(ApplicationPages.bookAppointmentsPage);
                            },
                          )),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  constText15SemiBold(text: "About Advocate"),
                  Text(
                      'These steps should help you resolve the issue. If the problem persists, providing more context or code snippets around the Calendar component and its usage might help in giving a more precise solution.'),
                  ListTile(
                    title: constText15SemiBold(text: "Services Offered"),
                  ),

                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        // return servicesOffer();
                        return servicesOffer();
                      }),
                  constText15SemiBold(text: "Specialities"),
                  Container(
                    child: GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisExtent: h40,
                            crossAxisSpacing: w8,
                            mainAxisSpacing: w5),
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return specialitiesCard(text: 'Domestic Violence');
                        }),
                  ),

                  //todo experience
                  constText15SemiBold(text: "Experience"),
                  Text(
                      'These steps should help you resolve the issue. If the problem persists, providing more context or code snippets around the Calendar component and its usage might help in giving a more precise solution.'),

                  // todo education 5 july
                  ListTile(
                    title: constText15SemiBold(text: "Education & Credentials"),
                  ),
                  SizedBox(
                      child: ListView.builder(
                          itemCount: 2,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return customListTile(
                                title: 'Lucknow University',
                                subtitle: "B.Tech",
                                date: "2024",
                                icon: Icons.school,
                                onTap: () {});
                          })),

                  //todo experience 5 july
                  constText15SemiBold(text: "Experience"),
                  SizedBox(
                      child: ListView.builder(
                          itemCount: 2,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return customListTile(
                                title: 'Criminal Experience',
                                subtitle: "Best Criminal lawyer Experience",
                                date: "2022 - Present",
                                icon: Icons.star_border,
                                onTap: () {});
                          })),

                  constText15SemiBold(text: "Client Review"),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return clientReview();
                      }),

                  const SizedBox(height: 10.0),
                  ConstantContainer(
                    child: TabBar(
                        indicatorColor: Colors.white,
                        labelColor: Colors.blue,
                        controller: tabController,
                        isScrollable: true,
                        tabs: const [
                          Tab(
                            text: "Bar Association",
                          ),
                        ]),
                  ),
                  SizedBox(
                    height: 300,
                    child: TabBarView(
                      controller: tabController,
                      children: const [
                        ClientBookingBarAssociation(),
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

// todo User profile Bar association
class ClientBookingBarAssociation extends StatefulWidget {
  const ClientBookingBarAssociation({
    super.key,
  });

  @override
  State<ClientBookingBarAssociation> createState() =>
      _ClientBookingBarAssociationState();
}

class _ClientBookingBarAssociationState
    extends State<ClientBookingBarAssociation> {
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
      body: SizedBox(
          child: ListView.builder(
              itemCount: 5,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return customListTile(
                    title: 'Bar Id',
                    subtitle: "123456",
                    icon: Icons.shopping_bag,
                    onTap: () {});
              })),
    );
  }
}
