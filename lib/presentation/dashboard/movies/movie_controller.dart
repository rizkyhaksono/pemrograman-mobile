import 'package:demo_mobile/utils/apis/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:demo_mobile/models/all_trending.dart';

class MovieController extends GetxController {
  RxInt selectedIndex = 0.obs;

  var isLoading = false.obs;
  var hasError = false.obs;
  var errorMessage = ''.obs;
  var hasData = false.obs;

  @override
  void onInit() async {
    super.onInit();
    await fetchTrendingData();
    update();
  }

  AllTrending? allTrending;

  final WebViewController movieWeb = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..loadRequest(Uri.parse('https://www.themoviedb.org/'));

  String _buildUrl(String path) {
    return "${BaseAPI.baseUrl}$path&api_key=${BaseAPI.apiKey}";
  }

  Future<void> fetchTrendingData() async {
    try {
      isLoading(true);
      final response = await http
          .get(Uri.parse(_buildUrl("trending/all/day?language=en-US")));
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        allTrending = AllTrending.fromJson(result);
        print(result);
        hasData(true);
      } else {
        isLoading(false);
        hasError(true);
        errorMessage("Failed to fetch trending data");
      }
    } catch (e) {
      isLoading(false);
      hasError(true);
      errorMessage("Error: $e");
      printError(info: "Error: $e");
    } finally {
      isLoading(false);
    }
  }
}
