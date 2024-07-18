import 'package:get/get.dart';
import 'package:likhit/screens/lawyer_screen/screens/controllers/lawyer_profile_controller.dart';

class LawyerProfileBindings extends Bindings{



  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(()=>LawyerProfileController());
  }
}