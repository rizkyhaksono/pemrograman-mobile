import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt selectedIndex = 0.obs;

  RxInt selectedRecent = 0.obs;
  RxInt selectedRecommended = 0.obs;

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

  List<String> imageName = [
    'Batman',
    'The Last of Us',
    '3000 of Longing',
    'Alone',
    'Gravity'
  ];

  void handleCategorySelection(int index) {
    selectedIndex.value = index;
  }

  void handleRecentSelection(int index) {
    var test = selectedRecent.value = index;
    print(test);
  }
}
