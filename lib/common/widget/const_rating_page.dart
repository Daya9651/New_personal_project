import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import '../../const/const_height.dart';
import '../controllers/rating_controller.dart';

class RatingBarWidget extends StatelessWidget {
  final bool edit;
  final double initialRating;

  const RatingBarWidget({
    Key? key,
    this.edit = false,
    this.initialRating = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Initialize RatingController with the initial rating
    final RatingController ratingController = Get.put(RatingController(initialRating));

    return Obx(() {
      return RatingBar.builder(
        itemSize: h30,
        ignoreGestures: !edit,
        initialRating: ratingController.rating.value,
        minRating: 1,
        direction: Axis.horizontal,
        allowHalfRating: true,
        itemCount: 5,
        itemBuilder: (context, _) => const Icon(
          Icons.star,
          color: Colors.amber,
        ),
        onRatingUpdate: (rating) {
          ratingController.updateRating(rating);
        },
      );
    });
  }
}
