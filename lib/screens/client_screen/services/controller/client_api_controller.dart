import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:likhit/common/const_api.dart';
import 'package:likhit/const/api_url.dart';
import 'package:likhit/screens/client_screen/services/model/lawyer_book_appointment_detail_model.dart';
import 'package:likhit/screens/client_screen/services/model/lawyer_list_model.dart';

import '../model/client_appointment_model.dart';
import '../model/client_profile_model.dart';

class ClientApiController extends GetxController {
  var searchTransactionController = TextEditingController().obs;

  var searchLawyerListController = TextEditingController().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    ApiService.init();
    getClientProfile();
    getLawyerListFetch();
    clientAppointmentDetailFetch();
  }

  //todo lawyer list get api
  // var lawyerListData = <LawyerListData>[].obs;
  //
  // Future lawyerListFetch() async {
  //   try {
  //     dio.Response response = await ApiService.getData(
  //       lawyerListUrl,
  //     );
  //     var data = response.data['data'] as List;
  //     lawyerListData.value =
  //         data.map((item) => LawyerListData.fromJson(item)).toList();
  //     debugPrint("lawyerListFetch : ${lawyerListData[0].name}");
  //     update();
  //   } catch (e) {
  //     debugPrint("lawyerListFetch exception : $e");
  //   }
  // }

  //todo Client profile data
  var lawyerListData = Rx<LawyerListModel>(LawyerListModel());

  Future getLawyerListFetch({String? search}) async {
    try {
      dio.Response clientTransactionResponse =
          await ApiService.getData(lawyerListUrl, queryParameters: {
        'sort': '',
        'speciality': '',
        'language_spoken': '',
        'location': '',
        'search': search,
      });
      if (clientTransactionResponse.data['response_code'] == 200) {
        lawyerListData.value =
            LawyerListModel.fromJson(clientTransactionResponse.data);
      }
    } catch (e) {
      debugPrint("getLawyerListFetch error : $e");
    }
  }

  // Future lawyerListFetch() async {
  //   try {
  //     dio.Response response = await ApiService.getData(lawyerListUrl);
  //
  //     var responseData = response.data;
  //     if (responseData != null && responseData['data'] != null) {
  //       var LawyerListData = LawyerListModel.fromJson(responseData);
  //       lawyerListData.value = LawyerListData;
  //
  //       debugPrint("lawyerListFetch : $responseData");
  //       update();
  //     } else {
  //       debugPrint("lawyerListFetch : Empty data or invalid structure");
  //     }
  //   } catch (e) {
  //     debugPrint("lawyerListFetch exception : $e");
  //   }
  // }

  //todo lawyerBookDetailsList list get api
  var lawyerBookDetailListData =
      Rx<LawyerBookAppointmentDetailModel>(LawyerBookAppointmentDetailModel());

  Future lawyerBookDetailFetch({int? id}) async {
    try {
      dio.Response response = await ApiService.getData(
          lawyerBookAppointmentDetailsUrl,
          queryParameters: {'lawyer_id': id});

      var responseData = response.data;
      if (responseData != null && responseData['data'] != null) {
        var lawyerBookAppointmentDetailModel =
            LawyerBookAppointmentDetailModel.fromJson(responseData);
        lawyerBookDetailListData.value = lawyerBookAppointmentDetailModel;

        debugPrint("lawyerBookDetailFetch : $responseData");
        update();
      } else {
        debugPrint("lawyerBookDetailFetch : Empty data or invalid structure");
      }
    } catch (e) {
      debugPrint("lawyerBookDetailFetch exception : $e");
    }
  }

//todo clientAppointmentList list get api
  var clientAppointmentListData =
      Rx<ClientAppointmentModel>(ClientAppointmentModel());

  Future clientAppointmentDetailFetch({String? search}) async {
    try {
      dio.Response response =
          await ApiService.getData(clientAppointmentUrl, queryParameters: {
        'search': search,
        'page': "1",
      });

      var responseData = response.data;
      if (responseData != null && responseData['data'] != null) {
        var ClientAppointmnetListData =
            ClientAppointmentModel.fromJson(responseData);
        clientAppointmentListData.value = ClientAppointmnetListData;

        debugPrint("clientAppointmentDetailFetch : $responseData");
        update();
      } else {
        debugPrint(
            "clientAppointmentDetailFetch : Empty data or invalid structure");
      }
    } catch (e) {
      debugPrint("clientAppointmentDetailFetch exception : $e");
    }
  }

//todo Client profile data
  var clientProfile = Rx<ClientProfileModel>(ClientProfileModel());

  Future getClientProfile() async {
    try {
      dio.Response response = await ApiService.getData(profileUrl);

      var responseData = response.data;
      if (responseData != null && responseData['data'] != null) {
        var ClientProfile = ClientProfileModel.fromJson(responseData);
        clientProfile.value = ClientProfile;

        debugPrint("getClientProfile : $responseData");
        update();
      } else {
        debugPrint("getClientProfile : Empty data or invalid structure");
      }
    } catch (e) {
      debugPrint("getClientProfile exception : $e");
    }
  }

  var commentController = TextEditingController().obs;

  // var ratingController = TextEditingController().obs;
  RxDouble ratingController = 0.0.obs;

  Future postReview(int? id) async {
    try {
      dio.Response response =
          await ApiService.postData(url: clientReviewUrl, data: {
        'comment': commentController.value.text,
        'lawyer_id': id,
        'rating': ratingController.value
        // 'rating': ratingController.value.text.toInt(),
      });
      lawyerBookDetailFetch(id: id);
      update();
    } catch (e) {
      debugPrint("postReview exception : $e");
    }
  }

  RxDouble like = 0.0.obs;

  Future postLike({int? reviewID, lawyerID}) async {
    try {
      dio.Response response = await ApiService.postData(url: likeUrl, data: {
        'review_id': reviewID,
        // 'rating': ratingController.value.text.toInt(),
      });
      lawyerBookDetailFetch(id: lawyerID);
      update();
    } catch (e) {
      debugPrint("postLike exception : $e");
    }
  }

  RxDouble dislike = 0.0.obs;

  Future postDislike({int? reviewID, lawyerID}) async {
    try {
      dio.Response response = await ApiService.postData(url: dislikeUrl, data: {
        'review_id': reviewID,
        // 'rating': ratingController.value.text.toInt(),
      });
      lawyerBookDetailFetch(id: lawyerID);
      update();
    } catch (e) {
      debugPrint("postDislike exception : $e");
    }
  }
}
