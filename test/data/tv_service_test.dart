import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

import 'tv_service_test.mocks.dart';

import 'package:demo_mobile/service/tv_service.dart';

@GenerateMocks([http.Client])
void main() {
  group('TvService', () {
    const apiUrl =
        'https://api.themoviedb.org/3/discover/tv?include_adult=false&include_null_first_air_dates=false&language=en-US&page=1&sort_by=popularity.desc&api_key=8ee16750c566b88be3d29a700cff3e73';

    test('fetches TV shows successfully from an API', () async {
      final client = MockClient();
      final tvService = TvService(apiUrl, client: client);

      when(client.get(Uri.parse(apiUrl)))
          .thenAnswer((_) async => http.Response.bytes(
                Uint8List.fromList(utf8.encode(json.encode({
                  "page": 1,
                  "results": [
                    {
                      "id": 123,
                      "name": "Popular TV Show 1",
                      // Add more TV show entries as needed
                    },
                  ],
                }))),
                200,
              ));

      final tvShows = await tvService.getPopularTvShows();

      expect(
        tvShows,
        ["Popular TV Show 1"],
      );

      verify(client.get(Uri.parse(apiUrl))).called(1);

      verifyNoMoreInteractions(client);
    });

    test('throws an exception if the API call fails', () async {
      final client = MockClient();
      final tvService = TvService(apiUrl, client: client);

      when(client.get(Uri.parse(apiUrl)))
          .thenAnswer((_) async => http.Response('Error', 404));

      expect(() => tvService.getPopularTvShows(), throwsException);

      verify(client.get(Uri.parse(apiUrl))).called(1);

      verifyNoMoreInteractions(client);
    });

    test('handles empty API response', () async {
      final client = MockClient();
      final tvService = TvService(apiUrl, client: client);

      when(client.get(Uri.parse(apiUrl))).thenAnswer((_) async => http.Response(
            json.encode({"page": 1, "results": []}),
            200,
          ));

      final tvShows = await tvService.getPopularTvShows();

      expect(
        tvShows,
        isEmpty,
      );

      verify(client.get(Uri.parse(apiUrl))).called(1);

      verifyNoMoreInteractions(client);
    });
  });
}
