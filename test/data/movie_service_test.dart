import 'dart:convert';
import 'dart:typed_data';
import 'package:demo_mobile/service/movie_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

import 'movie_service_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group('MovieService', () {
    const apiUrl =
        'https://api.themoviedb.org/3/discover/tv?include_adult=false&include_null_first_air_dates=false&language=en-US&page=1&sort_by=popularity.desc&api_key=8ee16750c566b88be3d29a700cff3e73';

    test('fetches movies successfully from an API', () async {
      final client = MockClient();
      final movieService = MovieService(apiUrl, client: client);

      when(client.get(Uri.parse(apiUrl)))
          .thenAnswer((_) async => http.Response.bytes(
                Uint8List.fromList(utf8.encode(json.encode({
                  "page": 1,
                  "results": [
                    {
                      "adult": false,
                      "backdrop_path": "/1X7vow16X7CnCoexXh4H4F2yDJv.jpg",
                      "genre_ids": [80, 18, 36],
                      "id": 466420,
                      "original_language": "en",
                      "original_title": "Killers of the Flower Moon",
                      "overview":
                          "When oil is discovered in 1920s Oklahoma under Osage Nation land, the Osage people are murdered one by one—until the FBI steps in to unravel the mystery.",
                      "popularity": 1145.813,
                      "poster_path": "/dB6Krk806zeqd0YNp2ngQ9zXteH.jpg",
                      "release_date": "2023-10-18",
                      "title": "Killers of the Flower Moon",
                      "video": false,
                      "vote_average": 7.6,
                      "vote_count": 1476
                    },
                  ],
                }))),
                200,
              ));

      final movies = await movieService.getPopularMovies();

      expect(
        movies,
        ["Killers of the Flower Moon"],
      );

      verify(client.get(Uri.parse(apiUrl))).called(1);

      verifyNoMoreInteractions(client);
    });

    test('throws an exception if the API call fails', () async {
      final client = MockClient();
      final movieService = MovieService(apiUrl, client: client);

      when(client.get(Uri.parse(apiUrl)))
          .thenAnswer((_) async => http.Response('Error', 404));

      expect(() => movieService.getPopularMovies(), throwsException);

      verify(client.get(Uri.parse(apiUrl))).called(1);

      verifyNoMoreInteractions(client);
    });

    test('handles empty API response', () async {
      final client = MockClient();
      final movieService = MovieService(apiUrl, client: client);

      when(client.get(Uri.parse(apiUrl))).thenAnswer((_) async => http.Response(
            json.encode({"page": 1, "results": []}),
            200,
          ));

      final movies = await movieService.getPopularMovies();

      expect(
        movies,
        isEmpty,
      );

      verify(client.get(Uri.parse(apiUrl))).called(1);

      verifyNoMoreInteractions(client);
    });
  });
}
