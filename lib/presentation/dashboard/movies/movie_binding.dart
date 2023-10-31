import 'package:demo_mobile/presentation/dashboard/movies/movie_controller.dart';
import 'package:get/get.dart';

class MovieBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MovieController());
    Get.put(() => MovieController());
  }
}
