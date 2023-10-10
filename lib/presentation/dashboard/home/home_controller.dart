import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt selectedIndex = 0.obs;

  List<String> categoryList = [
    "Thriller",
    "Drama",
    "Horror",
    "Fantasy",
    "Action",
  ];

  List<String> imageList = [
    "assets/images/poster1.png",
    "assets/images/poster2.jpg",
    "assets/images/poster3.jpeg",
    "assets/images/poster4.jpg",
    "assets/images/poster5.jpg"
  ];

  void handleCategorySelection(int index) {
    selectedIndex.value = index;
  }
}
