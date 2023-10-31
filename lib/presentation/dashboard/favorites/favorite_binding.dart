import 'package:demo_mobile/presentation/dashboard/favorites/favorite_controller.dart';
import 'package:demo_mobile/presentation/dashboard/movies/movie_controller.dart';
import 'package:get/get.dart';

class FavoriteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FavoriteController());
    Get.put(FavoriteController());
    Get.lazyPut(() => MovieController());
  }
}
