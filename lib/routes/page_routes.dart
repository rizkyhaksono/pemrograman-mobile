// getx
import 'package:get/get.dart';

// page names
import 'package:demo_mobile/routes/page_names.dart';

// pages
import 'package:demo_mobile/presentation/pages/splash/splash.dart';

class PageRoutes {
  static final pages = [
    GetPage(
      name: PageName.splash,
      page: () => const SplashPage(),
      // binding: SplashBinding(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    // GetPage(
    //   name: PageName.login,
    //   page: () => LoginPage(),
    //   binding: LoginBinding(),
    //   transition: Transition.cupertino,
    //   transitionDuration: const Duration(milliseconds: 250),
    // ),
    // GetPage(
    //   name: PageName.dashboard,
    //   page: () => const DashboardPage(),
    //   binding: DashboardBinding(),
    //   transition: Transition.cupertino,
    //   transitionDuration: const Duration(milliseconds: 250),
    // ),
    // GetPage(
    //   name: PageName.home,
    //   page: () => HomePage(),
    //   binding: HomeBinding(),
    //   transition: Transition.cupertino,
    //   transitionDuration: const Duration(milliseconds: 250),
    // ),
    // GetPage(
    //   name: PageName.stock,
    //   page: () => StockPage(),
    //   binding: StockBinding(),
    //   transition: Transition.cupertino,
    //   transitionDuration: const Duration(milliseconds: 250),
    // ),
    // GetPage(
    //   name: PageName.profile,
    //   page: () => const ProfilePage(),
    //   binding: ProfileBinding(),
    //   transition: Transition.cupertino,
    //   transitionDuration: const Duration(milliseconds: 250),
    // ),
    // GetPage(
    //   name: PageName.about,
    //   page: () => const AboutPage(),
    //   binding: AboutBinding(),
    //   transition: Transition.cupertino,
    //   transitionDuration: const Duration(milliseconds: 250),
    // ),
    // GetPage(
    //   name: PageName.detail,
    //   page: () => DetailPage(),
    //   binding: DetailBinding(),
    //   transition: Transition.cupertino,
    //   transitionDuration: const Duration(milliseconds: 250),
    // ),
    // GetPage(
    //   name: PageName.trackorder,
    //   page: () => TrackOrderPage(),
    //   binding: TrackOrderBinding(),
    //   transition: Transition.cupertino,
    //   transitionDuration: const Duration(milliseconds: 250),
    // ),
    // GetPage(
    //   name: PageName.phaseorder,
    //   page: () => const PhasePage(),
    //   binding: PhaseBinding(),
    //   transition: Transition.cupertino,
    //   transitionDuration: const Duration(milliseconds: 250),
    // ),
    // GetPage(
    //   name: PageName.chartorder,
    //   page: () => ChartPage(),
    //   binding: ChartBinding(),
    //   transition: Transition.cupertino,
    //   transitionDuration: const Duration(milliseconds: 250),
    // ),
  ];
}
