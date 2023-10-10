import 'package:get/get.dart';

class SplashController extends GetxController {
  // final AuthController _authController = Get.put(AuthController());

  @override
  void onReady() {
    super.onReady();

    Future.delayed(const Duration(milliseconds: 3000), () {
      Get.offAllNamed("/login");
    });
  }
}
