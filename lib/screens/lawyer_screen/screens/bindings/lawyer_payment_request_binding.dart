import 'package:get/get.dart';
import 'package:likhit/screens/lawyer_screen/screens/controllers/lawyer_payment_request_controller.dart';

class LawyerPaymentRequestBinding extends Bindings{


  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(()=>LawyerPaymentRequestController());
  }
}