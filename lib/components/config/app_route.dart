import 'package:get/get_navigation/src/routes/get_route.dart';

import '../../screen/home/binding/home_binding.dart';
import '../../screen/home/presentation/home_screen.dart';
import '../../screen/login/binding/login_binding.dart';
import '../../screen/login/presentation/login_screen.dart';
import '../../screen/register/binding/register_binding.dart';
import '../../screen/register/presentation/register_screen.dart';

class AppRoute {
  static const String defaultRoute = '/loginScreen';
  static const String notFound = '/notFound';
  static const String registerScreen = '/registerScreen';
  static const String homeScreen = '/homeScreen';

  static List<GetPage> pages = [
    GetPage(
      name: defaultRoute,
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
  ];
}
