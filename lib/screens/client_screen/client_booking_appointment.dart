import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:likhit/custom/botton.dart';
import 'package:likhit/routes/routes.dart';
import 'package:likhit/screens/client_screen/services/controller/client_api_controller.dart';
import 'package:likhit/style/color.dart';

import '../../common/widget/const_container.dart';
import '../../const/const_height.dart';
import '../../const/const_width.dart';
import '../profile/widget/profile_card.dart';

class ClientBookingAppointment extends StatefulWidget {
  const ClientBookingAppointment({super.key});

  @override
  State<ClientBookingAppointment> createState() =>
      _ClientBookingAppointmentState();
}

class _ClientBookingAppointmentState extends State<ClientBookingAppointment>
    with SingleTickerProviderStateMixin {
  ClientApiController controller = Get.put(ClientApiController());
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
      body: Obx(() => Padding(
            padding: const EdgeInsets.all(11.0),
            child: ListView(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: w50,
                        backgroundColor: Colors.transparent,
                        // Ensure CircleAvatar is transparent
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: ClipOval(
                            child: Image.network(
                              controller
                                  .lawyerBookDetailListData.value.data!.image
                                  .toString(),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      constText12SemiBold(
                        text: controller
                            .lawyerBookDetailListData.value.data?.dob
                            .toString(),
                      ),
                      constText12SemiBold(
                          text:
                              "NFC id ${controller.lawyerBookDetailListData.value.data?.nfcid.toString()}"),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          constText12SemiBold(
                              text: controller
                                  .lawyerBookDetailListData.value.data?.name
                                  ?.toString()),
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
                                  Get.toNamed(
                                      ApplicationPages.bookAppointmentsPage);
                                },
                              )),
                        ],
                      ),
                      SizedBox(height: h10),
                      constText15SemiBold(text: "About Advocate"),
                      Text(controller.lawyerBookDetailListData.value.data!.about
                          .toString()),
                      SizedBox(height: h10),
                      constText15SemiBold(text: "Services Offered"),

                      ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.lawyerBookDetailListData.value
                              .data?.fees?.length,
                          itemBuilder: (context, index) {
                            var servicesOfferData = controller
                                .lawyerBookDetailListData
                                .value
                                .data
                                ?.fees?[index];
                            return servicesOffer(
                                title: servicesOfferData?.title.toString(),
                                subtitle:
                                    servicesOfferData?.subtitle.toString(),
                                fees: servicesOfferData?.fee.toString());
                          }),
                      constText15SemiBold(text: "Specialities"),
                      Container(
                        child: GridView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisExtent: h40,
                                    crossAxisSpacing: w8,
                                    mainAxisSpacing: w5),
                            itemCount: controller.lawyerBookDetailListData.value
                                .data?.specialties?.length,
                            itemBuilder: (context, index) {
                              var specialitiesData = controller
                                  .lawyerBookDetailListData
                                  .value
                                  .data
                                  ?.specialties?[index];
                              return specialitiesCard(
                                  text: specialitiesData.toString());
                            }),
                      ),

                      //todo experience
                      constText15SemiBold(text: "Experience"),
                      Text(controller
                          .lawyerBookDetailListData.value.data!.experience
                          .toString()),

                      // todo education 5 july
                      ListTile(
                        title: constText15SemiBold(
                            text: "Education & Credentials"),
                      ),
                      SizedBox(
                          child: ListView.builder(
                              itemCount: controller.lawyerBookDetailListData
                                  .value.data!.educationCredentials!.length,
                              // itemCount: 2,
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                var educationData = controller
                                    .lawyerBookDetailListData
                                    .value
                                    .data
                                    ?.educationCredentials![index];
                                return customListTile(
                                    title: educationData?.name.toString(),
                                    subtitle: educationData?.title.toString(),
                                    startDate: educationData?.year.toString(),
                                    icon: Icons.school,
                                    onTap: () {});
                              })),

                      // todo experience 5 july
                      constText15SemiBold(text: "Experience"),
                      SizedBox(
                          child: ListView.builder(
                              itemCount: controller.lawyerBookDetailListData
                                  .value.data?.experiences?.length,
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                var experienceData = controller
                                    .lawyerBookDetailListData
                                    .value
                                    .data
                                    ?.experiences?[index];
                                return customListTile(
                                    title: experienceData?.title.toString(),
                                    subtitle:
                                        experienceData?.subtitle.toString(),
                                    startDate:
                                        experienceData?.fromDate.toString(),
                                    endDate: experienceData?.toDate.toString(),
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
          )),
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
  ClientApiController controller = Get.put(ClientApiController());

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
              itemCount:
                  controller.lawyerBookDetailListData.value.data?.barId?.length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var barIdData = controller
                    .lawyerBookDetailListData.value.data?.barId?[index];
                return customListTile(
                    title: barIdData?.state.toString(),
                    subtitle: barIdData?.barId.toString(),
                    icon: Icons.shopping_bag,
                    onTap: () {});
              })),
    );
  }
}
