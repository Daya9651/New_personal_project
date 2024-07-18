import 'package:get/get.dart';
import 'package:likhit/screens/lawyer_screen/screens/views/profile/controllers/lawyer_contact_info_controller.dart';

class LawyerContactInfoBinding extends Bindings{


  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(()=>LawyerContactInfoController());
  }
}