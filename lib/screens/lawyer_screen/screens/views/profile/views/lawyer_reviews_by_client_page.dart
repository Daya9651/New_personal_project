import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:likhit/common/widget/const_shimmer_effects.dart';
import 'package:likhit/common/widget/const_text_with_styles.dart';
import 'package:likhit/common/widget/custom_app_bar.dart';
import 'package:likhit/screens/lawyer_screen/screens/controllers/lawyer_profile_controller.dart';
import 'package:likhit/style/color.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../common/widget/const_rating_page.dart';

class LawyerReviewsByClientPage extends GetView<LawyerProfileController> {
  const LawyerReviewsByClientPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args = Get.arguments ?? {};
    final int lawyerId = args['lawyerId'] ?? 0;
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Client Reviews",
      ),
      body:Obx(()=>controller.isLoading.value?Shimmer.fromColors(
        baseColor: baseColor,
        highlightColor: highLightColor,
        child: loadSke(),
      ) :ListView.builder(
          itemCount: controller.reviewList.value.data?.length,
          itemBuilder: (context,index){
        var reviewList = controller.reviewList.value.data?[index];
        return ListTile(
          leading:CircleAvatar(
            backgroundImage:  NetworkImage(reviewList?.image??''),
          ),
          title: const8TextBold('${reviewList?.userName}'),
          // trailing: const8Text('${reviewList?.isCreated}'),
          // trailing: const6Text(formatDateTime(DateTime.parse(reviewList?.isCreated??""))),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const8Text('${reviewList?.comment}'),
              RatingBarWidget(
                initialRating: double.tryParse('${reviewList?.rating}')??0 ,

              ),


         Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
               IconButton(

                  icon: Icon(
                    reviewList?.likeDisLikeStatus=="Like" ? Icons.thumb_up : Icons.thumb_up_outlined,
                    color: reviewList?.likeDisLikeStatus=="Like" ? Colors.blue : Colors.grey,
                  ),
                  onPressed: () {
                    controller.reviewLike(reviewList?.id??0);
                    controller.toggleLike(index);
                    controller.getReviews(lawyerId);

              }),
              const6Text("${reviewList?.likeCount}"),
                 IconButton(
                  icon: Icon(
                    reviewList?.likeDisLikeStatus=="Dislike" ? Icons.thumb_down : Icons.thumb_down_outlined,
                    color:  reviewList?.likeDisLikeStatus=="Dislike" ? Colors.red : Colors.grey,
                  ),
                  onPressed: () {
                    controller.reviewDisLike(reviewList?.id??0);
                    controller.toggleDislike(index);
                    controller.getReviews(lawyerId);

              }),
              const6Text("${reviewList?.dislikeCount}"),
            ],
          )
            ],
          ),

        );
      })),
    );
  }
}
