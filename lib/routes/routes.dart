import 'package:get/get.dart';
import 'package:likhit/screens/client_screen/client_profile.dart';
import 'package:likhit/screens/client_screen/services/bindings/client_appointment_bindings.dart';
import 'package:likhit/screens/lawyer_screen/screens/views/lawyer_appointment_list.dart';
import 'package:likhit/screens/lawyer_screen/screens/views/lawyer_my_transaction.dart';

import '../screens/auth/choose_account_type.dart';
import '../screens/auth/lawyer_add_profile.dart';
import '../screens/auth/user_add_profile.dart';
import '../screens/book_appointment_client/bindings/book_appointment_bindings.dart';
import '../screens/book_appointment_client/views/book_appointments_page.dart';
import '../screens/bottombar/bindings/bottom_nav_binding.dart';
import '../screens/bottombar/bindings/lawyer_transaction_binding.dart';
import '../screens/bottombar/bottombar.dart';
import '../screens/client_screen/client_appointment_list.dart';
import '../screens/client_screen/client_book_appointment_time.dart';
import '../screens/client_screen/client_lawyer_list.dart';
import '../screens/lawyer_screen/screens/bindings/client_transaction_binding.dart';
import '../screens/lawyer_screen/screens/bindings/lawyer_appointment_bindings.dart';
import '../screens/lawyer_screen/screens/bindings/lawyer_my_transaction_bindings.dart';
import '../screens/lawyer_screen/screens/bindings/lawyer_payment_request_binding.dart';
import '../screens/lawyer_screen/screens/views/client_transaction.dart';
import '../screens/lawyer_screen/screens/views/lawyer_payment_request_page.dart';
import '../screens/signup/signUp.dart';
import '../screens/splash_screen_likhit.dart';

class ApplicationPages {
  static const splashScreen = '/';
  static const signUpPage = '/signUpPage';
  static const choosePage = '/choosePage';
  static const addLawyerProfile = '/addLawyerProfile';
  static const addUserProfile = '/addUserProfile';
  static const bookAppointmentsPage = '/bookAppointmentsPage';
  static const clientLawyerList = '/clientLawyerList';
  static const myBottomBar = '/myBottomBar';

  //lawyer

  static const clientTransaction = '/clientTransaction';
  static const lawyerAppointmentList = '/lawyerAppointmentList';
  static const lawyerPaymentRequest = '/lawyerPaymentRequest';
  static const lawyerMyTransaction = '/lawyerMyTransaction';
  static const plans = '/plans';

  //todo client
  static const clientAppointmentList = '/clientAppointmentList';
  static const clientProfile = '/clientProfile';
  static const clientBookAppointment = '/clientBookAppointment';

  static List<GetPage>? getApplicationPages() => [
        GetPage(
          name: splashScreen,
          page: () => const SplashScreenLikhit(),
        ),

        GetPage(
          name: signUpPage,
          page: () => SignInPage(),
        ),

        GetPage(
          name: choosePage,
          page: () => const ChoosePage(),
        ),

        GetPage(
          name: addLawyerProfile,
          page: () => LawyerAddProfile(),
        ),
        GetPage(
            name: myBottomBar,
            page: () => MyBottomBar(),
            binding: BottomNavBinding()),

        GetPage(
          name: addUserProfile,
          page: () => UserAddProfile(),
        ),
        GetPage(
          name: clientLawyerList,
          page: () => ClientLawyerList(),
        ),

        GetPage(
            name: bookAppointmentsPage,
            page: () => BookAppointmentsPage(),
            binding: BookAppointmentBindings()),

        // lawyer

        GetPage(
            name: clientTransaction,
            page: () => const ClientTransaction(),
            binding: ClientTransactionBinding()),

        GetPage(
            name: lawyerMyTransaction,
            page: () => const LawyerMyTransaction(),
            binding: LawyerMyTransactionBindings()),
        GetPage(
            name: lawyerAppointmentList,
            page: () => const LawyerAppointmentList(),
            binding: LawyerAppointmentBindings()),

        GetPage(
            name: lawyerMyTransaction,
            page: () => const LawyerMyTransaction(),
            binding: LawyerTransactionBinding()),
        GetPage(
            name: lawyerPaymentRequest,
            page: () => const LawyerPaymentRequestPage(),
            binding: LawyerPaymentRequestBinding()),

        GetPage(
            name: clientAppointmentList,
            page: () => const ClientAppointmentList(),
            binding: ClientAppointmentBinding()),
        GetPage(
            name: clientProfile,
            page: () => const ClientProfile(),
            binding: ClientAppointmentBinding()),

        GetPage(
            name: clientBookAppointment,
            page: () => const ClientBookAppointmentTime(),
            binding: ClientBookAppointmentBinding()),
      ];
}
