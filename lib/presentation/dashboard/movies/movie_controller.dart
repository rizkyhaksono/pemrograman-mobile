import 'package:demo_mobile/models/nowplaying_movie.dart';
import 'package:demo_mobile/models/toprated_movie.dart';
import 'package:demo_mobile/utils/apis/api.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MovieController extends GetxController {
  RxInt selectedIndex = 0.obs;

  void handleImageList(int index) {
    selectedIndex.value = index;
  }

  var isLoading = false.obs;
  var hasError = false.obs;
  var errorMessage = ''.obs;
  var hasData = false.obs;

  @override
  void onInit() async {
    super.onInit();
    await getup();
  }

  late NowPlayModel upSoon;
  String url2 =
      "${BaseAPI.baseUrl}movie/upcoming?language=en-US&page=1&api_key=${BaseAPI.apiKey}";
  getup() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse(url2));
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        print(result);
        upSoon = NowPlayModel.fromJson(result);

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
