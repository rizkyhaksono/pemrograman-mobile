// getx
import 'package:get/get.dart';

// page names
import 'package:demo_mobile/routes/page_names.dart';

// pages
import 'package:demo_mobile/presentation/splash/splash_page.dart';
import 'package:demo_mobile/presentation/dashboard/dashboard_binding.dart';
import 'package:demo_mobile/presentation/dashboard/dashboard_page.dart';
import 'package:demo_mobile/presentation/splash/splash_binding.dart';

class PageRoutes {
  static final pages = [
    GetPage(
      name: PageName.splash,
      page: () => const SplashPage(),
      binding: SplashBinding(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: PageName.dashboard,
      page: () => const DashboardPage(),
      binding: DashboardBinding(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(microseconds: 500),
    )
  ];
}
