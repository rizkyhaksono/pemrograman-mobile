import 'dart:convert';

import 'package:demo_mobile/models/movie_discover.dart' as MovieDiscoverModel;
import 'package:demo_mobile/models/tv_discover.dart' as TVDiscoverModel;
import 'package:demo_mobile/utils/apis/api.dart';
import 'package:demo_mobile/utils/database_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

enum MovieCategory {
  Thriller,
  Drama,
  Horror,
  Fantasy,
  Action,
}

class HomeController extends GetxController {
  final DatabaseController databaseController = Get.put(DatabaseController());

  RxInt selectedIndex = 0.obs;
  RxInt selectedRecent = 0.obs;
  var isLoading = false.obs;

  MovieDiscoverModel.MovieDiscover? movieDiscover;
  TVDiscoverModel.TvDiscover? tvDiscover;

  @override
  void onInit() async {
    super.onInit();
    await getMovieDiscover();
    await getTvDiscover();
    databaseController.fetchData();
  }

  List<MovieCategory> categoryList = [
    MovieCategory.Thriller,
    MovieCategory.Drama,
    MovieCategory.Horror,
    MovieCategory.Fantasy,
    MovieCategory.Action,
  ];

  void handleCategorySelection(int index) {
    selectedIndex.value = index;
  }

  void handleRecentSelection(int index) {
    selectedRecent.value = index;
    if (kDebugMode) {
      print(selectedRecent.value);
    }
  }

  String _buildUrl(String path) {
    return "${BaseAPI.baseUrl}$path&api_key=${BaseAPI.apiKey}";
  }

  Future<void> getTvDiscover() async {
    try {
      final response = await http.get(Uri.parse(
          "https://api.themoviedb.org/3/discover/tv?include_adult=false&include_null_first_air_dates=false&language=en-US&page=1&sort_by=popularity.desc&api_key=8ee16750c566b88be3d29a700cff3e73"));

      if (response.statusCode == 200) {
        tvDiscover =
            TVDiscoverModel.TvDiscover.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      printError(info: "Error fetching TV discover: $e");
    } finally {
      isLoading(false);
    }
  }

  Future<void> getMovieDiscover() async {
    try {
      final response = await http.get(Uri.parse(_buildUrl(
          "discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc")));
      if (response.statusCode == 200) {
        movieDiscover = MovieDiscoverModel.MovieDiscover.fromJson(
            jsonDecode(response.body));
      }
    } catch (e) {
      printError(info: "Error fetching movie discover: $e");
    } finally {
      isLoading(false);
    }
  }
}
