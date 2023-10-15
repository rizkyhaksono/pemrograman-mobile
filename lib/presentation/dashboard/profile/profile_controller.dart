import 'package:get/get.dart';

class ProfileController extends GetxController {
  RxInt selectedIndex = 0.obs;

  RxString profilePicture = ''.obs;

  RxString imageUrl = "".obs;

  void setImageUrl(String newUrl) {
    imageUrl.value = newUrl;
  }

  void changeProfilePicture(String newPicture) {
    profilePicture.value = newPicture;
  }
}
