import 'dart:convert';
import 'package:http/http.dart' as http;

class MovieService {
  final String apiUrl;
  final http.Client client;

  MovieService(this.apiUrl, {required this.client});

  Future<List<String>> getPopularMovies() async {
    final response = await client.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> results = data['results'];
      return results.map((result) => result['title'].toString()).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
