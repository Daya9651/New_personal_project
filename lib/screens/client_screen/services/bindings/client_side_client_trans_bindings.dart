import 'package:get/get.dart';

import '../controller/client_side_client_transaction_controller.dart';

class ClientSideClientTransBindings extends Bindings{


  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(()=>ClientSideClientTransactionController());
  }

}