import 'package:get/get.dart';
import 'package:likhit/screens/client_screen/services/controller/client_api_controller.dart';

import '../controller/client_appointment_trans_controller.dart';
import '../controller/client_book_appointment_time_controller.dart';
import '../controller/client_payments_trans_controller.dart';

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
class ClientAppointmentTransBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => ClientAppointmentTransController());
  }
}
class ClientPaymentsTransBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => ClientPaymentsTransController());
  }
}
