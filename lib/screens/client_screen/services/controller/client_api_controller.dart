import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:likhit/common/const_api.dart';
import 'package:likhit/const/api_url.dart';
import 'package:likhit/screens/client_screen/services/model/lawyer_book_appointment_detail_model.dart';
import 'package:likhit/screens/client_screen/services/model/lawyer_list_model.dart';

class ClientApiController extends GetxController {
  ApiService apiService = ApiService();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    ApiService.init();
    lawyerListFetch();
    // lawyerBookDetailFetch(id: 16);
  }

  //todo lawyer list get api
  var lawyerListData = <LawyerListData>[].obs;

  Future lawyerListFetch() async {
    try {
      dio.Response response = await ApiService.getData(
        lawyerListUrl,
      );
      var data = response.data['data'] as List;
      lawyerListData.value =
          data.map((item) => LawyerListData.fromJson(item)).toList();
      // debugPrint("lawyerListFetch : ${lawyerListData[0].name}");
      update();
    } catch (e) {
      debugPrint("lawyerListFetch exception : $e");
    }
  }

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

        // debugPrint("lawyerBookDetailFetch : $responseData");
        update();
      } else {
        debugPrint("lawyerBookDetailFetch : Empty data or invalid structure");
      }
    } catch (e) {
      debugPrint("lawyerBookDetailFetch exception : $e");
    }
  }
}
