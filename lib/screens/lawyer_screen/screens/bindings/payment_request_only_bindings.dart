import 'package:get/get.dart';
import 'package:likhit/screens/lawyer_screen/screens/controllers/payment_request_only_controller.dart';

class PaymentRequestOnlyBindings extends Bindings{


  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(()=>PaymentRequestOnlyController());
  }
}