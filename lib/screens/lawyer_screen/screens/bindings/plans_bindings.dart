import 'package:get/get.dart';
import 'package:likhit/screens/lawyer_screen/screens/controllers/lawyer_plans_controller.dart';

class PlansBindings extends Bindings{


  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(()=>LawyerPlansController());
  }
}