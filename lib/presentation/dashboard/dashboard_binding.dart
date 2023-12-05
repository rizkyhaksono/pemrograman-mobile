import 'package:demo_mobile/presentation/dashboard/dashboard_controller.dart';
import 'package:demo_mobile/presentation/dashboard/favorites/favorite_controller.dart';
import 'package:demo_mobile/presentation/dashboard/home/home_controller.dart';
import 'package:demo_mobile/presentation/dashboard/movies/movie_controller.dart';
import 'package:demo_mobile/presentation/dashboard/profile/profile_controller.dart';
import 'package:demo_mobile/utils/database_controller.dart';
import 'package:get/get.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => MovieController());
    Get.lazyPut(() => FavoriteController());
    Get.lazyPut(() => ProfileController());
    Get.lazyPut(() => DatabaseController());
  }
}
