import 'package:demo_mobile/models/nowplaying_movie.dart';
import 'package:demo_mobile/presentation/dashboard/movies/movie_controller.dart';
import 'package:demo_mobile/themes/resources.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoviePage extends GetView<MovieController> {
  MoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    final totalData = controller.upSoon!.results.map((e) => e.backdropPath);
    final totalDataMovies = totalData.toList();

    // final upSoonInit = controller.upSoon = NowPlayModel(
    //     dates: Dates(maximum: DateTime.now(), minimum: DateTime.now()),
    //     page: 1,
    //     results: List.empty(),
    //     totalPages: 1,
    //     totalResults: 1);

    return Scaffold(
      backgroundColor: Resources.color.background,
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(
          top: 32,
          left: 20,
          right: 20,
        ),
        children: <Widget>[
          Row(
            children: [
              Text(
                "Movies Latest",
                style: TextStyle(
                  fontFamily: Resources.font.primaryFont,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 32,
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
            child: SizedBox(
              height: 650,
              child: ListView.builder(
                itemCount: totalDataMovies.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  final dataImage =
                      controller.upSoon!.results.map((e) => e.backdropPath);
                  final dataArray = dataImage.toList();
                  final titleApi =
                      controller.upSoon!.results.map((e) => e.title).toList();
                  final ratingApi = controller.upSoon!.results
                      .map((e) => e.voteAverage)
                      .toList();
                  // final dateApi = controller.upSoon.results
                  //     .map((e) => e.releaseDate)
                  //     .toList();
                  // final overviewApi =
                  //     controller.upSoon.results.map((e) => e.overview).toList();

                  return GestureDetector(
                      onTap: () {
                        Get.toNamed('/movie_detail');
                        if (kDebugMode) {
                          print("clicked");
                        }
                      },
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Column(
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.network(
                                    "https://image.tmdb.org/t/p/original${dataArray[index]}",
                                    width: double.infinity,
                                  ),
                                  SizedBox(height: 12.0),
                                  Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 12),
                                    child: Text(
                                      titleApi[index],
                                      style: TextStyle(
                                          color: Resources.color.hightlight,
                                          fontSize: 20),
                                    ),
                                  ),
                                  SizedBox(height: 8.0),
                                  Container(
                                    width: 120,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 8),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                        ),
                                        SizedBox(height: 8.0),
                                        Text(
                                          ratingApi[index].toString() + "/10",
                                          style: TextStyle(
                                            color: Resources.color.hightlight,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
