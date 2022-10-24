import '../bindings/ritase_binding.dart';
import '../ui/pages/ritase_page/ritase_page.dart';
      import '../bindings/splash_binding.dart';
import '../ui/pages/splash_page/splash_page.dart';
import '../bindings/login_binding.dart';
import '../ui/pages/login_page/login_page.dart';
import 'package:get/get.dart';

import '../bindings/home_binding.dart';
import '../ui/pages/home_page/home_page.dart';
import '../ui/pages/unknown_route_page/unknown_route_page.dart';
import 'app_routes.dart';

const _defaultTransition = Transition.native;

class AppPages {
  static final unknownRoutePage = GetPage(
    name: AppRoutes.UNKNOWN,
    page: () => const UnknownRoutePage(),
    transition: _defaultTransition,
  );

  static final List<GetPage> pages = [
    unknownRoutePage,
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => const LoginPage(),
      binding: LoginBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.SPLASH,
      page: () => const SplashPage(),
      binding: SplashBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.RITASE,
      page: () => const RitasePage(),
      binding: RitaseBinding(),
      transition: _defaultTransition,
    ), 
];
}