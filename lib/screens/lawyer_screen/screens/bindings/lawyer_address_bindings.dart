import 'package:get/get.dart';
import 'package:likhit/screens/lawyer_screen/screens/controllers/add_address_controller.dart';

class LawyerAddressBindings extends Bindings{



  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(()=>AddAddressController());
  }
}