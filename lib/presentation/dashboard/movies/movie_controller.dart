import 'package:demo_mobile/models/nowplaying_movie.dart';
import 'package:demo_mobile/models/toprated_movie.dart';
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

  static const String _baseUrl = 'https://api.themoviedb.org/3/';
  static const String _apiKey = '8ee16750c566b88be3d29a700cff3e73';

  var isLoading = false.obs;
  var hasError = false.obs;
  var errorMessage = ''.obs;
  var hasData = false.obs;

  @override
  void onInit() {
    super.onInit();
    getcomingsoon();
    getup();
    gettop();
  }

  late NowPlayModel now_soon;
  String url =
      "${_baseUrl}movie/now_playing?language=en-US&page=1&api_key=$_apiKey";
  getcomingsoon() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        print(result);
        now_soon = NowPlayModel.fromJson(result);

        // ignore: avoid_print
        print("is recived");
      } else {
        isLoading(false);
        // ignore: avoid_print
        print("is not recived");
      }
    } catch (e) {
      // ignore: avoid_print
      printError(info: "Error");
    } finally {
      isLoading(false);
    }
  }

  late NowPlayModel up_soon;
  String url2 =
      "${_baseUrl}movie/upcoming?language=en-US&page=1&api_key=$_apiKey";
  getup() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse(url2));
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        print(result);
        up_soon = NowPlayModel.fromJson(result);

        // ignore: avoid_print
        print("is recived");
      } else {
        isLoading(false);
        // ignore: avoid_print
        print("is not recived");
      }
    } catch (e) {
      // ignore: avoid_print
      printError(info: "Error");
    } finally {
      isLoading(false);
    }
  }

  late Top10Model top_soon;
  String url3 =
      "${_baseUrl}trending/tv/day?language=en-US&page=1&api_key=$_apiKey";
  gettop() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse(url3));
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        print(result);
        top_soon = Top10Model.fromJson(result);

        // ignore: avoid_print
        print("is at the time recived");
      } else {
        isLoading(false);
        // ignore: avoid_print
        print("is not recived");
      }
    } catch (e) {
      // ignore: avoid_print
      printError(info: "Error");
    } finally {
      isLoading(false);
    }
  }
}
