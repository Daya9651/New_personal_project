import 'package:dio/dio.dart';
import 'package:likhit/const/api_url.dart';
import 'package:likhit/screens/auth/save_auth_data.dart';

import '../../../../utils/const_toast.dart';

class LawyerProfileServices {
  Future<void> servicesOfferedPost(String title, String subtitle, String fees)async{
    final dio = Dio();
    try{
      var response = await dio.post(curdLawyerServices,
          data: {
            'title' : title,
            'subtitle' : subtitle,
            'fee' : fees
          },
          options: Options(
            headers: {
              "Authorization" : UserDataService.getAuthToken()
            },
          ));
      if(response.statusCode == 200){

      }

    }catch(e){
      ConstToast.to.showError('$e');
    }
    //
  }
}