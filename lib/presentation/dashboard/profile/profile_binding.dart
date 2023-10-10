import 'package:demo_mobile/presentation/dashboard/profile/profile_controller.dart';
import 'package:get/get.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController());
    Get.put(ProfileController());
  }
}
