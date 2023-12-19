import 'dart:convert';
import 'package:http/http.dart' as http;

class TvService {
  final String apiUrl;
  final http.Client client;

  TvService(this.apiUrl, {required this.client});

  Future<List<String>> getPopularTvShows() async {
    final response = await client.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> results = data['results'];
      return results.map((result) => result['name'].toString()).toList();
    } else {
      throw Exception('Failed to load TV shows');
    }
  }
}
