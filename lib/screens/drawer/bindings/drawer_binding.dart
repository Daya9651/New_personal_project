import 'package:get/get.dart';

import '../controller/likhit_drawer_controller.dart';

class DrawerBinding extends Bindings{


  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(()=>LikhitDrawerController());
  }


}