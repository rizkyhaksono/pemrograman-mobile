// getx
import 'package:demo_mobile/components/movie_detail.dart';
import 'package:demo_mobile/presentation/dashboard/favorites/favorite_binding.dart';
import 'package:demo_mobile/presentation/dashboard/favorites/favorite_page.dart';
import 'package:demo_mobile/presentation/dashboard/home/home_binding.dart';
import 'package:demo_mobile/presentation/dashboard/home/home_page.dart';
import 'package:demo_mobile/presentation/dashboard/movies/movie_binding.dart';
import 'package:demo_mobile/presentation/dashboard/movies/movie_page.dart';
import 'package:demo_mobile/presentation/dashboard/profile/profile_binding.dart';
import 'package:demo_mobile/presentation/dashboard/profile/profile_page.dart';
import 'package:demo_mobile/presentation/login/login_binding.dart';
import 'package:demo_mobile/presentation/login/login_page.dart';
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
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: PageName.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: PageName.dashboard,
      page: () => const DashboardPage(),
      binding: DashboardBinding(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: PageName.home,
      page: () => HomePage(),
      binding: HomeBinding(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: PageName.movies,
      page: () => MoviePage(),
      binding: MovieBinding(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: PageName.favorite,
      page: () => FavoritePage(),
      binding: FavoriteBinding(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: PageName.profile,
      page: () => ProfilePage(),
      binding: ProfileBinding(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: PageName.movieDetail,
      page: () => MovieDetailPage(),
      binding: ProfileBinding(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(seconds: 1),
    ),
  ];
}
