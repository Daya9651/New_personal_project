import 'package:get/get.dart';

import '../controllers/client_transaction_controller.dart';

class ClientTransactionBinding extends Bindings{


  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(()=>ClientTransactionController());
  }
}