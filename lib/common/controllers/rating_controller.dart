import 'package:get/get.dart';

class RatingController extends GetxController {
  var rating = 0.0.obs;

  RatingController(double initialRating) {
    rating.value = initialRating;
  }

  void updateRating(double newRating) {
    rating.value = newRating;
  }
}
