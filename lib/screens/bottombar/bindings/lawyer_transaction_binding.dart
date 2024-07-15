import 'package:get/get.dart';
import 'package:likhit/screens/lawyer_screen/screens/controllers/client_transaction_controller.dart';
import 'package:likhit/screens/lawyer_screen/screens/controllers/lawyer_my_transaction_controller.dart';

class LawyerTransactionBinding extends Bindings{


  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(()=>ClientTransactionController());
    Get.lazyPut(()=>LawyerMyTransactionController());
    // Get.lazyPut(()=>);
  }

}