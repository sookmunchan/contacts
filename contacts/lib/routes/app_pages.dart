import 'package:contacts/screens/home/home_page.dart';
import 'package:contacts/screens/home/home_page_binding.dart';
import 'package:contacts/screens/home/tabs/contact_list/details/contact_details_page.dart';
import 'package:contacts/screens/home/tabs/contact_list/details/contact_details_page_binding.dart';
import 'package:contacts/screens/login/login_page.dart';
import 'package:contacts/screens/login/login_page_binding.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

part 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginPage(),
      binding: LoginPageBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => const HomePage(),
      binding: HomePageBinding(),
    ),
    GetPage(
      name: Routes.CONTACTDETAILS,
      page: () => const ContactDetailsPage(),
      binding: ContactDetailsPageBinding(),
    ),
  ];
}
