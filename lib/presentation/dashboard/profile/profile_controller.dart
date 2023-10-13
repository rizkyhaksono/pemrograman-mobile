import 'package:get/get.dart';

class ProfileController extends GetxController {
  RxInt selectedIndex = 0.obs;

  RxString imageUrl = "".obs;

  void setImageUrl(String newUrl) {
    imageUrl.value = newUrl;
  }
}
