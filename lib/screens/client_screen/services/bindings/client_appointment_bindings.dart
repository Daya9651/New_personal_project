import 'package:get/get.dart';
import 'package:likhit/screens/client_screen/services/controller/client_api_controller.dart';

import '../controller/client_book_appointment_time_controller.dart';
import '../controller/client_edit_controller.dart';

class ClientAppointmentBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => ClientApiController());
  }
}

class ClientBookAppointmentBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => ClientBookAppointmentTimeController());
  }
}

class ClientEditProfileBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => ClientEditController());
  }
}
