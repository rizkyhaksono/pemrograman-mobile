import 'dart:convert';

import 'package:demo_mobile/models/nowplaying_movie.dart';
import 'package:demo_mobile/models/toprated_movie.dart';
import 'package:demo_mobile/utils/apis/api.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  RxInt selectedIndex = 0.obs;

  RxInt selectedRecent = 0.obs;
  RxInt selectedRecommended = 0.obs;

  Top10Model? trendingMovie;
  NowPlayModel? nowSoon;

  @override
  void onInit() async {
    super.onInit();
    await getcomingsoon();
    await gettop();
  }

  List<String> categoryList = [
    "Thriller",
    "Drama",
    "Horror",
    "Fantasy",
    "Action",
  ];

  var isLoading = false.obs;
  var hasError = false.obs;
  var errorMessage = ''.obs;
  var hasData = false.obs;

  void handleCategorySelection(int index) {
    selectedIndex.value = index;
  }

  void handleRecentSelection(int index) {
    var test = selectedRecent.value = index;
    if (kDebugMode) {
      print(test);
    }
  }

  String url3 =
      "${BaseAPI.baseUrl}trending/movie/day?language=en-US&page=1&api_key=${BaseAPI.apiKey}";
  gettop() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse(url3));
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        print(result);
        trendingMovie = Top10Model.fromJson(result);

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

  String url =
      "${BaseAPI.baseUrl}movie/now_playing?language=en-US&page=1&api_key=${BaseAPI.apiKey}";
  getcomingsoon() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        print(result);
        nowSoon = NowPlayModel.fromJson(result);

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
}
