import 'package:get/get.dart';
import 'package:likhit/screens/bottombar/controllers/bottom_nav_controller.dart';
import 'package:likhit/screens/bottombar/controllers/lawyer_transaction_controllers.dart';
import 'package:likhit/screens/lawyer_screen/screens/controllers/client_transaction_controller.dart';
import 'package:likhit/screens/lawyer_screen/screens/controllers/lawyer_my_transaction_controller.dart';
import 'package:likhit/screens/lawyer_screen/screens/views/lawyer_my_transaction.dart';

class BottomNavBinding extends Bindings{
  
  
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(()=>BottomNavController());
    Get.lazyPut(()=>LawyerMyTransactionController());
    Get.lazyPut(()=>ClientTransactionController());
    Get.lazyPut(()=>LawyerTransactionControllers());
    // Get.lazyPut(()=>);
  }
  
}