import 'package:get/get_navigation/src/routes/get_route.dart';

import '../../screen/detail_checklist/binding/detail_checklist_binding.dart';
import '../../screen/detail_checklist/presentation/detail_checklist_screen.dart';
import '../../screen/detail_item/binding/detail_item_binding.dart';
import '../../screen/detail_item/presentation/detail_item_screen.dart';
import '../../screen/home/binding/home_binding.dart';
import '../../screen/home/presentation/home_screen.dart';
import '../../screen/login/binding/login_binding.dart';
import '../../screen/login/presentation/login_screen.dart';
import '../../screen/register/binding/register_binding.dart';
import '../../screen/register/presentation/register_screen.dart';
import '../../screen/splash/splash_screen.dart';

class AppRoute {
  static const String defaultRoute = '/';
  static const String loginScreen = '/loginScreen';
  static const String notFound = '/notFound';
  static const String registerScreen = '/registerScreen';
  static const String homeScreen = '/homeScreen';
  static const String detailChecklistScreen = '/detailChecklistScreen';
  static const String detailItemScreen = '/detailItemScreen';

  static List<GetPage> pages = [
    GetPage(
      name: defaultRoute,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: loginScreen,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: registerScreen,
      page: () => const RegisterScreen(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: homeScreen,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: detailChecklistScreen,
      page: () => const DetailChecklistScreen(),
      binding: DetailChecklistBinding(),
    ),
    GetPage(
      name: detailItemScreen,
      page: () => const DetailItemScreen(),
      binding: DetailItemBinding(),
    ),
  ];
}
