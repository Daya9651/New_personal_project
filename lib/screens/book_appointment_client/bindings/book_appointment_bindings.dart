import 'package:get/get.dart';

import '../controllers/booking_appointment_controller.dart';

class BookAppointmentBindings extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => BookingAppointmentController());

  }
}