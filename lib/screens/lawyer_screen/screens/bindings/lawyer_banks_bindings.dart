import 'package:get/get.dart';
import 'package:likhit/screens/lawyer_screen/screens/views/profile/controllers/lawyer_bank_controller.dart';

class LawyerBanksBindings extends Bindings{


  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(()=>LawyerBankController());
  }



}