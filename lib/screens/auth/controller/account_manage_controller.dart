import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:likhit/common/const_api.dart';
import 'package:likhit/const/api_url.dart';
import 'package:dio/dio.dart' as dio;
import 'package:likhit/screens/auth/save_auth_data.dart';
import 'package:likhit/screens/auth/services/model/city_model.dart';
import 'package:likhit/screens/auth/services/model/state_model.dart';
import 'package:likhit/utils/const_toast.dart';

import '../../../pending_review_page.dart';
import '../../../routes/routes.dart';
import '../choose_account_type.dart';

class AccountManageController extends GetxController{

  ApiService apiService = ApiService();

  RxInt choose = 0.obs;

  var lawyerController = TextEditingController().obs;
  var nameController = TextEditingController().obs;
  var phoneController = TextEditingController().obs;
  var addressController = TextEditingController().obs;
  var aboutController = TextEditingController().obs;
  var experienceController = TextEditingController().obs;
  var dateAndTimeController = TextEditingController().obs;

  RxString
  gender = ''.obs;
  RxString country = ''.obs;
  RxString state = ''.obs;
  RxString city = ''.obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    ApiService.init();
    stateGet();

  }


  // todo lawyer and user profile
  Future confirmUserApi({String confirm="no"}) async{
    debugPrint("confirmUserApi hitting");
    try {

      Map<String, dynamic> data;
      if (confirm == "no") {
        data = {
          "name": nameController.value.text,
          "mobile": phoneController.value.text,
          "dob": dateAndTimeController.value.text,
          "address": addressController.value.text,
          // "image": "",
          "gender": gender.value,
          "confirm":  "no",
        };
      }else{
        data = {
        "lawyerid":lawyerController.value.text,
        "name":nameController.value.text,
        "mobile":phoneController.value.text,
        "dob": dateAndTimeController.value.text,
        "address":addressController.value.text,
        "about":aboutController.value.text,
        "office_address":addressController.value.text,
        // "image":
        "gender":gender.value,
        "url":"",
        "country":"India",
        "city":city.value,
        "state":state.value,
        "experience":"",
        "specialties": [],
        "language_spoken": [],
        "language_written": [],
        "confirm": confirm
      };
      }



      dio.Response response = await ApiService.postData(
          url: confirmationLawyerAndClientUrl,
          data: data
      );
      debugPrint("confirmUserApi $response");
      if(response.data['response_code']==200){
        var type = response.data['user_type'];
        UserDataService.saveUserType(type);

        debugPrint("choosing after : ${type}");

        if (type == "Not Define") {
          Get.off(const ChoosePage(),);
        } else if (type == "Approval Pending") {
          Get.to(() => const PendingReviewPage());
        } else {
          Get.offAllNamed(ApplicationPages.myBottomBar);
        }


        ConstToast.to.showSuccess("${response.data['message']}");

      }else{
        debugPrint("else confirmUserApi ${response.data}");
        ConstToast.to.showError("${response.data['message']}");
      }
    }
  catch(e){
    debugPrint("confirmUserApi exception : $e");
    }
  }

// todo state api

  var stateData = <StateData>[].obs;

Future stateGet() async{
  cityData.value = [];
    try{
      dio.Response response = await ApiService.getData(
        stateUrl,
        queryParameters: {
          'country_id' : 1
        }
      );
      var data = response.data['data'] as List;
      stateData.value = data.map((item) => StateData.fromJson(item)).toList();
      // debugPrint("StateGetApi : ${stateData[0].name}");
update();
    }catch(e){
      debugPrint("StateGetApi exception : $e");
    }
}

  // todo city api
  var cityData = <CityData>[].obs;
  Future cityGet( stateID) async{

    debugPrint("CityGetApi  : $stateID");
    try{
      cityData.value = [];
      city.value ="Select City";
      dio.Response response = await ApiService.getData(
          cityUrl,
          queryParameters: {
            'state_id' : stateID
          }
      );
      var data = response.data['data'] as List;
      cityData.value = data.map((item) => CityData.fromJson(item)).toList().toSet().toList();
      debugPrint("CityGetApi : ${cityData.map((item) => item.name)}");
      update();
    }catch(e){
      debugPrint("CityGetApi exception : $e");
    }
  }

}