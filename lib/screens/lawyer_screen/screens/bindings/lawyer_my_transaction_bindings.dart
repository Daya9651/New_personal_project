import 'package:get/get.dart';

import '../controllers/lawyer_my_transaction_controller.dart';

class LawyerMyTransactionBindings extends Bindings{






  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(()=>LawyerMyTransactionController());
  }
}