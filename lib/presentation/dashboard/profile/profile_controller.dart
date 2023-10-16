import 'package:get/get.dart';

class ProfileController extends GetxController {
  RxInt selectedIndex = 0.obs;

  RxBool isProficPicPathSet = false.obs;
  RxString profilePicPath = "".obs;

  void setProfileImagePath(String path) {
    profilePicPath.value = path;
    isProficPicPathSet.value = true;
  }
}
