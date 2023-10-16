import 'package:get/get.dart';

class MovieController extends GetxController {
  RxInt selectedIndex = 0.obs;

  List<String> imageName = [
    'Batman',
    'The Last of Us',
    '3000 of Longing',
    'Alone',
    'Gravity'
  ];

  List<String> imageList = [
    "assets/images/poster1.png",
    "assets/images/poster2.jpg",
    "assets/images/poster3.jpeg",
    "assets/images/poster4.jpg",
    "assets/images/poster5.jpg"
  ];

  void handleImageList(int index) {
    selectedIndex.value = index;
  }
}
