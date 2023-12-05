import 'package:demo_mobile/components/movie_detail.dart';
import 'package:demo_mobile/components/movie_web.dart';
import 'package:demo_mobile/presentation/dashboard/favorites/favorite_binding.dart';
import 'package:demo_mobile/presentation/dashboard/favorites/favorite_page.dart';
import 'package:demo_mobile/presentation/dashboard/home/home_binding.dart';
import 'package:demo_mobile/presentation/dashboard/home/home_page.dart';
import 'package:demo_mobile/presentation/dashboard/movies/movie_binding.dart';
import 'package:demo_mobile/presentation/dashboard/movies/movie_page.dart';
import 'package:demo_mobile/presentation/dashboard/profile/edit_profile/edit_profile_page.dart';
import 'package:demo_mobile/presentation/dashboard/profile/feedback/feedback_page.dart';
import 'package:demo_mobile/presentation/dashboard/profile/profile_binding.dart';
import 'package:demo_mobile/presentation/dashboard/profile/profile_page.dart';
import 'package:demo_mobile/presentation/auth/login/login_binding.dart';
import 'package:demo_mobile/presentation/auth/login/login_page.dart';
import 'package:demo_mobile/presentation/web_view/web_binding.dart';
import 'package:demo_mobile/presentation/web_view/web_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:demo_mobile/routes/page_names.dart';
import 'package:demo_mobile/presentation/splash/splash_page.dart';
import 'package:demo_mobile/presentation/dashboard/dashboard_binding.dart';
import 'package:demo_mobile/presentation/dashboard/dashboard_page.dart';
import 'package:demo_mobile/presentation/splash/splash_binding.dart';
import 'package:demo_mobile/presentation/auth/sign_up/signup_binding.dart';
import 'package:demo_mobile/presentation/auth/sign_up/signup_page.dart';

class PageRoutes {
  static final pages = [
    GetPage(
      name: PageName.splash,
      page: () => const SplashPage(),
      binding: SplashBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: PageName.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: PageName.dashboard,
      page: () => const DashboardPage(),
      binding: DashboardBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: PageName.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: PageName.movies,
      page: () => const MoviePage(),
      binding: MovieBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: PageName.favorite,
      page: () => FavoritePage(),
      binding: FavoriteBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: PageName.profile,
      page: () => ProfilePage(),
      binding: ProfileBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: PageName.movieDetail,
      page: () => const MovieDetailPage(),
      binding: MovieBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: PageName.github,
      page: () => const WebPage(),
      binding: WebBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: PageName.moviesWeb,
      page: () => const MovieWebPage(),
      binding: MovieBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: PageName.signUp,
      page: () => const SignUpPage(),
      binding: SignUpBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: PageName.editProfile,
      page: () => EditProfilePage(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(name: PageName.feedback, 
    page: () => FeedbackPage(),
    transition: Transition.fadeIn,
    transitionDuration: const Duration(milliseconds: 500),

    )
  ];
}
