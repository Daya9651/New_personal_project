import 'package:get/get.dart';

import '../controllers/lawyer_appoint_trans_controller.dart';

class LawyerAppTransBinding extends Bindings{


  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(()=>LawyerAppointTransController());
  }
}