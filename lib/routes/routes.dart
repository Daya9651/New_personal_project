import 'package:get/get.dart';

import '../screens/auth/choose_account_type.dart';
import '../screens/auth/lawyer_add_profile.dart';
import '../screens/auth/user_add_profile.dart';
import '../screens/book_appointment_client/bindings/book_appointment_bindings.dart';
import '../screens/book_appointment_client/views/book_appointments_page.dart';
import '../screens/bottombar/bindings/bottom_nav_binding.dart';
import '../screens/client_screen/client_lawyer_list.dart';
import '../screens/signup/signUp.dart';
import '../screens/splash/components/bottombar.dart';
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
            page: () => const BookAppointmentsPage(),
            binding: BookAppointmentBindings()),
      ];
}
