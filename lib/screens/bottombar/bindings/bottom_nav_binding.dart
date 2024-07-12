import 'package:get/get.dart';
import 'package:likhit/screens/bottombar/controllers/bottom_nav_controller.dart';

class BottomNavBinding extends Bindings{
  
  
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(()=>BottomNavController());
  }
  
}