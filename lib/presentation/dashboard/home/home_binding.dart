import 'package:demo_mobile/presentation/dashboard/home/home_controller.dart';
import 'package:demo_mobile/presentation/dashboard/movies/movie_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // Home
    Get.put(HomeController());

    // Movies
    Get.lazyPut(() => MovieController());
  }
}
