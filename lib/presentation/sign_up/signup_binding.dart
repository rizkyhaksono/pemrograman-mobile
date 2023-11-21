import 'package:demo_mobile/presentation/sign_up/signup_controller.dart';
import 'package:get/get.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SignUpController>(
      SignUpController(),
    );

    Get.lazyPut(() => SignUpController());
  }
}
