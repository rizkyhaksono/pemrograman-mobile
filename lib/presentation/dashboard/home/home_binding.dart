import 'package:demo_mobile/presentation/dashboard/home/home_controller.dart';
import 'package:demo_mobile/presentation/dashboard/movies/movie_controller.dart';
import 'package:demo_mobile/utils/account_controller.dart';
import 'package:demo_mobile/utils/database_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => MovieController());
    Get.lazyPut(() => AccountController());
    Get.lazyPut(() => DatabaseController());
  }
}
