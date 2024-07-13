import 'package:get/get.dart';
import 'package:likhit/screens/lawyer_screen/screens/controllers/lawyer_appointment_controllers.dart';

import '../controllers/client_transaction_controller.dart';

class LawyerAppointmentBindings extends Bindings{


  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(()=>LawyerAppointmentControllers());
  }
}