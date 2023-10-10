import 'package:demo_mobile/presentation/dashboard/dashboard_controller.dart';
import 'package:demo_mobile/presentation/dashboard/favorites/favorite_controller.dart';
import 'package:demo_mobile/presentation/dashboard/home/home_controller.dart';
import 'package:demo_mobile/presentation/dashboard/movies/movie_controller.dart';
import 'package:demo_mobile/presentation/dashboard/profile/profile_controller.dart';
import 'package:get/get.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    // Dashboard
    Get.put(DashboardController());

    // Home
    Get.put(HomeController());

    // Movie
    Get.put(MovieController());

    // Favorite
    Get.put(FavoriteController());

    // Profile
    Get.put(ProfileController());
  }
}
