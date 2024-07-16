import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart' as FlutterRatingBar;
import 'package:get/get.dart';
import 'package:likhit/const/image_strings.dart';
import 'package:likhit/custom/botton.dart';
import 'package:likhit/routes/routes.dart';
import 'package:likhit/screens/client_screen/services/controller/client_api_controller.dart';
import 'package:likhit/style/color.dart';

import '../../common/widget/const_container.dart';
import '../../common/widget/const_text_field.dart';
import '../../common/widget/custom_app_bar.dart';
import '../../const/const_height.dart';
import '../../const/const_width.dart';
import '../../style/text_style.dart';
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
      appBar: const CustomAppBar(
        title: "Book Appointment",
      ),
      body: Obx(() {
        if (controller.lawyerBookDetailListData.value.data == null) {
          return const Center(child: CircularProgressIndicator());
        }
        return Padding(
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
                            controller.lawyerBookDetailListData.value.data!
                                        .image ==
                                    null
                                ? errorHandleImage
                                : controller
                                    .lawyerBookDetailListData.value.data!.image
                                    .toString(),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    constText12SemiBold(
                      text: controller.lawyerBookDetailListData.value.data?.dob
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
                        itemCount: controller
                            .lawyerBookDetailListData.value.data?.fees?.length,
                        itemBuilder: (context, index) {
                          var servicesOfferData = controller
                              .lawyerBookDetailListData
                              .value
                              .data
                              ?.fees?[index];
                          return servicesOffer(
                              title: servicesOfferData?.title.toString(),
                              subtitle: servicesOfferData?.subtitle.toString(),
                              fees: servicesOfferData?.fee.toString());
                        }),
                    constText15SemiBold(text: "Specialities"),
                    GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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

                    //todo experience
                    constText15SemiBold(text: "Experience"),
                    Text(controller
                        .lawyerBookDetailListData.value.data!.experience
                        .toString()),

                    // todo education 5 july
                    ListTile(
                      title:
                          constText15SemiBold(text: "Education & Credentials"),
                    ),
                    SizedBox(
                        child: ListView.builder(
                            itemCount: controller.lawyerBookDetailListData.value
                                .data!.educationCredentials!.length,
                            // itemCount: 2,
                            physics: const NeverScrollableScrollPhysics(),
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
                            itemCount: controller.lawyerBookDetailListData.value
                                .data?.experiences?.length,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              var experienceData = controller
                                  .lawyerBookDetailListData
                                  .value
                                  .data
                                  ?.experiences?[index];
                              return customListTile(
                                  title: experienceData?.title.toString(),
                                  subtitle: experienceData?.subtitle.toString(),
                                  startDate:
                                      experienceData?.fromDate.toString(),
                                  endDate: experienceData?.toDate.toString(),
                                  icon: Icons.star_border,
                                  onTap: () {});
                            })),

                    ListTile(
                      title: constText15SemiBold(text: "Client Review"),
                      trailing: IconButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    contentPadding: EdgeInsets.zero,
                                    title: Center(
                                      child: Text(
                                        'Give Review',
                                        style: AppTextStyles
                                            .kBody15SemiBoldTextStyle,
                                      ),
                                    ),
                                    actions: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Divider(),
                                          constText12SemiBold(text: "Rating"),

                                          //todo rating bar
                                          FlutterRatingBar.RatingBar.builder(
                                            // ignoreGestures: true,
                                            itemSize: h25,
                                            initialRating: 0,
                                            minRating: 1,
                                            // direction: Axis.horizontal,
                                            // allowHalfRating: true,
                                            itemCount: 5,
                                            itemPadding: EdgeInsets.symmetric(
                                                horizontal: h3),
                                            itemBuilder: (context, _) =>
                                                const Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            onRatingUpdate: (rating) {
                                              controller.ratingController
                                                  .value = rating;
                                            },
                                          ),

                                          constText12SemiBold(text: "Review"),
                                          ConstTextField(
                                            maxLine: 2,
                                            controller: controller
                                                .commentController.value,
                                            hintText: "Write Review",
                                          ),
                                          const Divider(),
                                          SizedBox(
                                            width: double.maxFinite,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                MyCustomButton(
                                                  onTap: () {
                                                    Get.back();
                                                  },
                                                  color: Colors.grey,
                                                  text: "Cancel",
                                                ),
                                                const Text("  "),
                                                MyCustomButton(
                                                  onTap: () {
                                                    controller.postReview(controller
                                                        .lawyerBookDetailListData
                                                        .value
                                                        .data
                                                        ?.id);
                                                    controller
                                                        .lawyerBookDetailFetch();
                                                    Get.back();
                                                  },
                                                  color: AppColors.info80,
                                                  text: "Save",
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  );
                                });
                          },
                          icon: const Icon(
                            Icons.reviews_outlined,
                          )),
                    ),

                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.lawyerBookDetailListData.value
                            .data?.reviews?.length,
                        itemBuilder: (context, index) {
                          var review = controller
                              .lawyerBookDetailListData.value.data?.reviews;
                          return Column(
                            children: [
                              clientReview(
                                  userName: review?[index].userName,
                                  date: review?[index].isCreated,
                                  comment: review?[index].comment,
                                  star: review![index].rating,
                                  like: review[index].likeCount,
                                  likeTap: () {
                                    controller.postLike(
                                        reviewID: review[index].id,
                                        lawyerID: controller
                                            .lawyerBookDetailListData
                                            .value
                                            .data
                                            ?.id);
                                  },
                                  dislike: review[index].dislikeCount,
                                  dislikeTap: () {
                                    controller.postDislike(
                                        reviewID: review[index].id,
                                        lawyerID: controller
                                            .lawyerBookDetailListData
                                            .value
                                            .data
                                            ?.id);
                                  }),
                            ],
                          );
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
        );
      }),
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
              physics: const NeverScrollableScrollPhysics(),
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
