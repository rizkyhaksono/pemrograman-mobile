import 'package:demo_mobile/utils/models/movie_detail.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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

  static const String _baseUrl = 'https://api.themoviedb.org/3/discover/movie';
  static const String _apiKey = 'https://api.themoviedb.org/3/discover/movie';

  var isLoading = false.obs;
  var hasError = false.obs;
  var errorMessage = ''.obs;
  var hasData = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchTodos();
  }

  Future<void> fetchTodos() async {
    isLoading.value = true;
    // try {
    //   final response = await http.get(Uri.parse(_baseUrl));
    //   if (response.statusCode == 200) {
    //     final data = json.decode(response.body);
    //     todo.value = Todo.fromJson(data);
    //     hasData.value = true;
    //   } else {
    //     hasError.value = true;
    //     errorMessage.value = 'Failed to load data';
    //   }
    // } catch (error) {
    //   hasError.value = true;
    //   errorMessage.value = error.toString();
    // } finally {
    //   isLoading.value = false;
    // }
  }
}
