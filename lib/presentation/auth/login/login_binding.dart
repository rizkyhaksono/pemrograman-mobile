import 'package:demo_mobile/presentation/auth/auth_controller.dart';
import 'package:demo_mobile/utils/account_controller.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => AccountController());
  }
}
