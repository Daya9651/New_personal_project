import 'package:get/get.dart';
import 'package:likhit/screens/client_screen/services/controller/client_api_controller.dart';

class ClientAppointmentBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => ClientApiController());
  }
}
